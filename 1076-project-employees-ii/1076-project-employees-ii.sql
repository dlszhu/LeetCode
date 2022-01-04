# Write your MySQL query statement below

SELECT 
    p.project_id
FROM
    Project p
    JOIN Employee e on p.employee_id=e.employee_id
GROUP BY project_id
HAVING COUNT(*) =
    (SELECT 
        MAX(cnt)
     FROM 
        (SELECT 
            COUNT(*) as cnt
         FROM 
            Project p
            JOIN Employee e on p.employee_id=e.employee_id
         GROUP BY project_id) as temp)