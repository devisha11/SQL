/* Write a solution to find the customer_number for the customer who has placed the largest number of orders. 
 The test cases are generated so that exactly one customer will have placed more orders than any other customer. 
 The result format is in the following example. 
  
 Input:  
 Orders table: 
 +--------------+-----------------+ 
 | order_number | customer_number | 
 +--------------+-----------------+ 
 | 1            | 1               | 
 | 2            | 2               | 
 | 3            | 3               | 
 | 4            | 3               | 
 +--------------+-----------------+ 
  
 Output:  
 +-----------------+ 
 | customer_number | 
 +-----------------+ 
 | 3               | 
 +-----------------+ 
  
 Explanation:  
 The customer with number 3 has two orders, which is greater than either customer 1 or 2 because each of them only has one order.  
 So the result is customer_number 3.  */ 
  
  
 Code: 
 SELECT customer_number 
 FROM orders 
 GROUP BY customer_number  
 ORDER BY COUNT(customer_number) desc  
 LIMIT 1;