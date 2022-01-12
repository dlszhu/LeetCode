# Write your MySQL query statement below

#do Moving Average/Sum in window function

with sum_table as (
    select 
        distinct visited_on,
        sum(amount) over (order by visited_on 
                          range between interval 6 day preceding and current row) as amount,
                            -- note that we use range to get the preceding 6 days
        dense_rank() over (order by visited_on) as days
        -- we need to remove the first 6 days from the output, note that dense_rank() is used to avoid gap in rank
    from Customer
    )

select 
    visited_on, 
    amount, 
    round(amount/7,2) as average_amount
from sum_table
where days >= 7;