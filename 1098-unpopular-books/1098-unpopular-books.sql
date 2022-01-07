# Write your MySQL query statement below

#first we calculate the book sold last year in cte
#notice that some books not sold last year we need to set 0
#as they are "sold less than 10 copies"
#use the cte table above to select the books available more than 1 month ago
#and sold less than 10
#notice that book id 2 not in order table so use left join to include that
select
    book_id,
    name
from
    Books 
where 
    available_from < '2019-05-23'
    and book_id not in 
    (SELECT book_id
             FROM Orders
             WHERE dispatch_date BETWEEN '2018-06-23' AND '2019-06-23'
             GROUP BY book_id
             Having sum(quantity) >= 10)
        