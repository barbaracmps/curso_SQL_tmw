drop table if exists tb_audiencia_venda;
create table tb_audiencia_venda as 
with tb_marcacao_seller as (

    select 
        t2.seller_id,
        max(t1.order_approved_at) as data_ultima_venda,
       
        '2018-07-01' as dia_atual,
        
        julianday('2018-07-01') - julianday(max(t1.order_approved_at)) as dias_ultima_venda,
        
        case when julianday('2018-07-01') - julianday(max(t1.order_approved_at)) > 90
            then 1 else 0
            end as flag_venda_90d,
       
        t3.tempo_medio,
        
        case when julianday('2018-07-01') - julianday(max(t1.order_approved_at)) > t3.tempo_medio
            then 1 else 0
            end as flag_tempo_medio

    from tb_orders as t1

    left join tb_order_items as t2
    on t1.order_id = t2.order_id

    left join tb_avg_compra_seller as t3
    on t2.seller_id = t3.seller_id


    where date(t1.order_approved_at) < '2018-07-01'
    and t1.order_status = 'delivered'

    group by t2.seller_id
)

select  seller_id,
        case when abs(random() % 1000) / 1000. <= 0.1
            then 1 else 0
            end as flag_controle

from tb_marcacao_seller

where flag_tempo_medio = 1;