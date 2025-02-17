with 

source as (

    select * from {{ source('erp', 'order_details') }}

),

renamed_details as (

    select
        orderid::varchar || '-' || productid::varchar as pk_pedido_item
        , cast(orderid as int) as fk_pedido
        , cast(productid as int) as fk_produto
        , cast(unitprice as numeric(18,2)) as unit_price
        , cast(quantity as int) as quantity
        , cast(discount as numeric(18,2)) as discount

    from source

)

select * from renamed_details
