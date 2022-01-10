# Write your MySQL query statement below

#problem is to find
#the start and end number of continuous range

with a as (
(select fail_date as date,
'failed' as period_state
from failed)
union all
(select success_date as date,
'succeeded' as period_state
from succeeded)
),

b as (
select date,
period_state,
row_number() over (order by period_state, date asc) as seq
from a where date between '2019-01-01' and '2019-12-31'
)

select period_state, min(date) as start_date, max(date) as end_date from b
group by DATE_SUB(date,INTERVAL seq DAY ),period_state
order by start_date asc