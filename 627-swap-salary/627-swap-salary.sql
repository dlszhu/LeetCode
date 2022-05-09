# Write your MySQL query statement below

# Write an SQL query to swap all 'f' and 'm' values 
# (i.e., change all 'f' values to 'm' and vice versa) 
# with a single update statement and no intermediate temporary tables.

UPDATE salary #update table
SET
    sex = #column name =
    CASE sex #case when here
        WHEN 'm' THEN 'f'
        ELSE 'm'
    END;
