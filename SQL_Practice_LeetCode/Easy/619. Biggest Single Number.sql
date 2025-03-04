/* Write a solution to find a maximum single number that appeared only once in the MyNumbers table. 
 Find the largest single number. If there is no single number, report null. 
 The result format is in the following example. 
  
 Input:  
 MyNumbers table: 
 +-----+ 
 | num | 
 +-----+ 
 | 8   | 
 | 8   | 
 | 3   | 
 | 3   | 
 | 1   | 
 | 4   | 
 | 5   | 
 | 6   | 
 +-----+ 
  
 Output:  
 +-----+ 
 | num | 
 +-----+ 
 | 6   | 
 +-----+ 
  
 Explanation: The single numbers are 1, 4, 5, and 6. 
 Since 6 is the largest single number, we return it. 
  
  
 Example 2: 
  
 Input:  
 MyNumbers table: 
 +-----+ 
 | num | 
 +-----+ 
 | 8   | 
 | 8   | 
 | 7   | 
 | 7   | 
 | 3   | 
 | 3   | 
 | 3   | 
 +-----+ 
  
 Output:  
 +------+ 
 | num  | 
 +------+ 
 | null | 
 +------+ 
  
 Explanation: There are no single numbers in the input table so we return null. */ 
  
  
 SELECT max(num) num  
 FROM (select num, count(*) FROM mynumbers GROUP BY num HAVING COUNT(*)=1) a;