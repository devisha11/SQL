/* Write a solution to find the names of all the salespersons who did not have any orders related to the company with the name "RED". 
 Return the result table in any order. 
 The result format is in the following example. 
  
 Input:  
 SalesPerson table: 
 +----------+------+--------+-----------------+------------+ 
 | sales_id | name | salary | commission_rate | hire_date  | 
 +----------+------+--------+-----------------+------------+ 
 | 1        | John | 100000 | 6               | 4/1/2006   | 
 | 2        | Amy  | 12000  | 5               | 5/1/2010   | 
 | 3        | Mark | 65000  | 12              | 12/25/2008 | 
 | 4        | Pam  | 25000  | 25              | 1/1/2005   | 
 | 5        | Alex | 5000   | 10              | 2/3/2007   | 
 +----------+------+--------+-----------------+------------+ 
 Company table: 
 +--------+--------+----------+ 
 | com_id | name   | city     | 
 +--------+--------+----------+ 
 | 1      | RED    | Boston   | 
 | 2      | ORANGE | New York | 
 | 3      | YELLOW | Boston   | 
 | 4      | GREEN  | Austin   | 
 +--------+--------+----------+ 
  
 Orders table: 
 +----------+------------+--------+----------+--------+ 
 | order_id | order_date | com_id | sales_id | amount | 
 +----------+------------+--------+----------+--------+ 
 | 1        | 1/1/2014   | 3      | 4        | 10000  | 
 | 2        | 2/1/2014   | 4      | 5        | 5000   | 
 | 3        | 3/1/2014   | 1      | 1        | 50000  | 
 | 4        | 4/1/2014   | 1      | 4        | 25000  | 
 +----------+------------+--------+----------+--------+ 
  
 Output:  
 +------+ 
 | name | 
 +------+ 
 | Amy  | 
 | Mark | 
 | Alex | 
 +------+ 
  
 Explanation:  
 According to orders 3 and 4 in the Orders table, it is easy to tell that only salesperson John and Pam have sales to company RED, so we report all the other names in the table salesperson.  */ 
  
  
 Code: 
 SELECT name  
 FROM salesPerson  
 WHERE sales_id not IN ( 
     SELECT sales_id FROM orders  
     WHERE com_id IN ( 
         SELECT com_id FROM company WHERE name="RED"));