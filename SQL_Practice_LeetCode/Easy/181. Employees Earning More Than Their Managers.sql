/* Write a solution to find the employees who earn more than their managers. 
 Return the result table in any order. 
 The result format is in the following example. 
  
 Input:  
 Employee table: 
 +----+-------+--------+-----------+ 
 | id | name  | salary | managerId | 
 +----+-------+--------+-----------+ 
 | 1  | Joe   | 70000  | 3         | 
 | 2  | Henry | 80000  | 4         | 
 | 3  | Sam   | 60000  | Null      | 
 | 4  | Max   | 90000  | Null      | 
 +----+-------+--------+-----------+ 
  
 Output:  
 +----------+ 
 | Employee | 
 +----------+ 
 | Joe      | 
 +----------+ 
  
 Explanation:  
 Joe is the only employee who earns more than his manager. */ 
  
  
 SELECT e2.name AS "Employee" FROM employee e1 JOIN employee e2 
 ON e1.id=e2.managerId 
 WHERE e1.salary<e2.salary;