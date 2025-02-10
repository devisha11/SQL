/* Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount. 
 Return the result table in any order. 
 The query result format is in the following example. 
  
 Input:  
 Transactions table: 
 +------+---------+----------+--------+------------+ 
 | id   | country | state    | amount | trans_date | 
 +------+---------+----------+--------+------------+ 
 | 121  | US      | approved | 1000   | 2018-12-18 | 
 | 122  | US      | declined | 2000   | 2018-12-19 | 
 | 123  | US      | approved | 2000   | 2019-01-01 | 
 | 124  | DE      | approved | 2000   | 2019-01-07 | 
 +------+---------+----------+--------+------------+ 
  
 Output:  
 +----------+---------+-------------+----------------+--------------------+-----------------------+ 
 | month    | country | trans_count | approved_count | trans_total_amount | approved_total_amount | 
 +----------+---------+-------------+----------------+--------------------+-----------------------+ 
 | 2018-12  | US      | 2           | 1              | 3000               | 1000                  | 
 | 2019-01  | US      | 1           | 1              | 2000               | 2000                  | 
 | 2019-01  | DE      | 1           | 1              | 2000               | 2000                  | 
 +----------+---------+-------------+----------------+--------------------+-----------------------+ */ 
  
  
 SELECT LEFT(trans_date, 7) AS month,  
 country,  
 COUNT(id) as 'trans_count',   
 SUM(state="approved") as 'approved_count',  
 SUM(amount) as 'trans_total_amount', 
 SUM((state = 'approved') * amount) AS approved_total_amount 
 FROM transactions 
 GROUP BY month, country;