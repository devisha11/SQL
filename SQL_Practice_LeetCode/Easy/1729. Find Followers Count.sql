/* Write a solution that will, for each user, return the number of followers. 
 Return the result table ordered by user_id in ascending order. 
 The result format is in the following example. 
  
 Input:  
 Followers table: 
 +---------+-------------+ 
 | user_id | follower_id | 
 +---------+-------------+ 
 | 0       | 1           | 
 | 1       | 0           | 
 | 2       | 0           | 
 | 2       | 1           | 
 +---------+-------------+ 
  
 Output:  
 +---------+----------------+ 
 | user_id | followers_count| 
 +---------+----------------+ 
 | 0       | 1              | 
 | 1       | 1              | 
 | 2       | 2              | 
 +---------+----------------+ 
  
 Explanation:  
 The followers of 0 are {1} 
 The followers of 1 are {0} 
 The followers of 2 are {0,1} */ 
  
  
 SELECT user_id, COUNT(*) followers_count 
 FROM followers 
 GROUP BY user_id 
 ORDER BY user_id;