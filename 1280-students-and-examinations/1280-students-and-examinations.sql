# Write your MySQL query statement below

select 
    stu.student_id,
    stu.student_name,
    sub.subject_name,
    count(e.subject_name) as attended_exams
from 
    Students stu
    join Subjects sub 
    ##crossjoin to match all subjects for each student
    ##to account for 0 in attended exams
    left join Examinations e on stu.student_id = e.student_id
        and sub.subject_name = e.subject_name
group by stu.student_id, sub.subject_name
order by student_id, subject_name