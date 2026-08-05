-- =============================================================================
-- EXPERT — Mərhələ 17 əlavə migrasiyası (İstifadəçilərin telefon nömrəsinin
-- kütləvi "scrape" olunmasının qarşısını almaq)
-- İstifadə: Supabase Dashboard → SQL Editor → New query → bu faylı tam
-- yapışdırıb "Run".
-- =============================================================================
--
-- Problem: "profiles_select_all" siyasəti (for select using (true)) hər kəsə
-- hər kəsin sətrini görməyə icazə verir — bu, worker/shop/review kartlarında
-- "full_name, avatar_url" göstərmək üçün lazımdır. Amma eyni açıqlıq
-- "phone" sütununa da şamil olur: açar sahibi olan istənilən kəs
-- (məs. /rest/v1/profiles?select=phone ilə) BÜTÜN istifadəçilərin telefon
-- nömrəsini toplu şəkildə çəkə bilər. RLS sətir səviyyəsində işlədiyi üçün
-- "hamı bu sətri görsün, amma bu sütunu yox" deyə bilmir — ona görə sütun
-- səviyyəsində ayrıca qıcıqlanma (GRANT/REVOKE) və məhdud RPC funksiyaları
-- lazımdır.
--
-- Həll:
--   1) "phone" sütununa birbaşa SELECT icazəsi ləğv olunur (heç kim, hətta
--      sahibi belə, adi sorğu ilə oxuya bilməz).
--   2) get_my_phone() — yalnız cari istifadəçinin öz nömrəsini qaytarır.
--   3) admin_list_profiles() — yalnız admin çağıranda bütün profilləri
--      (telefon daxil) qaytarır; admin panelindəki istifadəçi siyahısı
--      bunu istifadə edir.
-- =============================================================================

revoke select (phone) on public.profiles from authenticated, anon;

create or replace function public.get_my_phone()
returns text
language sql
security definer
set search_path = public
stable
as $$
  select phone from public.profiles where id = auth.uid();
$$;

grant execute on function public.get_my_phone() to authenticated;

create or replace function public.admin_list_profiles()
returns setof public.profiles
language sql
security definer
set search_path = public
stable
as $$
  select p.* from public.profiles p
  where exists (
    select 1 from public.profiles a where a.id = auth.uid() and a.role = 'admin'
  )
  order by p.created_at desc;
$$;

grant execute on function public.admin_list_profiles() to authenticated;

-- =============================================================================
-- Son.
-- =============================================================================
