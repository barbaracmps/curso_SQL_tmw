-- opção 1: selecionar todos os selles que não venderam nos últimos 90d

with tb_marcacao_seller as (
    select 
        t2.seller_id,
        max(order_approved_at) as data_ultima_venda,
        '2018-07-01' as dia_atual,
        julianday('2018-07-01') - julianday(max(order_approved_at)) as dias_ultima_venda,
        case when julianday('2018-07-01') - julianday(max(order_approved_at)) > 90
            then 1 else 0
            end as flag_venda_90d

    from tb_orders as t1

    left join tb_order_items as t2
    on t1.order_id = t2.order_id

    where date(t1.order_approved_at) < '2018-07-01'
    and t1.order_status = 'delivered'

    group by t2.seller_id
)

select *
from tb_marcacao_seller

where flag_venda_90d = 1