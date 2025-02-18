with 
    dim_customers as (
        select *
        from {{ ref('int_vendas__info_customers') }}
    )

select * 
from dim_customers