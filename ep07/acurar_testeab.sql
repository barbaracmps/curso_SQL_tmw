with tb_venda as (

    select *
    from tb_orders as t1

    left join tb_order_items as t2
    on t1.order_id = t2.order_id

    where date(t1.order_approved_at) >= '2018-07-01'
    and date(t1.order_approved_at) < '2018-07-11'
)

select  t1.flag_controle,
        case when t1.flag_controle = 0
            then 'Caso' else 'Controle'
            end as tipo_grupo,

        avg(t2.price) as avg_venda,
        count(distinct t1.seller_id) as tamanho_amostra,
        count(distinct t2.seller_id) as sellers_venderam,
        cast(count(distinct t2.seller_id) as float) / cast(count(distinct t1.seller_id) as float) as tx_conv


from tb_audiencia_venda as t1

left join tb_venda as t2
on t1.seller_id = t2.seller_id

group by t1.flag_controle