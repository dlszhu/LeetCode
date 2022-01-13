# Write your MySQL query statement below

#a type of question seen quite often:
#compare the value of a specific row with the whole category's avg/sum etc.

select business_id                                      # Finally, select 'business_id'
from
(select event_type, avg(occurences) as ave_occurences   # First, take the average of 'occurences' group by 'event_type'
 from events as e1
 group by event_type
) as temp1
join events as e2 on temp1.event_type = e2.event_type   # Second, join Events table on 'event_type'
where e2.occurences > temp1.ave_occurences              # Third, the 'occurences' should be greater than the average of 'occurences'
group by business_id
having count(distinct temp1.event_type) > 1             # (More than one event type with 'occurences' greater than 1)
    

    