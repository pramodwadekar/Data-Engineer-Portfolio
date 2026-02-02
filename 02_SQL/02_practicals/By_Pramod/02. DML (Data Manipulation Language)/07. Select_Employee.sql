-- Basic SELECT

-- Select all rows and columns
SELECT * FROM Employee;

-- Select specific columns
SELECT Id, EName
FROM Employee;

-- Select with condition
SELECT Id, EName
FROM Employee
WHERE Salary > 40000;

-- Examples with Computer table

-- Select all rows and columns
SELECT * FROM Computer;

-- Select specific columns
SELECT CompId, Model
FROM Computer;

-- Alias examples
SELECT CompId Computer,
       CompId "Computer",
       CompId AS "Computer",
       CompId AS Computer
FROM Computer;

-- Missing comma (Model treated as alias)
SELECT CompId, Make Model
FROM Computer;

-- Expression (discount calculation)
SELECT CompId, Price * 0.25 AS "Discount"
FROM Computer;

-- Additional static column
SELECT CompId, 30 AS "Value", Make, Model, Price
FROM Computer;
