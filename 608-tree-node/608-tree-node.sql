# Write your MySQL query statement below

select 
    id,
    case when p_id is null then 'Root'
        # root has null since not parent
        
         when id in (select p_id from Tree) then 'Inner'
         # inner are those in parent id column other than root
         #here use subquery to find inner id in p_id column
        
        else 'Leaf' end as type
        #others are leaf
        
from Tree
order by id

