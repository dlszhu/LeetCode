# Write your MySQL query statement below

with tax as (select
    company_id,
    case
        when max(salary) < 1000 then 0
        when max(salary) <= 10000 then 0.24
        else 0.49 end as tax_rate
from
    Salaries
group by
    company_id)
    
select
    s.company_id,
    employee_id,
    employee_name,
    round(s.salary-s.salary*(tax_rate)) as salary
from
    Salaries s
    join tax t on s.company_id=t.company_id
