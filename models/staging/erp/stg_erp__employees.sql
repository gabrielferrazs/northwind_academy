with 

source as (

    select * from {{ source('erp', 'employees') }}

),

renamed_employees as (

    select
            cast(id as int) as pk_funcionario
            , cast(reportsto as int) as fk_gerente
            , firstname || ' ' || lastname as name
            , cast(title as varchar) as title
            , cast(birthdate as date) as birthdate
            , cast(hiredate as date) as  hiredate
            , cast(city as varchar) as city
            , cast(region as varchar) as region
            , cast(country as varchar) as country
            --, cast(titleofcourtesy as varchar)
            --, cast(address as varchar) 
            --, cast(postalcode as varchar) 
            --, cast(homephone as varchar)
            --, cast(extension as varchar)
            --, cast(photo as varchar)
            --, cast(notes as varchar)
            --, cast(photopath as varchar)
    from source

)

select * from renamed_employees
