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

where t3.product_category_name = 'cama_mesa_banho'

group by t2.seller_state,
         t1.product_id
order by receita_total desc;

/* NOVA QUERY */
select 
    t2.product_category_name,
    count(*) as vendas

from tb_order_items as t1

left join tb_products as t2
on t1.product_id = t2.product_id

group by t2.product_category_name
order by vendas desc