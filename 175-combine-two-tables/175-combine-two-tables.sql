# Write your MySQL query statement below

select 
    p.firstName,
    p.lastName,
    a.city,
    a.state
from
    Person p
    left join Address a
    on p.personId = a.personId
union
select
    p.firstName,
    p.lastName,
    a.city,
    a.state
from
    Address a
    left join Person p
    on p.personId = a.personId
where 
    p.firstName is not null
    and p.lastName is not null