-- ✅ Basic Fund Transfer (Debit & Credit)
UPDATE Account 
SET Balance = Balance - 35000 
WHERE AccountNumber = 101;

UPDATE Account 
SET Balance = Balance + 35000 
WHERE AccountNumber = 102;



--  ✅ Correct Transaction Logic (Ensuring Consistency)
SET TRANSACTION READ WRITE;

UPDATE Account 
SET Balance = Balance - 35000 
WHERE AccountNumber = 101;

UPDATE Account 
SET Balance = Balance + 35000 
WHERE AccountNumber = 102;

COMMIT;



-- ❌ Incorrect Transaction Logic (Causes Inconsistency)
SET TRANSACTION READ WRITE;

UPDATE Account 
SET Balance = Balance - 35000 
WHERE AccountNumber = 101;

COMMIT;

UPDATE Account 
SET Balance = Balance + 35000 
WHERE AccountNumber = 102;
--(Here, John’s debit is committed but Jack’s credit is not, leaving the database inconsistent.)



-- ✅ Autocommit Example
SET TRANSACTION <transaction mode>;

UPDATE Account 
SET Balance = Balance - 35000 
WHERE AccountNumber = 101;

COMMIT;



-- ✅ Check Autocommit Status
SELECT AUTOCOMMIT 
FROM INFORMATION_SCHEMA.SYSTEM_SESSIONS;



-- ✅ Change Autocommit Mode
SET AUTOCOMMIT TRUE;   -- Auto commit ON
SET AUTOCOMMIT FALSE;  -- Auto commit OFF



