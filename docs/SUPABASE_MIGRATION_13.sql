-- =============================================================================
-- EXPERT — Mərhələ 13 əlavə migrasiyası (orders/order_items RLS sonsuz
-- rekursiya düzəlişi)
-- İstifadə: Supabase Dashboard → SQL Editor → New query → bu faylı tam
-- yapışdırıb "Run".
-- =============================================================================

-- Problem: "orders_select_via_items" siyasəti (orders) order_items-i sorğulayır,
-- "order_items_select_participants" siyasəti (order_items) isə orders-u
-- sorğulayır — bu qarşılıqlı asılılıq Postgres-də
-- "infinite recursion detected in policy for relation orders" xətasına səbəb olur.
--
-- Həll: mağaza sahibinin sifarişə aidiyyatını yoxlayan sorğunu SECURITY DEFINER
-- funksiyaya çıxarırıq. Bu funksiya cədvəl sahibi kimi işlədiyi üçün
-- order_items üzərindəki RLS-i yenidən tetiklə(t)mir və dövr qırılır.
create or replace function public.is_order_shop_owner(p_order_id uuid, p_owner uuid)
returns boolean
language sql
security definer
set search_path = public
stable
as $$
  select exists (
    select 1
    from public.order_items oi
    join public.materials m on m.id = oi.material_id
    join public.shops s on s.id = m.shop_id
    where oi.order_id = p_order_id and s.owner_id = p_owner
  );
$$;

grant execute on function public.is_order_shop_owner(uuid, uuid) to authenticated;

drop policy if exists "orders_select_via_items" on public.orders;
create policy "orders_select_via_items" on public.orders
  for select using (public.is_order_shop_owner(orders.id, auth.uid()));

-- =============================================================================
-- Son.
-- =============================================================================
