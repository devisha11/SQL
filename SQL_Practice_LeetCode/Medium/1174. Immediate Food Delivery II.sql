/* If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled. 
 The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order. 
 Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places. 
 The result format is in the following example. 
  
 Input:  
 Delivery table: 
 +-------------+-------------+------------+-----------------------------+ 
 | delivery_id | customer_id | order_date | customer_pref_delivery_date | 
 +-------------+-------------+------------+-----------------------------+ 
 | 1           | 1           | 2019-08-01 | 2019-08-02                  | 
 | 2           | 2           | 2019-08-02 | 2019-08-02                  | 
 | 3           | 1           | 2019-08-11 | 2019-08-12                  | 
 | 4           | 3           | 2019-08-24 | 2019-08-24                  | 
 | 5           | 3           | 2019-08-21 | 2019-08-22                  | 
 | 6           | 2           | 2019-08-11 | 2019-08-13                  | 
 | 7           | 4           | 2019-08-09 | 2019-08-09                  | 
 +-------------+-------------+------------+-----------------------------+ 
  
 Output:  
 +----------------------+ 
 | immediate_percentage | 
 +----------------------+ 
 | 50.00                | 
 +----------------------+ 
  
 Explanation:  
 The customer ID 1 has a first order with delivery ID 1 and it is scheduled. 
 The customer ID 2 has a first order with delivery ID 2 and it is immediate. 
 The customer ID 3 has a first order with delivery ID 5 and it is scheduled. 
 The customer ID 4 has a first order with delivery ID 7 and it is immediate. 
 Hence, half the customers have immediate first orders. */ 
  
  
 SELECT ROUND(AVG(order_date=customer_pref_delivery_date)*100,2) as "immediate_percentage" 
 FROM delivery 
 WHERE (customer_id, order_date) IN  
 (SELECT customer_id, MIN(order_date) FROM delivery GROUP BY customer_id);