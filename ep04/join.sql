select  t1.order_id,
        t1.order_item_id,
        t1.product_id,
        t1.price,
        t2.product_category_name

from tb_order_items as t1   -- tabela de itens

left join tb_products as t2 -- tabela de produtos
on t1.product_id = t2.product_id
limit 10

