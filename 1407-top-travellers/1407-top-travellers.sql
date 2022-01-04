# Write your MySQL query statement below

select
    u.name,
    ifnull(sum(r.distance),0) as travelled_distance
    #sum up travel distance for multiple trips
    #use ifnull to set Donald who travelled 0 distance and use left join to include
from
    Users u
    left join Rides r 
        on u.id = r.user_id  
        #user id in rides table is id in users table
group by u.name
order by
    travelled_distance desc,
    name 