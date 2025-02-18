with employees as (
    select *
    from {{ ref('stg_erp__employees') }}
)
, self_joinned as (
    select
    employees.pk_funcionario
    , employees.name as name_employee
    , manager.name as name_manager
    , employees.title
    , employees.birthdate
    , employees.hiredate
    , employees.city
    , employees.region
    , employees.country
    from employees
    left join employees as manager 
        on employees.fk_gerente = manager.pk_funcionario
)

select * from self_joinned