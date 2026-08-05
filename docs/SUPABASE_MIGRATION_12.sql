-- =============================================================================
-- EXPERT — Mərhələ 12 əlavə migrasiyası (Admin panel)
-- İstifadə: Supabase Dashboard → SQL Editor → New query → bu faylı tam
-- yapışdırıb "Run".
-- =============================================================================

-- shops cədvəli üçün admin-in tam CRUD (təsdiq/rədd) hüququ — əvvəllər
-- yalnız mağaza sahibinin özü (shops_owner_write) icazəsi var idi.
create policy "shops_admin_all" on public.shops
  for all using (
    exists (select 1 from public.profiles where id = auth.uid() and role = 'admin')
  );

-- Admin-in istifadəçi rolunu dəyişə bilməsi üçün (profiles_update_own yalnız
-- öz sətrini redaktəyə icazə verirdi).
create policy "profiles_admin_update" on public.profiles
  for update using (
    exists (select 1 from public.profiles p where p.id = auth.uid() and p.role = 'admin')
  );

-- =============================================================================
-- Son. Özünüzü admin etmək üçün (tətbiqdə bunu edəcək UI qəsdən yoxdur —
-- təhlükəsizlik səbəbindən yalnız SQL Editor-dan bir dəfəlik edilir):
--
--   update public.profiles set role = 'admin' where id = '<sizin-user-id>';
--
-- user-id-ni Supabase Dashboard → Authentication → Users bölməsindən tapa
-- bilərsiniz.
-- =============================================================================
