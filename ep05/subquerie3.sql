
-- a receita por estado do seller, por produto da categoria mais vendid

select 
    t2.seller_state,   
    t1.product_id,
    t3.product_category_name,
    sum(t1.price) as receita_total

from tb_order_items as t1

left join tb_sellers as t2
on t1.seller_id = t2.seller_id

left join tb_products as t3
on t1.product_id = t3.product_id

-- jeito SubQuerie 3 - com inner join e sem where
inner join (
        select  t2.product_category_name
        from tb_order_items as t1

        left join tb_products as t2
        on t1.product_id = t2.product_id

        group by t2.product_category_name
        order by count(*) desc

        limit 3
) as t4
on t3.product_category_name = t4.product_category_name

-- jeito SubQuerie2 - com left join usando a subquerie como uma tabela temporária e filtrando por valores com 1 ou valores não nulos.
-- left join (
--         select  t2.product_category_name,
--                 1 as flag_categoria
--         from tb_order_items as t1
--         left join tb_products as t2
--         on t1.product_id = t2.product_id
--         group by t2.product_category_name
--         order by count(*) desc
--         limit 3
-- ) as t4
-- on t3.product_category_name = t4.product_category_name

-- where t4.flag_categoria = 1
--- where t4.product_category_name is not null

-- jeito SubQuerie1 - com where in com subquerie
-- where t3.product_category_name in (

--         select t2.product_category_name
--         from tb_order_items as t1
--         left join tb_products as t2
--         on t1.product_id = t2.product_id
--         group by t2.product_category_name
--         order by count(*) desc
--         limit 1
-- )

group by t2.seller_state,
         t1.product_id
order by receita_total desc;