with 
    dim_shippers as (
        select *
        from {{ ref('int_vendas__info_shippers') }}
    )

select * 
from dim_shippers