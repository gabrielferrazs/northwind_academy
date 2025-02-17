with 

source as (

    select * from {{ source('erp', 'products') }}

),

renamed as (

    select
        cast(ID as int) as pk_produto,
        cast(SUPPLIERID as int) as fk_fornecedor,
        cast(CATEGORYID as int) as fk_categoria,
        cast(productname as string) as productname,        
        cast(quantityperunit as string) as quantityperunit,
        cast(UNITPRICE as numeric(18,2)) as UNITPRICE,
        cast(unitsinstock as int) as unitsinstock,
        cast(unitsonorder as int) as unitsonorder,
        cast(reorderlevel as int) as reorderlevel,
        case
            when discontinued = '1' then true
            when discontinued = '0' then false
            else null
        end as discontinued

    from source

)

select * from renamed
