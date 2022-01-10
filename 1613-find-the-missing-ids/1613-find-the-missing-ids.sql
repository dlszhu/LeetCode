# Write your MySQL query statement below

#key: finding a method to generate all customer_id 
#between min(customer_id) and max(customer_id)

#use new stuff here: Recursive Common Table Expressions
WITH RECURSIVE CTE (ids) AS
(
    SELECT 1 AS ids
    UNION ALL
    SELECT ids + 1 FROM CTE WHERE ids < (SELECT MAX(customer_id) FROM Customers)
)

SELECT ids
FROM CTE
WHERE ids NOT IN (SELECT customer_id FROM Customers)
ORDER BY 1 ASC
    