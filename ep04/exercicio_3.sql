-- Qual o peso médio dos produtos vendidos por sellers de cada estado? Considere apenas o ano de 2017 e pedidos entregues nesta análise.

-- tb_products: product_id, product_weight_g
-- tb_orders: order_id, order_status = 'deliverd', order_approved_at = strftime('%Y', order_approved_at) = '2017'	
-- tb_order_itens: order_id, product_id, seller_id, sum(price)
-- tb_sellers: seller_id, seller_state


select 
    t4.seller_state as estado,
    count(DISTINCT t1.product_id) as qtde_produtos_vendidos,
    round(cast((avg(t2.product_weight_g)) as float) , 2) as peso_medio_g,
    round(cast(avg(t2.product_weight_g) as float) / 1000 , 2) as peso_medio_kg

from tb_order_items as t1

left join tb_products as t2
on t1.product_id = t2.product_id

left join tb_orders as t3
on t1.order_id = t3.order_id

left join tb_sellers as t4
on t1.seller_id = t4.seller_id

where t3.order_status = 'delivered'
and strftime('%Y', t3.order_approved_at) = '2017'

group by t4.seller_state
order by qtde_produtos_vendidos desc, peso_medio_kg desc