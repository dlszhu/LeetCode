# Write your MySQL query statement below

select
    title
from
    Content
where
    Kids_content = 'Y'
    and content_type = 'Movies'
    and content_id in (
        select
            distinct content_id
        from
            TVProgram
        where 
            program_date >= '2020-06-01 00:00'
            and program_date < '2020-07-01 00:00'
    )
     