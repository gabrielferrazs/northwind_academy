with source as (
        select * from {{ source('erp', 'customers') }}
  ),
  renamed_customers as (
      select
        cast(id as string) as pk_cliente
        , cast(companyname as string) as companyname
        , cast(contactname as string) as contactname
        , cast(contacttitle as string) as contacttitle
        , cast(address as string) as address
        , cast(city as string) as city
        , cast(region as string) as region
        , cast(postalcode as varchar) as postalcode
        , cast(country as varchar) as country
        , cast(phone as varchar) as phone
        , cast(fax as varchar) as fax

      from source
  )
  select * from renamed_customers
    