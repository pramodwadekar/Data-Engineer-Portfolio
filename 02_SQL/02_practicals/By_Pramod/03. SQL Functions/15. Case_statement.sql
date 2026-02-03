-- 1. Simple CASE (Equality check on one column)
SELECT Id, EName, Designation, Salary,
       CASE Designation
            WHEN 'SE'  THEN Salary * 1.2
            WHEN 'SSE' THEN Salary * 1.1
            ELSE Salary * 1.05
       END AS New_Salary
FROM Employee;

-- 2. Searched CASE (Boolean expressions)
SELECT EName, Designation, Bonus,
       CASE 
            WHEN Designation = 'SE'  THEN Salary * 1.2
            WHEN Designation = 'SSE' THEN Salary * 1.1
            ELSE Salary * 1.05
       END AS New_Salary
FROM Employee;

-- 3. Multiple Conditions Example (Correct)
SELECT Id, EName, Designation, Salary,
       CASE 
            WHEN Designation IN ('SE','SSE') THEN TO_CHAR(Salary * 1.2)
            WHEN Designation = 'PM' AND Salary >= 90000 THEN 'No hike'
            ELSE TO_CHAR(Salary * 1.05)
       END AS New_Salary
FROM Employee;
