# Write your MySQL query statement below

select
    p.product_name,
    sum(unit) as unit
from
    Products p
    join Orders o 
        on p.product_id = o.product_id
        # inner join as we dont care about products not sold here
where
    order_date >= '2020-02-01'
    and order_date < '2020-03-01'
    #limit to order in february 2020
group by
    p.product_name
having 
    sum(unit) >= 100
    #compare the sum of units sold after grouping
    