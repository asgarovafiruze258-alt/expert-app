-- =============================================================================
-- EXPERT — Mərhələ 20 əlavə migrasiyası (Admin — bütün sifarişlərə baxış)
-- İstifadə: Supabase Dashboard → SQL Editor → New query → bu faylı tam
-- yapışdırıb "Run".
-- =============================================================================
--
-- Admin panelində "Sifarişlər" statistika qutusuna klik edəndə bütün
-- sifarişlərin siyahısı göstərilir. İndiyə qədər "orders" cədvəlində admin
-- üçün ayrıca SELECT siyasəti yox idi (yalnız sifarişi verən müştəri və
-- sifarişin hədəfi olan usta/mağaza sahibi görə bilirdi) — "workers_admin_all"
-- və "shops_admin_all" (Mərhələ 12) ilə eyni məntiqlə admin-ə tam oxuma
-- hüququ veririk.
-- =============================================================================

create policy "orders_admin_all" on public.orders
  for select using (
    exists (select 1 from public.profiles where id = auth.uid() and role = 'admin')
  );

-- =============================================================================
-- Son.
-- =============================================================================
