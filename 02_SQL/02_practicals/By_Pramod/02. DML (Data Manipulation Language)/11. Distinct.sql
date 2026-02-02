-- 🔹 1. Without DISTINCT
SELECT Make
FROM Computer;

-- Output:
-- Dell
-- Dell
-- Lenovo
-- Lenovo
-- Dell

--🔹 2. With DISTINCT (single column)
SELECT DISTINCT Make
FROM Computer;

-- Output:
-- Dell
-- Lenovo


-- 🔹 3. DISTINCT with multiple column
SELECT DISTINCT Make, Model
FROM Computer;

-- 🔹 4. DISTINCT with NULL value
SELECT DISTINCT Price
FROM Computer;

-- 🔹 5. Incorrect use of DISTINCT
SELECT CompId, DISTINCT Make
FROM Computer;
-- ❌ Error → DISTINCT must be placed immediately after SELECT, not between columns.
