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
    order_details.PK_PEDIDO_ITEM
    , order_details.FK_PRODUTO
    , orders.FK_FUNCIONARIO
    , orders.fk_cliente
    , orders.FK_TRANSPORTADORA
    , orders.ORDER_DATE
    , orders.REQUIRED_DATE
    , orders.SHIPPED_DATE    
    , order_details.UNIT_PRICE
    , order_details.QUANTITY
    , order_details.DISCOUNT
    , orders.FREIGHT
    , orders.SHIP_NAME
    , orders.SHIP_ADDRESS
    , orders.SHIP_CITY
    , orders.SHIP_REGION
    , orders.SHIP_COUNTRY

    from order_details
    inner join orders 
        on order_details.fk_pedido = orders.pk_pedido
)

, metricas as (
    select
    PK_PEDIDO_ITEM
    , FK_PRODUTO
    , FK_FUNCIONARIO
    , fk_cliente
    , FK_TRANSPORTADORA
    , ORDER_DATE
    , REQUIRED_DATE
    , SHIPPED_DATE    
    , UNIT_PRICE
    , QUANTITY
    , DISCOUNT
    , FREIGHT
    , UNIT_PRICE * QUANTITY as total_bruto
    , UNIT_PRICE * (1 - DISCOUNT) * QUANTITY as total_liquido
    , case
        when discount > 0 then true
        else false
    end as Have_DISCOUNT
    , SHIP_NAME
    , SHIP_ADDRESS
    , SHIP_CITY
    , SHIP_REGION
    , SHIP_COUNTRY
    from joined
)

select *
from metricas