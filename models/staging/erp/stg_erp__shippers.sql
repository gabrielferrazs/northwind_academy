with source as (
        select * from {{ source('erp', 'shippers') }}
  ),
  renamed_shippers as (
      select
        cast(id as int) as pk_transportadora
        , cast(companyname as varchar) as companyname
        , cast(phone as varchar) as phone

      from source
  )
  select * from renamed_shippers
    