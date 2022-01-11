# Write your MySQL query statement below

select
    distinct s1.sale_date,
    (s1.sold_num-s2.sold_num) as diff
from
    Sales s1
    left join Sales s2 on s1.sale_date=s2.sale_date
where 
    s1.fruit <> s2.fruit
    and s1.fruit = 'apples'