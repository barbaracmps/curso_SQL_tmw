select 
    DISTINCT case when product_category_name is null then 'outros'

                -- combinar campos usando OR
                when product_category_name = 'alimentos' 
                    or product_category_name = 'alimentos_bebidas' then 'alimentos'
                
                when product_category_name = 'portateis_cozinha_e_preparadores_de_alimentos' 
                    or product_category_name = 'portateis_casa_forno_e_cafe' then 'portateis_casa'
                
                -- combinação de campos usando IN em uma lista
                when product_category_name in ('artes', 'artes_e_artesanato') then 'artes'
                when product_category_name in ('casa_conforto', 'casa_conforto_2') then 'casa_conforto'
                when product_category_name in ('telefonia', 'telefonia_fixa') then 'telefonia'

                -- combinação de campos usando LIKE para palavras que contem o que está entre %
                when product_category_name like '%artigos%' then 'artigos'
                when product_category_name like '%construcao%' then 'construcao'
                when product_category_name like '%moveis%' then 'moveis'
                when product_category_name like '%fashion%' then 'fashion'
                when product_category_name like '%livros%' then 'livros'

                -- Caso não responda às condições acima, retorne o valor original
                else product_category_name 

            end as categorias_unicas

from tb_products
order by 1 asc