select 
    distinct 
        coalesce(product_category_name, 'outros') as categorias_unicas

from tb_products
order by categorias_unicas