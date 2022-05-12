# Write your MySQL query statement below

# window function LAG() not work 
# consider special case when no consecutive days

SELECT
    weather.id AS 'Id'
FROM
    weather
        JOIN weather w 
        ON DATEDIFF(weather.recordDate, w.recordDate) = 1
        AND weather.Temperature > w.Temperature
# use self join
# DATEDIFF to selfjoin with strictly one recordDate difference
# and also filter weather temp at the same time