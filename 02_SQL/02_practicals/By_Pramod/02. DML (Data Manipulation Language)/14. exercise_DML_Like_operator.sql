-- Problem Statement
-- Display CustId, CustName, Age, and Email of customers who have:
-- - 'a' in CustName at any position
-- - 'u' in CustLocation at any position

SELECT CustId, CustName, Age, Email
FROM Customer
WHERE CustName LIKE '%a%'
  AND CustLocation LIKE '%u%';


