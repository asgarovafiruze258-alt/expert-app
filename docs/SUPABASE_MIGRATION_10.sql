-- =============================================================================
-- EXPERT — Mərhələ 10 əlavə migrasiyası (Chat modulu)
-- İstifadə: Supabase Dashboard → SQL Editor → New query → bu faylı tam
-- yapışdırıb "Run".
-- =============================================================================

-- messages cədvəlini realtime nəşrinə (publication) əlavə et — bu olmadan
-- Flutter tərəfindəki canlı (realtime) mesaj axını işləməyəcək. RLS-lər
-- (messages_participants_select və s.) artıq MIGRATION.sql-də tətbiq olunub
-- və realtime abunəlikləri də onlara tabedir.
alter publication supabase_realtime add table public.messages;

-- =============================================================================
-- Son.
-- =============================================================================
