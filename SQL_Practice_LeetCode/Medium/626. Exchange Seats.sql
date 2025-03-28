/* Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped. 
 Return the result table ordered by id in ascending order. 
 The result format is in the following example. 
  
 Input:  
 Seat table: 
 +----+---------+ 
 | id | student | 
 +----+---------+ 
 | 1  | Abbot   | 
 | 2  | Doris   | 
 | 3  | Emerson | 
 | 4  | Green   | 
 | 5  | Jeames  | 
 +----+---------+ 
  
 Output:  
 +----+---------+ 
 | id | student | 
 +----+---------+ 
 | 1  | Doris   | 
 | 2  | Abbot   | 
 | 3  | Green   | 
 | 4  | Emerson | 
 | 5  | Jeames  | 
 +----+---------+ 
  
 Explanation:  
 Note that if the number of students is odd, there is no need to change the last one's seat. */ 
  
  
 SELECT  
     CASE   
         WHEN id = (SELECT MAX(id) FROM seat) and id % 2 = 1 
             THEN id 
  
         WHEN id % 2 = 1 
             THEN id + 1 
  
         WHEN id % 2 = 0 
             THEN id - 1 
     END as id, 
     student 
 FROM  
     seat 
 ORDER BY 
     id;