with 
    dim_products as (
        select *
        from {{ ref('int_vendas__prep_products') }}
    )

select * 
from dim_products