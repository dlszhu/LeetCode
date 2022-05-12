# Write your MySQL query statement below

SELECT A.product_id, B.COLUMN_NAME as store,
CASE
    WHEN B.COLUMN_NAME = "store1" THEN store1
    WHEN B.COLUMN_NAME = "store2" THEN store2
    WHEN B.COLUMN_NAME = "store3" THEN store3
END AS price
FROM Products A, INFORMATION_SCHEMA.COLUMNS B
  WHERE table_name = 'Products' AND column_name != "product_id"
  HAVING price IS NOT NULL

# INFORMATION_SCHEMA provides the table metadata like column name 
