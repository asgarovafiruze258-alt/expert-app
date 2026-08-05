-- =============================================================================
-- EXPERT — Mərhələ 19 əlavə migrasiyası (Bütün istifadəçilər üçün əlaqə
-- nömrəsi + doğum tarixi)
-- İstifadə: Supabase Dashboard → SQL Editor → New query → bu faylı tam
-- yapışdırıb "Run".
-- =============================================================================
--
-- İndiyə qədər "phone" yalnız telefonla (OTP) qeydiyyatdan keçənlərdə dolur —
-- email ilə qeydiyyatdan keçib sadəcə müştəri qalan istifadəçilərin heç bir
-- əlaqə nömrəsi olmur. Bu migrasiya "date_of_birth" sütununu əlavə edir və
-- profil redaktəsi ekranından HƏR İSTİFADƏÇİ (müştəri/usta/mağaza sahibi)
-- öz nömrəsini və doğum tarixini özü daxil edə bilsin deyə app tərəfini də
-- buna uyğunlaşdırırıq.
--
-- "phone" üçün SUPABASE_MIGRATION_17.sql-də olduğu kimi, "date_of_birth" da
-- həssas sayılır (yaş məlumatı) — birbaşa sorğu ilə oxunması bağlanır, yalnız
-- sahibi (özü) və admin görə bilər.
-- =============================================================================

alter table public.profiles add column if not exists date_of_birth date;

revoke select (date_of_birth) on public.profiles from authenticated, anon;

-- get_my_phone() (Mərhələ 17) əvəzinə hər ikisini tək sorğuda qaytarır —
-- köhnə funksiya toxunulmadan qalır (əvvəlki APK versiyaları hələ də işləsin).
create or replace function public.get_my_private_fields()
returns table(phone text, date_of_birth date)
language sql
security definer
set search_path = public
stable
as $$
  select phone, date_of_birth from public.profiles where id = auth.uid();
$$;

grant execute on function public.get_my_private_fields() to authenticated;

-- =============================================================================
-- Son.
-- =============================================================================
