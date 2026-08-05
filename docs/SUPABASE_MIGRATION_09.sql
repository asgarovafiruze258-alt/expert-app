-- =============================================================================
-- EXPERT — Mərhələ 9 əlavə migrasiyası (Layihə/büdcə modulu)
-- İstifadə: Supabase Dashboard → SQL Editor → New query → bu faylı tam
-- yapışdırıb "Run" (MIGRATION.sql və MIGRATION_08.sql artıq tətbiq olunduqdan sonra).
-- =============================================================================

-- projects.estimated_cost sütununu project_items-in cəmi ilə avtomatik
-- sinxron saxlayan trigger (workers.rating-i yeniləyən trigger-lə eyni
-- prinsip — bax MIGRATION.sql §3.3).
create or replace function public.update_project_estimated_cost()
returns trigger as $$
declare
  v_project_id uuid;
begin
  v_project_id := coalesce(new.project_id, old.project_id);
  update public.projects
  set estimated_cost = (
    select coalesce(sum(estimated_cost), 0) from public.project_items where project_id = v_project_id
  )
  where id = v_project_id;
  return coalesce(new, old);
end;
$$ language plpgsql security definer;

create trigger trg_project_items_update_estimated_cost
  after insert or update or delete on public.project_items
  for each row execute function public.update_project_estimated_cost();

-- =============================================================================
-- Son.
-- =============================================================================
