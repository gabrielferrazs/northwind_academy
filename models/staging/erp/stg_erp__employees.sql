with 

source as (

    select * from {{ source('erp', 'employees') }}

),

renamed_employees as (

    select
            cast(ID as int) as pk_funcionario
            , cast(REPORTSTO as int) as fk_gerente
            , FIRSTNAME || ' ' || LASTNAME as Name
            , cast(TITLE as varchar) as TITLE
            , cast(BIRTHDATE as date) as BIRTHDATE
            , cast(HIREDATE as date) as  HIREDATE
            , cast(CITY as varchar) as CITY
            , cast(REGION as varchar) as REGION
            , cast(COUNTRY as varchar) as country
            --, cast(TITLEOFCOURTESY as varchar)
            --, cast(ADDRESS as varchar) 
            --, cast(POSTALCODE as varchar) 
            --, cast(HOMEPHONE as varchar)
            --, cast(EXTENSION as varchar)
            --, cast(PHOTO as varchar)
            --, cast(NOTES as varchar)
            --, cast(PHOTOPATH as varchar)
    from source

)

select * from renamed_employees
