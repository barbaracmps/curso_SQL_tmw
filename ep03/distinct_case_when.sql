select 
    -- renomear a categoria nula
    DISTINCT case when product_category_name is null then 'outros'
                else product_category_name 
            end as categorias_unicas

from tb_products
-- filtrar por categorias que não são nulas
-- where product_category_name is not NULL

-- order by categorias_unicas
order by 1 desc   