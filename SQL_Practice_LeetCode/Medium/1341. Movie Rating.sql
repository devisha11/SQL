/* Write a solution to: 
  
 Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name. 
 Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name. 
 The result format is in the following example. 
  
  
 Input:  
 Movies table: 
 +-------------+--------------+ 
 | movie_id    |  title       | 
 +-------------+--------------+ 
 | 1           | Avengers     | 
 | 2           | Frozen 2     | 
 | 3           | Joker        | 
 +-------------+--------------+ 
  
 Users table: 
 +-------------+--------------+ 
 | user_id     |  name        | 
 +-------------+--------------+ 
 | 1           | Daniel       | 
 | 2           | Monica       | 
 | 3           | Maria        | 
 | 4           | James        | 
 +-------------+--------------+ 
  
 MovieRating table: 
 +-------------+--------------+--------------+-------------+ 
 | movie_id    | user_id      | rating       | created_at  | 
 +-------------+--------------+--------------+-------------+ 
 | 1           | 1            | 3            | 2020-01-12  | 
 | 1           | 2            | 4            | 2020-02-11  | 
 | 1           | 3            | 2            | 2020-02-12  | 
 | 1           | 4            | 1            | 2020-01-01  | 
 | 2           | 1            | 5            | 2020-02-17  |  
 | 2           | 2            | 2            | 2020-02-01  |  
 | 2           | 3            | 2            | 2020-03-01  | 
 | 3           | 1            | 3            | 2020-02-22  |  
 | 3           | 2            | 4            | 2020-02-25  |  
 +-------------+--------------+--------------+-------------+ 
  
 Output:  
 +--------------+ 
 | results      | 
 +--------------+ 
 | Daniel       | 
 | Frozen 2     | 
 +--------------+ 
  
 Explanation:  
 Daniel and Monica have rated 3 movies ("Avengers", "Frozen 2" and "Joker") but Daniel is smaller lexicographically. 
 Frozen 2 and Joker have a rating average of 3.5 in February but Frozen 2 is smaller lexicographically. */ 
  
  
 WITH cte AS( 
 SELECT mr.movie_id, mv.title, mr.user_id, usr.name, mr.rating, mr.created_at  
 FROM movierating mr JOIN users usr 
 ON mr.user_id=usr.user_id 
 JOIN movies mv ON mr.movie_id=mv.movie_id 
 ), 
 cte2 AS( 
 SELECT name, DENSE_RANK() OVER(ORDER BY cnt DESC, name ASC) as 'rnk'  
 FROM (SELECT name, COUNT(*) cnt FROM cte GROUP BY name) dervd 
 ), 
 cte3 AS( 
     SELECT title, AVG(rating) avgrtng FROM cte WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29' GROUP BY title 
 ), 
 cte4 AS( 
     SELECT title, DENSE_RANK() OVER(ORDER BY avgrtng DESC, title ASC) as 'rnk' FROM cte3 
 ) 
 SELECT name 'results' FROM cte2 WHERE rnk=1 
 UNION ALL 
 SELECT title FROM cte4 WHERE rnk=1;