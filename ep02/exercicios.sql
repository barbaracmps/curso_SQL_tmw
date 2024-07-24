
--Ex2. Faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria

select  product_category_name,
        count(product_id) as total_produtos,
        avg(product_name_lenght) as tamanho_nome_medio,
        max(product_name_lenght) as tamanho_nome_maximo,
        min(product_name_lenght) as tamanho_nome_minimo

from tb_products

where product_category_name is not null

group by product_category_name

--Ex3. Faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria. Considere apenas os objetos que tenham a descrição maior que 100.

select  product_category_name,
        count(product_id) as total_produtos,
        avg(product_name_lenght) as tamanho_nome_medio,
        max(product_name_lenght) as tamanho_nome_maximo,
        min(product_name_lenght) as tamanho_nome_minimo

from tb_products

where product_category_name is not null
and product_name_lenght > 50

group by product_category_name 


--Ex4. Faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria. Considere apenas os objetos que tenham a descrição maior que 100. Exiba apenas as categorias com tamanho médio de descrição do objeto maior que 500 caracteres.


select  product_category_name,
        count(product_id) as total_produtos,
        avg(product_name_lenght) as tamanho_nome_medio,
        max(product_name_lenght) as tamanho_nome_maximo,
        min(product_name_lenght) as tamanho_nome_minimo

from tb_products

where product_category_name is not null
and product_name_lenght > 50

group by product_category_name
having tamanho_nome_medio > 100
order by tamanho_nome_medio desc, tamanho_nome_maximo desc