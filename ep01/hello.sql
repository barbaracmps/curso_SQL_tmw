
-- 1. Quantos produtos de 'beleza_saude' com menos de 1 litro?
-- select count(product_id)

-- from tb_products

-- where product_category_name = 'beleza_saude' 
-- and product_weight_g < 1000

-- Resposta: 1680

-- 2. Quantos produtos na categoria 'artes'?
-- select count(product_id)

-- from tb_products

-- where product_category_name = 'artes' 
-- Resposta: 55


-- 3. Quantos produtos com mais de 5 litros?

select count(product_id)

from tb_products

where product_weight_g > 5000

-- Resposta: 4153