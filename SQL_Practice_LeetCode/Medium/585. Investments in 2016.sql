/* Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who: 
  
 have the same tiv_2015 value as one or more other policyholders, and 
 are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique). 
 Round tiv_2016 to two decimal places. 
  
 The result format is in the following example. 
  
 Input:  
 Insurance table: 
 +-----+----------+----------+-----+-----+ 
 | pid | tiv_2015 | tiv_2016 | lat | lon | 
 +-----+----------+----------+-----+-----+ 
 | 1   | 10       | 5        | 10  | 10  | 
 | 2   | 20       | 20       | 20  | 20  | 
 | 3   | 10       | 30       | 20  | 20  | 
 | 4   | 10       | 40       | 40  | 40  | 
 +-----+----------+----------+-----+-----+ 
  
 Output:  
 +----------+ 
 | tiv_2016 | 
 +----------+ 
 | 45.00    | 
 +----------+ 
  
 Explanation:  
 The first record in the table, like the last record, meets both of the two criteria. 
 The tiv_2015 value 10 is the same as the third and fourth records, and its location is unique. 
  
 The second record does not meet any of the two criteria. Its tiv_2015 is not like any other policyholders and its location is the same as the third record, which makes the third record fail, too. 
 So, the result is the sum of tiv_2016 of the first and last record, which is 45. */ 
  
  
 WITH cte AS( 
     SELECT tiv_2015, count(*) FROM insurance 
     GROUP BY tiv_2015 HAVING count(*)>1 
 ),  
 cte1 AS( 
     SELECT lat, lon, count(*) FROM insurance 
     GROUP BY lat, lon HAVING count(*)=1 
 ) 
 SELECT round(sum(tiv_2016),2) AS "tiv_2016" FROM insurance WHERE tiv_2015 IN (SELECT tiv_2015 FROM cte) 
 AND (lat,lon) IN (SELECT lat, lon FROM cte1);