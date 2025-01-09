/* Report for every three line segments whether they can form a triangle.
Return the result table in any order.
The result format is in the following example.

Input: 
Triangle table:
+----+----+----+
| x  | y  | z  |
+----+----+----+
| 13 | 15 | 30 |
| 10 | 20 | 15 |
+----+----+----+
Output: 
+----+----+----+----------+
| x  | y  | z  | triangle |
+----+----+----+----------+
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |
+----+----+----+----------+ */

SELECT *, IF(x+y>z AND y+z>x AND z+x>y, "Yes", "No") as triangle 
FROM Triangle;
