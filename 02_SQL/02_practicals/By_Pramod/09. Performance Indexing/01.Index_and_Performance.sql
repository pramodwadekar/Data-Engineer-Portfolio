Index Scans
- Index Unique Scan
SELECT * FROM Employee WHERE Email = 'jack@gmail.com';


- Index Range Scan
SELECT * FROM Employee WHERE Dept = 'ETA';



-- Guided Activity 1
- Check Execution Plan
EXPLAIN PLAN FOR SELECT FirstName 
FROM Employee 
WHERE FirstName = 'Jack';


- Create Index
CREATE INDEX EMPLOYEE_IDX1_FIRSTNAME 
ON Employee(FirstName);


- Re-run Execution Plan
EXPLAIN PLAN FOR SELECT FirstName 
FROM Employee 
WHERE FirstName = 'Jack';



Guided Activity 2
SELECT EmpId, FirstName 
FROM Employee 
WHERE Dept = 'ETA' AND Salary = 50000;



Best Practices
- Avoid SELECT *
-- Original
SELECT * FROM Product;

-- Enhanced
SELECT ProdId, Price FROM Product;


- Avoid DISTINCT with JOIN
-- Original
SELECT DISTINCT SName
FROM Salesman SM, Sale S, SaleDetail SD, Product P
WHERE SM.SId = S.SId
  AND S.SaleId = SD.SaleId
  AND P.ProdId = SD.ProdId
  AND P.PDesc = 'Basketball';

-- Enhanced
SELECT SName
FROM Salesman
WHERE SId IN (
  SELECT S.SId
  FROM Sale S, SaleDetail SD, Product P
  WHERE S.SaleId = SD.SaleId
    AND P.ProdId = SD.ProdId
    AND P.PDesc = 'Basketball'
);


- Use EXISTS instead of COUNT(*)
-- Original
SELECT COUNT(*)
FROM Salesman SM, Sale S
WHERE SM.SId = S.SId
  AND SIDate = '1-Jan-2014'
  AND Location = 'London';

-- Enhanced
SELECT SId
FROM Salesman SM
WHERE Location = 'London'
  AND EXISTS (
    SELECT 1
    FROM Sale S
    WHERE SM.SId = S.SId
      AND SIDate = '1-Jan-2014'
  );


- Avoid unnecessary computations
-- Original
SELECT Id, EName
FROM Employee
WHERE (Salary + 10000) > 35000
ORDER BY Id;

-- Enhanced
SELECT Id, EName
FROM Employee
WHERE Salary > 25000
ORDER BY Id;


- Avoid functions in WHERE clause
-- Original
SELECT EName
FROM Employee
WHERE MONTHS_BETWEEN(SYSDATE, DOJ) <= 18;

-- Enhanced
SELECT EName
FROM Employee
WHERE DOJ >= ADD_MONTHS(SYSDATE, -18);


- Use UNION ALL instead of UNION
-- Original
SELECT EName
FROM Employee WHERE Manager IS NULL
UNION
SELECT EName
FROM Employee E1
WHERE EXISTS (
  SELECT 1 FROM Employee E2
  WHERE E1.Manager = E2.Id
    AND E2.Manager IS NULL
)
ORDER BY 1;

-- Enhanced
SELECT EName
FROM Employee WHERE Manager IS NULL
UNION ALL
SELECT EName
FROM Employee E1
WHERE EXISTS (
  SELECT 1 FROM Employee E2
  WHERE E1.Manager = E2.Id
    AND E2.Manager IS NULL
)
ORDER BY 1;


- Use WHERE instead of HAVING (without aggregates)
-- Original
SELECT Dept, ROUND(AVG(Salary),2) AS Avg_Salary
FROM Employee
GROUP BY Dept
HAVING Dept IN ('ETA', 'ICP');

-- Enhanced
SELECT Dept, ROUND(AVG(Salary),2) AS Avg_Salary
FROM Employee
WHERE Dept IN ('ETA', 'ICP')
GROUP BY Dept;


- Avoid negative search
-- Original
SELECT EName
FROM Employee
WHERE Dept <> 'ETA';

-- Enhanced
SELECT EName
FROM Employee
WHERE Dept IN ('ICP');




