# Write your MySQL query statement below
 
#question asking for average daily percent of spam got deleted
#average(deleted spams/total spams)
#so we build CTE table to count distinct spam by date first
#then we create CTE for deleted spam by date
#lastly we join two tables to calculate the average
with total_spams as(
select action_date, count(distinct post_id) number_of_posts from actions
    where action ='report' and extra = 'spam'
group by action_date
), 
daily_deleted_spams as( 
select action_date, count(distinct a.post_id) deleted_posts 
    from actions a inner join removals b on a.post_id = b.post_id
    where action='report' and extra ='spam'
    group by action_date
)
select round(avg(ifnull(deleted_posts,0)/number_of_posts) * 100,2) average_daily_percent
from total_spams a left join daily_deleted_spams b on a.action_date = b.action_date