# Write your MySQL query statement below

SELECT
    co.name AS country
FROM
    Person p
    JOIN
        Country co
        ON left(phone_number,3) = country_code
        #join person table with country table on country code
        #notice that we use LEFT function directly within the ON statement to match
    JOIN
        calls c
        ON p.id IN (c.caller_id, c.callee_id)
        #join person table with calls table on person id
        #to find out all country from calls table
        # p.id in() equal to calls.caller_id = person.id OR calls.callee_id = person.id
GROUP BY
    country
    #group by rows with same country and calculate the duration
HAVING 
    AVG(duration) > (SELECT AVG(duration) FROM Calls)