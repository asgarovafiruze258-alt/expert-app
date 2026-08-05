-- =============================================================================
-- EXPERT — Mərhələ 15 əlavə migrasiyası (Mağaza üçün xəritə koordinatları)
-- İstifadə: Supabase Dashboard → SQL Editor → New query → bu faylı tam
-- yapışdırıb "Run".
-- =============================================================================

alter table public.shops add column if not exists latitude double precision;
alter table public.shops add column if not exists longitude double precision;

-- =============================================================================
-- Son.
-- =============================================================================
