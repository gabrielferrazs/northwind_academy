with 

source as (

    select * from {{ source('erp', 'orders') }}

),

renamed_orders as (

    select
        cast(id as int) as pk_pedido
        , cast(customerid as string) as fk_cliente
        , cast(employeeid as string) as fk_funcionario
        , cast(shipvia as int) as fk_transportadora
        , cast(orderdate as date) as order_date
        , cast(requireddate as date) as required_date
        , cast(shippeddate as date) as shipped_date
        , cast(freight as numeric) as freight
        , cast(shipname as string) as ship_name
        , cast(shipaddress as string) as ship_address
        , cast(shipcity as string) as ship_city
        , cast(shipregion as string) as ship_region
        --, cast(shippostalcode as int) as shippostalcode
        , cast(shipcountry as string) as ship_country

    from source

)

select * from renamed_orders
