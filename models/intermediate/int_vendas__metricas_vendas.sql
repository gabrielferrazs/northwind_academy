with

orders as (
    select * 
    from {{ ref('stg_erp__orders') }}
)

, order_details as (
    select * 
    from {{ ref('stg_erp__order_details') }}
)

, joined as (
    select
    order_details.pk_pedido_item
    , order_details.fk_produto
    , orders.fk_funcionario
    , orders.fk_cliente
    , orders.fk_transportadora
    , orders.order_date
    , orders.required_date
    , orders.shipped_date    
    , order_details.unit_price
    , order_details.quantity
    , order_details.discount
    , orders.freight
    , orders.ship_name
    , orders.ship_address
    , orders.ship_city
    , orders.ship_region
    , orders.ship_country

    from order_details
    inner join orders 
        on order_details.fk_pedido = orders.pk_pedido
)

, metricas as (
    select
    pk_pedido_item
    , fk_produto
    , fk_funcionario
    , fk_cliente
    , fk_transportadora
    , order_date
    , required_date
    , shipped_date    
    , unit_price
    , quantity
    , discount
    , freight
    , unit_price * quantity as total_bruto
    , unit_price * (1 - discount) * quantity as total_liquido
    , case
        when discount > 0 then true
        else false
    end as have_discount
    , ship_name
    , ship_address
    , ship_city
    , ship_region
    , ship_country
    from joined
)

select *
from metricas