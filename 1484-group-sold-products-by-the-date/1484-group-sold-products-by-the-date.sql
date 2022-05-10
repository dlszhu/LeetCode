# Write your MySQL query statement below

select
    sell_date,
    count(distinct product) as num_sold,
    group_concat(distinct product) as products
from
    Activities
group by sell_date

#string_agg in postgresql and group_concat in mysql
#to list all string values after groupby