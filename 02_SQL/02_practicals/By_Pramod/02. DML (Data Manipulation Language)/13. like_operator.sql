-- 1. Names starting with 'E'
SELECT Id, EName
FROM Employee
WHERE EName LIKE 'E%';

-- 2. Names ending with 'r'
SELECT Id, EName
FROM Employee
WHERE EName LIKE '%r';

-- 3. Names containing 'm' anywhere
SELECT Id, EName
FROM Employee
WHERE EName LIKE '%m%';

-- 4. Date pattern (HSQL date format)
SELECT Id, EName, DOJ
FROM Employee
WHERE DOJ LIKE '2014-%';
-- (Example: matches all dates in 2014)

-- 5. Character at fixed position (second character = 'a')
SELECT Id, EName
FROM Employee
WHERE EName LIKE '_a%';
