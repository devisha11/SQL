/* Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount. 
 Return the result table in any order. 
 The result format is in the following example. 
  
 Input:  
 Products table: 
 +-------------+-----------------------+------------------+ 
 | product_id  | product_name          | product_category | 
 +-------------+-----------------------+------------------+ 
 | 1           | Leetcode Solutions    | Book             | 
 | 2           | Jewels of Stringology | Book             | 
 | 3           | HP                    | Laptop           | 
 | 4           | Lenovo                | Laptop           | 
 | 5           | Leetcode Kit          | T-shirt          | 
 +-------------+-----------------------+------------------+ 
  
 Orders table: 
 +--------------+--------------+----------+ 
 | product_id   | order_date   | unit     | 
 +--------------+--------------+----------+ 
 | 1            | 2020-02-05   | 60       | 
 | 1            | 2020-02-10   | 70       | 
 | 2            | 2020-01-18   | 30       | 
 | 2            | 2020-02-11   | 80       | 
 | 3            | 2020-02-17   | 2        | 
 | 3            | 2020-02-24   | 3        | 
 | 4            | 2020-03-01   | 20       | 
 | 4            | 2020-03-04   | 30       | 
 | 4            | 2020-03-04   | 60       | 
 | 5            | 2020-02-25   | 50       | 
 | 5            | 2020-02-27   | 50       | 
 | 5            | 2020-03-01   | 50       | 
 +--------------+--------------+----------+ 
  
 Output:  
 +--------------------+---------+ 
 | product_name       | unit    | 
 +--------------------+---------+ 
 | Leetcode Solutions | 130     | 
 | Leetcode Kit       | 100     | 
 +--------------------+---------+ 
  
 Explanation:  
 Products with product_id = 1 is ordered in February a total of (60 + 70) = 130. 
 Products with product_id = 2 is ordered in February a total of 80. 
 Products with product_id = 3 is ordered in February a total of (2 + 3) = 5. 
 Products with product_id = 4 was not ordered in February 2020. 
 Products with product_id = 5 is ordered in February a total of (50 + 50) = 100. */ 
  
 SELECT product_name, sum(unit) as unit FROM orders o LEFT JOIN products p ON o.product_id=p.product_id 
 WHERE order_date BETWEEN '2020-02-01' AND '2020-02-28' 
 GROUP BY product_name 
 HAVING sum(unit)>=100 
 ORDER BY 1;