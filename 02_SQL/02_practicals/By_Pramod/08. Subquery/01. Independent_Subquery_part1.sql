-- Subquery in SELECT clause
SELECT Id, EName, Salary, 
       (SELECT AVG(Salary) FROM Employee) AS AvgSal
FROM Employee;

-- Subquery in FROM clause
SELECT * 
FROM (SELECT Id, EName, Salary FROM Employee) A;

-- Subquery in WHERE clause
SELECT Id, EName, Salary 
FROM Employee A 
WHERE Salary = (SELECT MAX(Salary) FROM Employee B);

-- Subquery in HAVING clause
SELECT Dept 
FROM Employee 
GROUP BY Dept 
HAVING SUM(Salary) > (SELECT MAX(Salary) FROM Employee);


-- ## Example with Computer table

-- Subquery in SELECT clause: Display details with average price
SELECT CompId, Make, Model, Price, 
       (SELECT AVG(Price) FROM Computer) AS AVG_PRICE
FROM Computer;

-- Subquery in FROM clause: Highest total price across all Makes
SELECT MAX(Q1.TotalPrice) AS MaxTotalPrice
FROM (SELECT SUM(Price) AS TotalPrice 
      FROM Computer 
      GROUP BY Make) Q1;


-- ## Tryout Questions

-- Q1: Display details of all computers with average price
SELECT CompId, Make, Model, 
       (SELECT AVG(Price) FROM Computer) AS AVG_PRICE
FROM Computer;

-- Q2: Display the highest total price across all Makes
SELECT MAX(Q1.TotalPrice) AS MaxTotalPrice
FROM (SELECT SUM(Price) AS TotalPrice 
      FROM Computer 
      GROUP BY Make) Q1;
