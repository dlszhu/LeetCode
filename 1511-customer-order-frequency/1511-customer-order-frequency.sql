# Write your MySQL query statement below
with a as (
    SELECT C.customer_id
         , C.name
    FROM Orders AS O
        INNER JOIN Product   AS P USING (product_id)
        INNER JOIN Customers AS C USING (customer_id)
    WHERE EXTRACT(YEAR  FROM O.order_date) = 2020
      AND EXTRACT(MONTH FROM O.order_date) IN (6,7)
    GROUP BY O.customer_id
           , EXTRACT(YEAR  FROM O.order_date)
           , EXTRACT(MONTH FROM O.order_date)
    HAVING SUM(O.quantity * P.Price) >= 100)

select customer_id, name
from a 
group by customer_id
having count(customer_id) > 1


