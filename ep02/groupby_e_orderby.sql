SELECT 
    product_category_name as nome_categoria,
    count(product_category_name) as quantidade,  
    max(product_weight_g) as meior_peso,
    min(product_weight_g) as menor_peso,
    avg(product_weight_g) as media_peso_g

from tb_products

where product_category_name is not null
-- and product product_category_name != 'automotivo'

group by product_category_name
order by count(product_category_name) desc