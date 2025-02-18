with 

source as (

    select * from {{ source('erp', 'products') }}

),

renamed as (

    select
        cast(id as int) as pk_produto,
        cast(supplierid as int) as fk_fornecedor,
        cast(categoryid as int) as fk_categoria,
        cast(productname as string) as productname,        
        cast(quantityperunit as string) as quantityperunit,
        cast(unitprice as numeric(18,2)) as unitprice,
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
