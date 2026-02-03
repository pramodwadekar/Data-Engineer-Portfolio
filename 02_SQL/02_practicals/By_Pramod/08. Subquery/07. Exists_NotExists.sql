-- 📘 SQL Code from Exists / Not Exists and Tryout.pdf
-- 1. Using EXISTS operator
-- Display CompId, Make, and Model of the computers that are allocated to any employee:
SELECT CompId, Make, Model
FROM Computer C
WHERE EXISTS (
    SELECT 1
    FROM Employee E
    WHERE E.CompId = C.CompId
);

-- 2. Using NOT EXISTS operator
-- Display CompId, Make, and Model of the computers that are not allocated to any employee:
SELECT CompId, Make, Model
FROM Computer C
WHERE NOT EXISTS (
    SELECT 1
    FROM Employee E
    WHERE E.CompId = C.CompId
);
