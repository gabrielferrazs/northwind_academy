with 
    fct_vendas as (
        select *
        from {{ ref('int_vendas__metricas_vendas') }}
    )

select * 
from fct_vendas