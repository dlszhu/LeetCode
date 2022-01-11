# Write your MySQL query statement below

#more elegant solution
#apply the sum function and calculate the difference within the Groupby
#as the function will run within the group hence run thru the two rows of apple and oranges

SELECT 
    sale_date,
    SUM(CASE WHEN fruit = "apples" THEN sold_num END) - 
    SUM(CASE WHEN fruit = "oranges" THEN sold_num END) as diff
FROM 
    Sales 
GROUP BY 
    sale_date 
ORDER BY 
    sale_date