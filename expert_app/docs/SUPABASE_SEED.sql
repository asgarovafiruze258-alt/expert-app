-- =============================================================================
-- EXPERT — Nümunə istinad məlumatları (Kateqoriyalar)
-- İstifadə: Supabase Dashboard → SQL Editor → yapışdırıb "Run"
-- Qeyd: workers/materials/shops cədvəlləri real istifadəçi qeydiyyatı (auth.users)
-- tələb etdiyi üçün buraya seed edilmir — onlar Mərhələ 7/8-də usta/mağaza
-- onboarding axını qurulduqdan sonra real qeydiyyatla yaranacaq.
-- =============================================================================

insert into public.categories (name, name_en, name_ru, type) values
  ('Santexnik', 'Plumber', 'Сантехник', 'worker'),
  ('Elektrik', 'Electrician', 'Электрик', 'worker'),
  ('Rəngsaz', 'Painter', 'Маляр', 'worker'),
  ('Kafelçi', 'Tiler', 'Плиточник', 'worker'),
  ('Dülgər', 'Carpenter', 'Плотник', 'worker'),
  ('Qapı-pəncərə ustası', 'Door & window installer', 'Установщик дверей и окон', 'worker'),
  ('Gips-karton ustası', 'Drywall installer', 'Гипсокартонщик', 'worker'),
  ('Dizayner', 'Interior designer', 'Дизайнер интерьера', 'worker'),
  ('Kondisioner ustası', 'AC technician', 'Мастер по кондиционерам', 'worker'),
  ('Ümumi təmir ustası', 'General handyman', 'Мастер на все руки', 'worker'),

  ('Boya və lak', 'Paint & varnish', 'Краска и лак', 'material'),
  ('Kafel və santexnika', 'Tiles & plumbing fixtures', 'Плитка и сантехника', 'material'),
  ('Elektrik materialları', 'Electrical supplies', 'Электротовары', 'material'),
  ('Taxta və mebel materialları', 'Wood & furniture materials', 'Дерево и мебельные материалы', 'material'),
  ('Tikinti qarışıqları', 'Building mixes', 'Строительные смеси', 'material');
