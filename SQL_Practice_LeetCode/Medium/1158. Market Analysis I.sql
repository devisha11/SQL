/* Write a solution to find for each user, the join date and the number of orders they made as a buyer in 2019. 
 Return the result table in any order. 
 The result format is in the following example. 
  
 Input:  
 Users table: 
 +---------+------------+----------------+ 
 | user_id | join_date  | favorite_brand | 
 +---------+------------+----------------+ 
 | 1       | 2018-01-01 | Lenovo         | 
 | 2       | 2018-02-09 | Samsung        | 
 | 3       | 2018-01-19 | LG             | 
 | 4       | 2018-05-21 | HP             | 
 +---------+------------+----------------+ 
 Orders table: 
 +----------+------------+---------+----------+-----------+ 
 | order_id | order_date | item_id | buyer_id | seller_id | 
 +----------+------------+---------+----------+-----------+ 
 | 1        | 2019-08-01 | 4       | 1        | 2         | 
 | 2        | 2018-08-02 | 2       | 1        | 3         | 
 | 3        | 2019-08-03 | 3       | 2        | 3         | 
 | 4        | 2018-08-04 | 1       | 4        | 2         | 
 | 5        | 2018-08-04 | 1       | 3        | 4         | 
 | 6        | 2019-08-05 | 2       | 2        | 4         | 
 +----------+------------+---------+----------+-----------+ 
 Items table: 
 +---------+------------+ 
 | item_id | item_brand | 
 +---------+------------+ 
 | 1       | Samsung    | 
 | 2       | Lenovo     | 
 | 3       | LG         | 
 | 4       | HP         | 
 +---------+------------+ 
  
 Output:  
 +-----------+------------+----------------+ 
 | buyer_id  | join_date  | orders_in_2019 | 
 +-----------+------------+----------------+ 
 | 1         | 2018-01-01 | 1              | 
 | 2         | 2018-02-09 | 2              | 
 | 3         | 2018-01-19 | 0              | 
 | 4         | 2018-05-21 | 0              | 
 +-----------+------------+----------------+  */ 
  
  
 Code: 
 SELECT u.user_id AS buyer_id, join_date,  
 IFNULL(COUNT(order_date),0) AS "orders_in_2019" 
 FROM users u  
 left JOIN  
 orders o 
 ON u.user_id=o.buyer_id 
 AND year(order_date)='2019' 
 GROUP BY u.user_id;