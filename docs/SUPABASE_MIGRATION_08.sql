-- =============================================================================
-- EXPERT — Mərhələ 8 əlavə migrasiyası (Materiallar modulu: səbət/sifariş)
-- İstifadə: Supabase Dashboard → SQL Editor → New query → bu faylı tam
-- yapışdırıb "Run" (docs/SUPABASE_MIGRATION.sql artıq tətbiq olunduqdan sonra).
-- =============================================================================

-- Çoxməhsullu (səbət) sifarişlərdə tək target_id kifayət etmir — order_items
-- cədvəli istifadə olunacağı üçün bu sütun artıq məcburi deyil.
alter table public.orders alter column target_id drop not null;

-- -----------------------------------------------------------------------------
-- order_items
-- -----------------------------------------------------------------------------
create table public.order_items (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references public.orders(id) on delete cascade,
  material_id uuid not null references public.materials(id),
  quantity int not null check (quantity > 0),
  unit_price numeric(10,2) not null,
  created_at timestamptz not null default now()
);

create index idx_order_items_order on public.order_items(order_id);
create index idx_order_items_material on public.order_items(material_id);

alter table public.order_items enable row level security;

create policy "order_items_select_participants" on public.order_items
  for select using (
    exists (
      select 1 from public.orders o
      where o.id = order_id
      and (
        o.customer_id = auth.uid()
        or exists (
          select 1 from public.materials m join public.shops s on s.id = m.shop_id
          where m.id = order_items.material_id and s.owner_id = auth.uid()
        )
      )
    )
  );

create policy "order_items_insert_own_order" on public.order_items
  for insert with check (
    exists (select 1 from public.orders where id = order_id and customer_id = auth.uid())
  );

-- Şəbət sifarişində orders sətrinin özü target_id boş olduğu üçün mövcud
-- "orders_select_target" siyasəti mağaza sahibinə görünmür — order_items
-- üzərindən əlaqəni yoxlayan əlavə siyasət.
create policy "orders_select_via_items" on public.orders
  for select using (
    exists (
      select 1 from public.order_items oi
      join public.materials m on m.id = oi.material_id
      join public.shops s on s.id = m.shop_id
      where oi.order_id = orders.id and s.owner_id = auth.uid()
    )
  );

-- -----------------------------------------------------------------------------
-- Səbət checkout-unu atomik edən funksiya: bir orders sətri + N order_items
-- sətri tək transaksiyada yaranır (checkout yarımçıq qalıb boş sifariş
-- yaratmasın deyə).
-- -----------------------------------------------------------------------------
create or replace function public.create_material_order(
  p_items jsonb, -- [{"material_id": "...", "quantity": 2, "unit_price": 45.0}, ...]
  p_address text,
  p_scheduled_date timestamptz,
  p_notes text
) returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_order_id uuid;
  v_total numeric(10,2);
begin
  select coalesce(sum((item->>'quantity')::int * (item->>'unit_price')::numeric), 0)
    into v_total
    from jsonb_array_elements(p_items) as item;

  insert into public.orders (customer_id, target_type, target_id, status, total_price, address, scheduled_date, notes)
  values (auth.uid(), 'material', null, 'pending', v_total, p_address, p_scheduled_date, p_notes)
  returning id into v_order_id;

  insert into public.order_items (order_id, material_id, quantity, unit_price)
  select v_order_id, (item->>'material_id')::uuid, (item->>'quantity')::int, (item->>'unit_price')::numeric
  from jsonb_array_elements(p_items) as item;

  return v_order_id;
end;
$$;

grant execute on function public.create_material_order(jsonb, text, timestamptz, text) to authenticated;

-- =============================================================================
-- Son.
-- =============================================================================