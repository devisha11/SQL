/* Write a solution to select the product id, year, quantity, and price for the first year of every product sold. 
 Return the resulting table in any order. 
 The result format is in the following example. 
  
 Input:  
 Sales table: 
 +---------+------------+------+----------+-------+ 
 | sale_id | product_id | year | quantity | price | 
 +---------+------------+------+----------+-------+  
 | 1       | 100        | 2008 | 10       | 5000  | 
 | 2       | 100        | 2009 | 12       | 5000  | 
 | 7       | 200        | 2011 | 15       | 9000  | 
 +---------+------------+------+----------+-------+ 
  
 Product table: 
 +------------+--------------+ 
 | product_id | product_name | 
 +------------+--------------+ 
 | 100        | Nokia        | 
 | 200        | Apple        | 
 | 300        | Samsung      | 
 +------------+--------------+ 
  
 Output:  
 +------------+------------+----------+-------+ 
 | product_id | first_year | quantity | price | 
 +------------+------------+----------+-------+  
 | 100        | 2008       | 10       | 5000  | 
 | 200        | 2011       | 15       | 9000  | 
 +------------+------------+----------+-------+ */ 
  
  
 SELECT s2.product_id, s2.y first_year, quantity, price 
 FROM sales s1 JOIN (SELECT product_id, MIN(year) y 
 FROM sales 
 GROUP BY product_id) s2 
 ON s1.product_id=s2.product_id AND s1.year=s2.y;