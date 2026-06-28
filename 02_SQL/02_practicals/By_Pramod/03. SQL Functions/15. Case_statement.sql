/*
| Id  | EName | Designation | Salary | Bonus |
| --- | ----- | ----------- | -----: | ----: |
| 101 | Amit  | SE          |  50000 |  5000 |
| 102 | Rahul | SSE         |  70000 |  7000 |
| 103 | Priya | PM          |  95000 | 10000 |
| 104 | Neha  | TL          |  80000 |  8000 |
*/

-- 1. Simple CASE (Equality check on one column)
SELECT Id, EName, Designation, Salary,
       CASE Designation
            WHEN 'SE'  THEN Salary * 1.2
            WHEN 'SSE' THEN Salary * 1.1
            ELSE Salary * 1.05
       END AS New_Salary
FROM Employee;
/*
Id   EName   Designation   Salary   New_Salary
---  ------  ------------  -------  ----------
101  Amit    SE             50000      60000
102  Rahul   SSE            70000      77000
103  Priya   PM             95000      99750
104  Neha    TL             80000      84000
*/


-- 2. Searched CASE (Boolean expressions)
SELECT EName, Designation, Bonus,
       CASE 
            WHEN Designation = 'SE'  THEN Salary * 1.2
            WHEN Designation = 'SSE' THEN Salary * 1.1
            ELSE Salary * 1.05
       END AS New_Salary
FROM Employee;
/*
EName   Designation   Bonus   New_Salary
------  ------------  ------  ----------
Amit    SE             5000      60000
Rahul   SSE            7000      77000
Priya   PM            10000      99750
Neha    TL             8000      84000
*/

-- 3. Multiple Conditions Example (Correct)
SELECT Id, EName, Designation, Salary,
       CASE 
            WHEN Designation IN ('SE','SSE') THEN TO_CHAR(Salary * 1.2)
            WHEN Designation = 'PM' AND Salary >= 90000 THEN 'No hike'
            ELSE TO_CHAR(Salary * 1.05)
       END AS New_Salary
FROM Employee;
/*
Id   EName   Designation   Salary   New_Salary
---  ------  ------------  -------  ----------
101  Amit    SE             50000    60000
102  Rahul   SSE            70000    84000
103  Priya   PM             95000    No hike
104  Neha    TL             80000    84000
*/
