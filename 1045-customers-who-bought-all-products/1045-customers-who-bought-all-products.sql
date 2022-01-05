# Write your MySQL query statement below


#The SQL standard requires that HAVING must reference only columns in the 
#GROUP BY clause or columns used in aggregate functions. 
#However, MySQL supports an extension to this behavior, and permits HAVING to 
#refer to columns in the SELECT list and columns in outer subqueries as well.

    select 
        customer_id
    from
        Customer
    group by
        customer_id
    having 
    count(distinct product_key) = (
        select 
            count(distinct product_key) 
        from 
            Product)
    
    # since 2 products in the product table
    # we just find out the customer having 2 distinct product key 
    # for the case of generalization, Product Key is the foreign key to the Product
    # table so it would be fine to use this way to solve problem
    
    #the solution below prevent the customers from buying something not in Product table
    #and then use the same way to calculate the distinct product key
    #because we know that product in Product table is what we want to use to match
    
    #SELECT c.customer_id
    #FROM Customer c, Product p
    #WHERE c.product_key = p.product_key
    #GROUP BY c.customer_id
    #Having COUNT(DISTINCT c.product_key) = (SELECT
    #COUNT(DISTINCT product_key) FROM Product p)
    
