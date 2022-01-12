# Write your MySQL query statement below

#to get only the max grade from table
#used a cte table to have the max value first and use join to match

with cte as (select
    student_id id,
    max(grade) g
from
    Enrollments
group by
    student_id)

#the hard part here is to select only the first record when there is a tie in max grade
#MySQL has no DISTINCT ON like postgresql
#but group by the columns that do not need to return first record do the same job
#so here we group by student_id and grade

select 
    e.student_id,
    min(e.course_id) as course_id,
    e.grade
from
    Enrollments e
    join cte on e.student_id = cte.id and e.grade=cte.g
group by
    e.student_id, e.grade
order by
    e.student_id, e.grade desc
    