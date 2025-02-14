with 

source as (

    select * from {{ source('erp', 'category') }}

),

renamed as (

    select
        cast(id as int) as pk_category,
        cast(categoryname as varchar) as categoryname,
        cast(description as varchar) as category_description

    from source

)

select * from renamed

