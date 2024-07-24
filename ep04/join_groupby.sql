select  t2.product_category_name,
        sum(t1.price) as receita_total,
        count(*) as total_unidades_vendidas,
        count(distinct t1.order_id) as quantidade_pedidos,
        round(count(*) / cast((count(distinct t1.order_id) ) as float) , 2) as avg_items_pedido
        

-- count(distinct t1.order_id) as total_vendas,
-- sum(t1.order_item_id) as total_itens_vendidos,
-- count(distinct t1.product_id) as total_produtos,

from tb_order_items as t1

left join tb_products as t2
on t1.product_id = t2.product_id

group by t2.product_category_name

order by avg_items_pedido desc



