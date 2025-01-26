/* Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas). 
 The result format is in the following example. 
  
 Input:  
 Employee table: 
 +----+--------+ 
 | id | salary | 
 +----+--------+ 
 | 1  | 100    | 
 | 2  | 200    | 
 | 3  | 300    | 
 +----+--------+ 
  
 Output:  
 +---------------------+ 
 | SecondHighestSalary | 
 +---------------------+ 
 | 200                 | 
 +---------------------+ 
  
 Example 2: 
  
 Input:  
 Employee table: 
 +----+--------+ 
 | id | salary | 
 +----+--------+ 
 | 1  | 100    | 
 +----+--------+ 
  
 Output:  
 +---------------------+ 
 | SecondHighestSalary | 
 +---------------------+ 
 | null                | 
 +---------------------+ */ 
  
  
 WITH cte AS( 
     SELECT e.*, dense_rank() over(ORDER BY salary desc) AS "rnk" 
     FROM employee e 
 ) 
 SELECT max(salary) AS "SecondHighestSalary" FROM cte 
 WHERE rnk=2;