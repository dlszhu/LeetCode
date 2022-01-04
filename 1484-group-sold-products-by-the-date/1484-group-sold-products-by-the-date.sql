# Write your MySQL query statement below

select
    sell_date,
    count(distinct product) as num_sold,
    #count distinct product as duplicate exists
    GROUP_CONCAT(distinct product ORDER BY product) as products
    #GROUP_CONCAT = STRING_AGG in PostGreSQL
    #ORDER BY in function to order
    #STRING_AGG() WITHIN GROUP (ORDER BY)
from 
    Activities
group by 
    sell_date
order by 
    sell_date