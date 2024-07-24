-- Ex2.: Qual o valor total de receita gerada por sellers de cada estado? Considere a base completa, com apenas pedidos entregues

-- tb_sellers: seller_id, seller_state
-- tb_order_items: seller_id,  sum(price)
-- tb_order_payments: order_id, sum(payment_value)
-- tb_orders: order_id, order_status = deliverd



select 
    t2.seller_state as estado,   
    round(cast((sum(t1.price)) as float), 2) as receita_total,
    sum(t1.price) / count(distinct t1.seller_id) as receita_media_seller

from tb_order_items as t1

left join tb_sellers as t2
on t1.seller_id = t2.seller_id

left join tb_orders as t3
on t1.order_id = t3.order_id

where t3.order_status = 'delivered'

group by t2.seller_state
order by receita_media_seller desc, t2.seller_state asc


