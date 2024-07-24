-- Ex1: Qual o valor total de receita gerada por clientes de cada estado? Considere a base completa, com apenas pedidos entregues

-- tb_customers: customer_id, customer_state
-- tb_orders: order_id, customer_id, order_status = deliverd
-- tb_order_payments: order_id, sum(payment_value)

select
    t1.customer_state as estado,
    round(cast((sum(t3.payment_value)) as float), 2) as receita_total,
    sum(t3.payment_value) / count(distinct t1.customer_id) as avg_receita_cliente

from tb_customers as t1

left join tb_orders as t2
on t1.customer_id = t2.customer_id

left join tb_order_payments as t3
on t2.order_id = t3.order_id

where t2.order_status = 'delivered'

group by t1.customer_state
order by receita_total