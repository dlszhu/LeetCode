# Write your MySQL query statement below

with tree_node as (select
    employee_id,
    case when manager_id = 1 then 'direct'
        when manager_id in (select 
                                employee_id 
                            from 
                                Employees
                            where
                                manager_id = 1) then 'first'
        when manager_id in (select 
                                employee_id 
                            from 
                                Employees
                            where
                                manager_id in (select 
                                                    employee_id 
                                                from 
                                                    Employees
                                                where
                                                    manager_id = 1)) then 'second'
        else 'third' end as relationship
from
    Employees)
# use a similar idea like the "TreeNode" question
# use case when to set different level of relationship

select
    employee_id
from
    tree_node
where
    relationship in ('direct','first','second')
    and employee_id <> 1
    #notice that here different from treenode, boss himself also has manager id =1
    #so need to remove him