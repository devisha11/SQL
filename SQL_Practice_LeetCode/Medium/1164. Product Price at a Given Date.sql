/* Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10. 
 Return the result table in any order. 
 The result format is in the following example. 
  
 Input:  
 Products table: 
 +------------+-----------+-------------+ 
 | product_id | new_price | change_date | 
 +------------+-----------+-------------+ 
 | 1          | 20        | 2019-08-14  | 
 | 2          | 50        | 2019-08-14  | 
 | 1          | 30        | 2019-08-15  | 
 | 1          | 35        | 2019-08-16  | 
 | 2          | 65        | 2019-08-17  | 
 | 3          | 20        | 2019-08-18  | 
 +------------+-----------+-------------+ 
  
 Output:  
 +------------+-------+ 
 | product_id | price | 
 +------------+-------+ 
 | 2          | 50    | 
 | 1          | 35    | 
 | 3          | 10    | 
 +------------+-------+ */ 
  
  
 WITH cte AS 
 ( 
     SELECT product_id, MAX(change_date) FROM products WHERE change_date<='2019-08-16' 
 GROUP BY product_id 
 ) 
 SELECT product_id, new_price as price FROM products WHERE (product_id, change_date) IN (SELECT * FROM cte) 
 UNION 
 SELECT product_id, 10 as price FROM products WHERE (product_id, change_date) NOT IN (SELECT * FROM cte);