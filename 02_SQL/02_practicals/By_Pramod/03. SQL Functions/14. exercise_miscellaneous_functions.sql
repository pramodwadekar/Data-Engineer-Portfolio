-- 1️⃣ Exercise Function NVL
SELECT 
    CUSTID AS "CustomerId", 
    CUSTNAME AS "CustomerName", 
    NVL(TO_CHAR(Email), 'Not Provided') AS "CustEmail", 
    NVL(Age, 0) AS "CustAge" 
FROM Customer;

-- 2️⃣ Exercise Functions StringInCharacterColum
SELECT 
    VendorId, 
    NVL(TO_CHAR(Rating), 'Not Provided') AS "RATING" 
FROM Vendor;
