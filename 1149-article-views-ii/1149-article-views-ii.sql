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
    # select distinct as there could be multiple rows with rank=2 
    # because of dense_rank's feature
from 
    cte
where 
    ct > 1