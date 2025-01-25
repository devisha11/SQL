/* Write a solution to find the people who have the most friends and the most friends number. 
 The test cases are generated so that only one person has the most friends. 
 The result format is in the following example. 
  
 Input:  
 RequestAccepted table: 
 +--------------+-------------+-------------+ 
 | requester_id | accepter_id | accept_date | 
 +--------------+-------------+-------------+ 
 | 1            | 2           | 2016/06/03  | 
 | 1            | 3           | 2016/06/08  | 
 | 2            | 3           | 2016/06/08  | 
 | 3            | 4           | 2016/06/09  | 
 +--------------+-------------+-------------+ 
  
 Output:  
 +----+-----+ 
 | id | num | 
 +----+-----+ 
 | 3  | 3   | 
 +----+-----+ 
 Explanation:  
 The person with ID 3 is a friend of people 1, 2, and 4, so he has three friends in total, which is the most number than any others. */ 
  
  
 WITH cte AS( 
     SELECT requester_id id FROM requestaccepted 
 UNION ALL 
 SELECT accepter_id id FROM requestaccepted 
 ) 
 SELECT id, count(*) num FROM cte 
 GROUP BY id 
 ORDER BY 2 desc 
 LIMIT 1;