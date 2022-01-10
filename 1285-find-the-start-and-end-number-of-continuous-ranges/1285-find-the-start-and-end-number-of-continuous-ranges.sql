# Write your MySQL query statement below

select
    min(log_id) as start_id,
    max(log_id) as end_id
from
    (select
        log_id,
        row_number() over(order by log_id) as counter
    from   
        Logs) as sub
group by 
    log_id-counter
    #consecutive numbers have same difference to the counter
    #1,2,3 = 0; 7,8=3
    #then use min and max to select the start ane end of the groups