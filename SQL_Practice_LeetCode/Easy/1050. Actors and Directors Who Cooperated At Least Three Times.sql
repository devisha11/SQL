/* Write a solution to find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times. 
 Return the result table in any order. 
 The result format is in the following example. 
  
 Input:  
 ActorDirector table: 
 +-------------+-------------+-------------+ 
 | actor_id    | director_id | timestamp   | 
 +-------------+-------------+-------------+ 
 | 1           | 1           | 0           | 
 | 1           | 1           | 1           | 
 | 1           | 1           | 2           | 
 | 1           | 2           | 3           | 
 | 1           | 2           | 4           | 
 | 2           | 1           | 5           | 
 | 2           | 1           | 6           | 
 +-------------+-------------+-------------+ 
  
 Output:  
 +-------------+-------------+ 
 | actor_id    | director_id | 
 +-------------+-------------+ 
 | 1           | 1           | 
 +-------------+-------------+ 
  
 Explanation: The only pair is (1, 1) where they cooperated exactly 3 times.  */ 
  
 Code:SELECT actor_id, director_id  
 FROM actordirector 
 GROUP BY actor_id, director_id 
 HAVING COUNT(*)>=3;