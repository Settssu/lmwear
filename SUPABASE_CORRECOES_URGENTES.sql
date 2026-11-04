-- LM WEAR | correção urgente de preços e inclusão dos Air Force 1 básicos
-- Executar no Supabase SQL Editor depois de publicar os ficheiros do site.
update public.products set price = 52.16 where category = 'air force 1' and external_id not in ('lm203','lm204');
update public.products set price = 76.70 where category = 'lego technic' and external_id not in ('lm099','lm100');
update public.products set price = 70.48 where external_id = 'lm099';
update public.products set price = 152.86 where external_id = 'lm100';
insert into public.products (external_id, slug, name, description, category, price, currency, image_url, images, sizes, colors, is_active, stock_status)
values
('lm203','nike-air-force-1-basicas-pretas-lm203','Nike Air Force 1 Básicas — Pretas','Nike Air Force 1 Básicas — Pretas — selecionado pela LM WEAR.','air force 1',27.40,'EUR','assets/p203.jpg','["assets/p203.jpg"]'::jsonb,ARRAY['36','37','38','39','40','41','42','43','44','45','46']::text[],ARRAY[]::text[],true,'available'),
('lm204','nike-air-force-1-basicas-brancas-lm204','Nike Air Force 1 Básicas — Brancas','Nike Air Force 1 Básicas — Brancas — selecionado pela LM WEAR.','air force 1',27.40,'EUR','assets/p204.jpg','["assets/p204.jpg"]'::jsonb,ARRAY['36','37','38','39','40','41','42','43','44','45','46']::text[],ARRAY[]::text[],true,'available')
on conflict (external_id) do update set name=excluded.name, description=excluded.description, category=excluded.category, price=excluded.price, image_url=excluded.image_url, images=excluded.images, sizes=excluded.sizes, is_active=true, stock_status='available';
