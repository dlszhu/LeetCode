# Write your MySQL query statement below

select
    id,
    name
from
    Students 
where
    department_id not in (
    select
        id
    from 
        Departments
    ) 
    # use subquery to get the department id still exists
    # use "NOT IN" to exclude 