/* Find all numbers that appear at least three times consecutively. 
 Return the result table in any order. 
 The result format is in the following example. 
  
 Input:  
 Logs table: 
 +----+-----+ 
 | id | num | 
 +----+-----+ 
 | 1  | 1   | 
 | 2  | 1   | 
 | 3  | 1   | 
 | 4  | 2   | 
 | 5  | 1   | 
 | 6  | 2   | 
 | 7  | 2   | 
 +----+-----+ 
  
 Output:  
 +-----------------+ 
 | ConsecutiveNums | 
 +-----------------+ 
 | 1               | 
 +-----------------+ 
  
 Explanation: 1 is the only number that appears consecutively for at least three times. */ 
  
  
 WITH cte AS ( 
     SELECT num, 
     LEAD(num,1) OVER() num1, 
     LEAD(num,2) OVER() num2 
     FROM logs 
  
 ) 
 SELECT DISTINCT num ConsecutiveNums  
 FROM cte  
 WHERE num=num1 AND num1=num2 ;