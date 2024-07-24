-- Tempo médio em dias entre vendas os sellers
-- apenas pedidos entregues

--row_number () over ( partition by data_venda, seller_id) as row_id

with tb_seller_order as (
    select 
        t1.order_id,
        date(t1.order_approved_at) as data_venda,
        t2.seller_id
        
    from tb_orders as t1

    left join tb_order_items as t2
    on t1.order_id = t2.order_id

    where order_status = 'delivered'
),

tb_seller_order_sort as (
    select
        *,
        -- remover duplicadas
        row_number () over ( partition by seller_id, data_venda) as row_id

    from tb_seller_order
),

tb_seller_lag_data as (
    select 
        order_id,
        seller_id,
        data_venda,
        lag(data_venda) over (partition by seller_id order by data_venda) as lag_data_venda

    from tb_seller_order_sort

    where row_id = 1
),

tb_tempo_venda_medio_seller as (
    select *,
            julianday(data_venda) - julianday(lag_data_venda) as diff_data

    from tb_seller_lag_data

    where diff_data is not null
)

select 
    seller_id,
    avg(diff_data) as tempo_medio

from tb_tempo_venda_medio_seller

group by seller_id

;
-- JEITO 2:
-- select 
--     seller_id,
--     avg(julianday(data_venda) - julianday(lag_data_venda)) as avg_diff_data

-- from tb_seller_lag_data

-- where lag_data_venda is not null

-- group by seller_id


-- JEITO 1:
-- select *,
--         julianday(data_venda) - julianday(lag_data_venda) as diff_data

-- from tb_seller_lag_data

-- where diff_data is not null
