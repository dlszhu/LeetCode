# Write your MySQL query statement below

# a much smarter way to do it with if statement

select employee_id, if(employee_id%2=1 and name not like'M%', salary,0) as bonus
from Employees;