# Write your MySQL query statement below

# first calculate all points and assigned to guest and host points
with points as (
    select
        match_id,
        host_team,
        guest_team,
        case when host_goals>guest_goals then 3
             when host_goals=guest_goals then 1
             else 0 end as host_points,
        case when host_goals>guest_goals then 0
             when host_goals=guest_goals then 1
             else 3 end as guest_points
    from
        Matches 
)

#left join teams table with points table to get pt columns
#if we simply sum up the host and guest point there will be duplicate as it added the match opponent's point when there is a draw
#so we use case statement within the sum to add only the team we want to sum

select
    t.team_id,
    t.team_name,
    (ifnull(sum(case when p.host_team = t.team_id then p.host_points end),0) +
    ifnull(sum(case when p.guest_team = t.team_id then p.guest_points end),0)) as num_points
from
    Teams t
    left join points p
        on t.team_id in (p.host_team, p.guest_team)
group by
    t.team_id
order by
    num_points desc,
    team_id