-- =============================================================================
-- EXPERT — Mərhələ 16 əlavə migrasiyası (Kritik təhlükəsizlik düzəlişi:
-- həssas sütunların özünütəhrifi)
-- İstifadə: Supabase Dashboard → SQL Editor → New query → bu faylı tam
-- yapışdırıb "Run".
-- =============================================================================
--
-- Problem: "profiles_update_own", "workers_update_own" və "shops_owner_write"
-- siyasətləri YALNIZ "bu sətir mənimdir?" yoxlayır — HANSI sütunların
-- dəyişdiyini yoxlamır. Nəticədə istənilən istifadəçi tətbiqi keçib birbaşa
-- Supabase REST API-ə (öz JWT-si ilə) sorğu göndərərək:
--   • öz "role" sütununu 'admin' edə bilər (tam admin icazəsi ələ keçirmək),
--   • öz usta/mağaza profilini admin təsdiqindən keçmədən "is_approved=true"
--     edə bilər,
--   • sifarişin "total_price"/"customer_id"/"target_id" sahələrini dəyişə bilər.
--
-- Həll: hər cədvələ BEFORE UPDATE trigger əlavə edirik — admin olmayan
-- istifadəçi bu sahələri dəyişməyə çalışsa, trigger onları səssizcə köhnə
-- qiymətinə qaytarır (əməliyyatın qalan hissəsi işləməyə davam edir, sadəcə
-- qorunan sahələr toxunulmaz qalır).
-- =============================================================================

-- -----------------------------------------------------------------------------
-- profiles.role / profiles.is_verified — yalnız admin dəyişə bilər
-- -----------------------------------------------------------------------------
create or replace function public.protect_profile_admin_fields()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  if auth.uid() is not null and not exists (
    select 1 from public.profiles where id = auth.uid() and role = 'admin'
  ) then
    new.role := old.role;
    new.is_verified := old.is_verified;
  end if;
  return new;
end;
$$;

drop trigger if exists profiles_protect_admin_fields on public.profiles;
create trigger profiles_protect_admin_fields
  before update on public.profiles
  for each row execute function public.protect_profile_admin_fields();

-- -----------------------------------------------------------------------------
-- workers.is_approved / rating / review_count — yalnız admin (təsdiq) və ya
-- server (rəy sistemi) dəyişməlidir, usta özü yox
-- -----------------------------------------------------------------------------
create or replace function public.protect_worker_admin_fields()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  if auth.uid() is not null and not exists (
    select 1 from public.profiles where id = auth.uid() and role = 'admin'
  ) then
    new.is_approved := old.is_approved;
    new.rating := old.rating;
    new.review_count := old.review_count;
  end if;
  return new;
end;
$$;

drop trigger if exists workers_protect_admin_fields on public.workers;
create trigger workers_protect_admin_fields
  before update on public.workers
  for each row execute function public.protect_worker_admin_fields();

-- -----------------------------------------------------------------------------
-- shops.is_approved / rating / owner_id — yalnız admin dəyişə bilər
-- -----------------------------------------------------------------------------
create or replace function public.protect_shop_admin_fields()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  if auth.uid() is not null and not exists (
    select 1 from public.profiles where id = auth.uid() and role = 'admin'
  ) then
    new.is_approved := old.is_approved;
    new.rating := old.rating;
    new.owner_id := old.owner_id;
  end if;
  return new;
end;
$$;

drop trigger if exists shops_protect_admin_fields on public.shops;
create trigger shops_protect_admin_fields
  before update on public.shops
  for each row execute function public.protect_shop_admin_fields();

-- -----------------------------------------------------------------------------
-- orders — iştirakçılar yalnız "status" (və "notes") dəyişə bilər;
-- qiymət/tərəflər sifariş yarandıqdan sonra dəyişməz qalmalıdır
-- -----------------------------------------------------------------------------
create or replace function public.protect_order_core_fields()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  new.customer_id := old.customer_id;
  new.target_type := old.target_type;
  new.target_id := old.target_id;
  new.total_price := old.total_price;
  new.created_at := old.created_at;
  return new;
end;
$$;

drop trigger if exists orders_protect_core_fields on public.orders;
create trigger orders_protect_core_fields
  before update on public.orders
  for each row execute function public.protect_order_core_fields();

-- =============================================================================
-- Son.
-- =============================================================================
