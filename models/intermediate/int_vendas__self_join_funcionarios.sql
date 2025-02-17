with employees as (
    select *
    from {{ ref('stg_erp__employees') }}
)
, self_joinned as (
    select
    employees.PK_FUNCIONARIO
    , employees.NAME as NAME_EMPLOYEE
    , manager.NAME as NAME_MANAGER
    , employees.TITLE
    , employees.BIRTHDATE
    , employees.HIREDATE
    , employees.CITY
    , employees.REGION
    , employees.COUNTRY
    from employees
    left join employees as manager 
        on employees.fk_gerente = manager.pk_funcionario
)

select * from self_joinned