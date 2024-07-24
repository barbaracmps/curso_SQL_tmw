-- Qual o produto campeão de vendas que cada seller já vendeu? (qtde)
-- E qual o produto mais caro que cada seller já vendeu? (valor)
-- considere pedidos entregues

-- primeir teste barbara: 2970

with tb_seller_product as(
    select 
        seller_id,
        product_id,
        count(*) as qtde_produto,
        sum(price) as receita_total

    from tb_orders as t1

    left join tb_order_items as t2
    on t1.order_id = t2.order_id

    where t1.order_status = 'delivered'

    group by seller_id, 
            product_id

    order by seller_id desc, qtde_produto desc, receita_total desc
)

select 
    seller_id,
    product_id,
    max(qtde_produto)

from tb_seller_product

group by seller_id
order by qtde_produto desc


