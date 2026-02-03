-- Basic Left Outer Join
SELECT C.CompId, C.Make, E.Id AS EmployeeId, E.CompId
FROM Computer C
LEFT OUTER JOIN Employee E ON C.CompId = E.CompId;


-- Filtering with IS NULL / IS NOT NULL
-- a. IS NULL on lookup table attribute
SELECT C.CompId, C.Make, E.Id AS EmployeeId, E.CompId
FROM Computer C
LEFT OUTER JOIN Employee E ON C.CompId = E.CompId
WHERE E.CompId IS NULL;


-- b. IS NULL on main table attribute
SELECT C.CompId, C.Make, E.Id AS EmployeeId, E.CompId
FROM Computer C
LEFT OUTER JOIN Employee E ON C.CompId = E.CompId
WHERE C.CompId IS NULL;


-- c. IS NOT NULL on lookup table attribute
SELECT C.CompId, C.Make, E.Id AS EmployeeId, E.CompId
FROM Computer C
LEFT OUTER JOIN Employee E ON C.CompId = E.CompId
WHERE E.CompId IS NOT NULL;


-- d. IS NOT NULL on main table attribute
SELECT C.CompId, C.Make, E.Id AS EmployeeId, E.CompId
FROM Computer C
LEFT OUTER JOIN Employee E ON C.CompId = E.CompId
WHERE C.CompId IS NOT NULL;



-- Filtering with WHERE vs ON
-- a. Predicate on main table in WHERE clause
SELECT C.CompId, C.Make, E.Id AS EmployeeId, E.CompId
FROM Computer C
LEFT OUTER JOIN Employee E ON C.CompId = E.CompId
WHERE C.Make = 'Lenovo';


-- b. Predicate on main table in ON clause
SELECT C.CompId, C.Make, E.Id AS EmployeeId, E.CompId
FROM Computer C
LEFT OUTER JOIN Employee E ON C.CompId = E.CompId
AND C.Make = 'Lenovo';


-- c. Predicate on lookup table in WHERE clause
SELECT C.CompId, C.Make, E.Id AS EmployeeId, E.CompId
FROM Computer C
LEFT OUTER JOIN Employee E ON C.CompId = E.CompId
WHERE E.Dept = 'ETA';


-- d. Predicate on lookup table in ON clause
SELECT C.CompId, C.Make, E.Id AS EmployeeId, E.CompId
FROM Computer C
LEFT OUTER JOIN Employee E ON C.CompId = E.CompId
AND E.Dept = 'ETA';



-- Examples with Employee as Main Table
-- Employees from ETA department
SELECT Id, EName, Dept, E.CompId AS E_CompId, C.CompId AS C_CompId, Model
FROM Employee E
LEFT OUTER JOIN Computer C ON E.CompId = C.CompId
WHERE Dept = 'ETA';


-- Employees with computers manufactured in 2014
SELECT Id, EName, E.CompId AS E_CompId, C.CompId AS C_CompId, Model
FROM Employee E
LEFT OUTER JOIN Computer C ON E.CompId = C.CompId
AND MYear = '2014';



-- == Summary Queries
-- - Lenovo computers with employee details (or NULL if not allocated):
SELECT C.CompId, C.Make, E.Id AS EmployeeId, E.CompId
FROM Computer C
LEFT OUTER JOIN Employee E ON C.CompId = E.CompId
WHERE C.Make = 'Lenovo';


-- - All computers, but only Lenovo ones show employee details:
SELECT C.CompId, C.Make, E.Id AS EmployeeId, E.CompId
FROM Computer C
LEFT OUTER JOIN Employee E ON C.CompId = E.CompId
AND C.Make = 'Lenovo';


-- - All computers with ETA employees:
SELECT C.CompId, C.Make, E.Id AS EmployeeId, E.CompId
FROM Computer C
LEFT OUTER JOIN Employee E ON C.CompId = E.CompId
AND E.Dept = 'ETA';


-- - Only computers allocated to ETA employees (INNER JOIN):
SELECT C.CompId, C.Make, E.Id AS EmployeeId, E.CompId, E.Dept
FROM Computer C
INNER JOIN Employee E ON C.CompId = E.CompId
AND E.Dept = 'ETA';




