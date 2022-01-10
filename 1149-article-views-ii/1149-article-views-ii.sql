# Write your MySQL query statement below

#window function
# dense_rank() over (partition by B order by A)
# gives the distinct count(*) for A partitioned by B
# as dense_rank treats row with similar records as same rank

with cte as (select
    article_id,
    viewer_id,
    view_date,
    dense_rank() over (partition by viewer_id,view_date order by article_id) ct
from
    Views)
    
select 
    distinct viewer_id id
from 
    cte
where 
    ct > 1