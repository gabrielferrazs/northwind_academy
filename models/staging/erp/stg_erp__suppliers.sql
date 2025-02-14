with renamed_suppliers as (

    select
        cast(id as int) as pk_suppliers,
        companyname,
        city,
        country

    from {{ source('erp', 'suppliers') }}

)

select * from renamed_suppliers
