# Write your MySQL query statement below


select 
    b.book_id, 
    b.name
from 
    books b 
    left join orders o
    #use left join to include the book in books table but not order table
        on b.book_id = o.book_id 
        and dispatch_date between '2018-06-23' and '2019-06-23'
        #limit dispatch date to one year from today
where 
    datediff('2019-06-23', available_from) > 30
    #use datediff function to make sure book available 30 days from today
group by 
    b.book_id, b.name
    #group by both output columns to calculate sum
having ifnull(sum(quantity),0) <10
#left join results in null value potentially, use ifnull to set 0
        