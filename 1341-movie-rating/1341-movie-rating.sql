# Write your MySQL query statement below

#the results was two different column value combined vertically so use UNION
(select 
    u.name results
from
    Users u
    left join MovieRating mr
        on u.user_id = mr.user_id
group by
    mr.user_id
order by count(mr.movie_id) desc, u.name
limit 1)

union

(select 
    m.title
from
    Movies m
    left join MovieRating mr
        on m.movie_id = mr.movie_id
where mr.created_at between '2020-02-01' and '2020-02-29'
group by
    mr.movie_id
order by avg(mr.rating) desc, m.title
limit 1)