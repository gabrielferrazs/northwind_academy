with

category as (
    select * 
    from {{ ref('stg_erp__category') }}
)

, products as (
    select * 
    from {{ ref('stg_erp__products') }}
)

, suppliers as (
    select * 
    from {{ ref('stg_erp__suppliers') }}
)

, cte_enriquecer_procutos as (
    select 
    p.PK_PRODUTO
    , p.PRODUCTNAME
    , p.QUANTITYPERUNIT
    , p.UNITPRICE
    , p.UNITSINSTOCK
    , p.UNITSONORDER
    , p.REORDERLEVEL
    , p.DISCONTINUED
    , c.categoryname
    , s.companyname
    , s.city
    , s.country
    from products p
    left join category c on p.fk_categoria = c.pk_category
    left join  suppliers s on p.fk_fornecedor = s.pk_suppliers

)

select * from cte_enriquecer_procutos