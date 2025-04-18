/* Reformat the table such that there is a department id column and a revenue column for each month. 
 Return the result table in any order. 
 The result format is in the following example. 
  
 Input:  
 Department table: 
 +------+---------+-------+ 
 | id   | revenue | month | 
 +------+---------+-------+ 
 | 1    | 8000    | Jan   | 
 | 2    | 9000    | Jan   | 
 | 3    | 10000   | Feb   | 
 | 1    | 7000    | Feb   | 
 | 1    | 6000    | Mar   | 
 +------+---------+-------+ 
  
 Output:  
 +------+-------------+-------------+-------------+-----+-------------+ 
 | id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue | 
 +------+-------------+-------------+-------------+-----+-------------+ 
 | 1    | 8000        | 7000        | 6000        | ... | null        | 
 | 2    | 9000        | null        | null        | ... | null        | 
 | 3    | null        | 10000       | null        | ... | null        | 
 +------+-------------+-------------+-------------+-----+-------------+ 
  
 Explanation: The revenue from Apr to Dec is null. 
 Note that the result table has 13 columns (1 for the department id + 12 for the months). */ 
  
  
 Code: 
 SELECT id,  
 SUM(CASE WHEN month="Jan" THEN revenue ELSE null END) AS Jan_Revenue,  
 SUM(CASE WHEN month="Feb" THEN revenue ELSE null END) AS Feb_Revenue,  
 SUM(CASE WHEN month="Mar" THEN revenue ELSE null END) AS Mar_Revenue,  
 SUM(CASE WHEN month="Apr" THEN revenue ELSE null END) AS Apr_Revenue,  
 SUM(CASE WHEN month="May" THEN revenue ELSE null END) AS May_Revenue,  
 SUM(CASE WHEN month="Jun" THEN revenue ELSE null END) AS Jun_Revenue,  
 SUM(CASE WHEN month="Jul" THEN revenue ELSE null END) AS Jul_Revenue,  
 SUM(CASE WHEN month="Aug" THEN revenue ELSE null END) AS Aug_Revenue,  
 SUM(CASE WHEN month="Sep" THEN revenue ELSE null END) AS Sep_Revenue,  
 SUM(CASE WHEN month="Oct" THEN revenue ELSE null END) AS Oct_Revenue,  
 SUM(CASE WHEN month="Nov" THEN revenue ELSE null END) AS Nov_Revenue,  
 SUM(CASE WHEN month="Dec" THEN revenue ELSE null END) AS Dec_Revenue 
 FROM department 
 GROUP BY id 
 ORDER BY id;