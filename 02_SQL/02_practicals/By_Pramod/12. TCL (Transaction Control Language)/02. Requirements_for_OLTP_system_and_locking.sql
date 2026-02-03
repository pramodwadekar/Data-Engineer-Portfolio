-- ✅ User Creation
CREATE USER rohan PASSWORD 'rohan123';
CREATE USER alia PASSWORD 'alia123';



-- ✅ View Users
SELECT * FROM INFORMATION_SCHEMA.SYSTEM_USERS;



-- ✅ Drop User
DROP USER <UserName>;



-- ✅ Grant Privileges
GRANT SELECT, UPDATE ON Employee TO Rohan, Alia;



-- ✅ Autocommit Control
SET AUTOCOMMIT FALSE;   -- Manual commit/rollback required
SET AUTOCOMMIT TRUE;    -- Auto commit after each statement



-- ✅ Read Data (Shared Lock Example)
SELECT * FROM Employee;


-- (Both Rohan and Alia can read simultaneously because SELECT acquires a Shared (S) Lock.)

-- ✅ Update Data (Exclusive Lock Example)
-- Rohan’s session
UPDATE Employee 
SET Salary = 32000 
WHERE Id = 4;

-- Alia’s session (waits until Rohan commits/rolls back)
UPDATE Employee 
SET Salary = 34000 
WHERE Id = 4;



-- ✅ Commit / Rollback (Releasing Locks)
COMMIT;    -- Saves changes and releases lock
ROLLBACK;  -- Discards changes and releases lock



-- 📌 Key Takeaways from the Guided Activity:
-- SELECT → acquires Shared Lock (S) → multiple users can read simultaneously.
-- UPDATE/INSERT/DELETE → acquires Exclusive Lock (X) → only one user can modify until commit/rollback.
-- Locks are released only after COMMIT or ROLLBACK.


