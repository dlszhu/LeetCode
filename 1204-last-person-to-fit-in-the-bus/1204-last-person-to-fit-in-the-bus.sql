# Write your MySQL query statement below

#to find the last person fit into the bus we need to keep a column of running total
#hence we will use window function here

SELECT
    person_name
FROM
    (SELECT 
        turn,
        person_name,
        weight,
        SUM(weight) OVER (ORDER BY turn ASC) AS running_total
    FROM Queue) sub
WHERE
    running_total <= 1000
    #less than or equal to 1000 to make it generalized
ORDER BY turn desc
#order by turn number and limit to the top one to make sure its the closest
LIMIT 1