#much easier solution using Row number window function and order by grade and course id

WITH P AS (SELECT 
                *, 
                ROW_NUMBER() OVER(PARTITION BY student_id 
                                  ORDER BY grade DESC, course_id) AS grader
           FROM Enrollments)
           
SELECT 
    student_id, 
    course_id, 
    grade
FROM P
WHERE grader = 1;

    