-- =============================================================================
-- EXPERT — Mərhələ 11 əlavə migrasiyası (Bildirişlər modulu — tətbiq daxili)
-- İstifadə: Supabase Dashboard → SQL Editor → New query → bu faylı tam
-- yapışdırıb "Run".
-- =============================================================================

-- notifications cədvəlini realtime nəşrinə əlavə et — bildiriş zəngi
-- (badge) canlı yenilənsin deyə (bax MIGRATION_10.sql-dəki eyni addım).
alter publication supabase_realtime add table public.notifications;

-- -----------------------------------------------------------------------------
-- Yeni usta sifarişi gələndə ustaya bildiriş
-- -----------------------------------------------------------------------------
create or replace function public.notify_new_worker_order()
returns trigger as $$
begin
  if new.target_type = 'worker' and new.target_id is not null then
    insert into public.notifications (user_id, type, title, body, payload)
    values (
      new.target_id,
      'new_order',
      'Yeni sifariş',
      'Sizə yeni sifariş daxil oldu',
      jsonb_build_object('order_id', new.id)
    );
  end if;
  return new;
end;
$$ language plpgsql security definer;

create trigger trg_orders_notify_new_worker_order
  after insert on public.orders
  for each row execute function public.notify_new_worker_order();

-- -----------------------------------------------------------------------------
-- Səbətdəki materiallar sifariş ediləndə mağaza sahibinə bildiriş
-- (order_items yalnız material sifarişlərində istifadə olunur — bax
-- MIGRATION_08.sql-dəki create_material_order funksiyası).
-- -----------------------------------------------------------------------------
create or replace function public.notify_new_material_order()
returns trigger as $$
declare
  v_owner_id uuid;
begin
  select s.owner_id into v_owner_id
  from public.materials m join public.shops s on s.id = m.shop_id
  where m.id = new.material_id;

  if v_owner_id is not null then
    insert into public.notifications (user_id, type, title, body, payload)
    values (
      v_owner_id,
      'new_order',
      'Yeni sifariş',
      'Mağazanıza yeni sifariş daxil oldu',
      jsonb_build_object('order_id', new.order_id, 'material_id', new.material_id)
    );
  end if;
  return new;
end;
$$ language plpgsql security definer;

create trigger trg_order_items_notify_new_material_order
  after insert on public.order_items
  for each row execute function public.notify_new_material_order();

-- -----------------------------------------------------------------------------
-- Yeni mesaj gələndə qarşı tərəfə bildiriş
-- -----------------------------------------------------------------------------
create or replace function public.notify_new_message()
returns trigger as $$
declare
  v_recipient uuid;
  v_sender_name text;
begin
  select case when c.participant_one = new.sender_id then c.participant_two else c.participant_one end
    into v_recipient
  from public.chats c where c.id = new.chat_id;

  select full_name into v_sender_name from public.profiles where id = new.sender_id;

  if v_recipient is not null then
    insert into public.notifications (user_id, type, title, body, payload)
    values (
      v_recipient,
      'new_message',
      coalesce(v_sender_name, 'Yeni mesaj'),
      coalesce(new.content, '[media]'),
      jsonb_build_object('chat_id', new.chat_id)
    );
  end if;
  return new;
end;
$$ language plpgsql security definer;

create trigger trg_messages_notify_new_message
  after insert on public.messages
  for each row execute function public.notify_new_message();

-- =============================================================================
-- Son. (price_drop və order_confirmed bildiriş növləri hələ heç bir UI axınına
-- bağlı olmadığı üçün qəsdən bu mərhələyə salınmadı — admin panel/mağaza
-- idarəetməsi qurulanda əlavə olunacaq.)
-- =============================================================================
