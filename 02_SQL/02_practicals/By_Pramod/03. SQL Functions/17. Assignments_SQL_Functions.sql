-- Assignments:
-- 1: Assignment Functions Numeric
SELECT JournalId AS "JournalId", 
       FLOOR(MonthlyCharges - 70.25) AS "Rounded Integer" 
FROM Journal 
WHERE LENGTH(Genre) > 8;

-- 2: Assignment Functions CountSelectivePublishers
SELECT COUNT(ContactNo) AS "NumberOfPublishers" 
FROM Publisher 
WHERE LENGTH(PublisherName) > 5 
  AND ContactNo IS NOT NULL;

-- 3: Assignment_Functions_RoundOff2DecimalDigits:
SELECT JournalId AS "JournalId", 
       Genre AS "Genre", 
       MonthlyCharges AS "Old Price", 
       ROUND(MonthlyCharges * 0.625, 2) AS "New Price" 
FROM Journal 
WHERE Genre = 'Academics';

-- 4: Assignment Functions regularCustomers
SELECT CustomerId, CustomerName 
FROM Customer 
WHERE LOWER(CustomerType) = 'regular' 
  AND State LIKE '%o%';

-- 5: Assignment Functions SelectiveJournals
SELECT JournalId, JournalName 
FROM Journal 
WHERE SUBSTR(PublisherId, 4) > 2 
  AND JournalName LIKE '%o%' 
  AND JournalName LIKE '%t%';

-- 6: Assignment Functions Aggregate
SELECT MAX(DiscountPercent) AS "MaxDiscount", 
       MIN(DiscountPercent) AS "MinDiscount", 
       AVG(DiscountPercent) AS "AvgDiscount" 
FROM Subscription;

-- 7: Assignment_Functions_CombineColumnData
SELECT CONCAT(CustomerId, '/', SUBSTR(CustomerType, 1, 4)) AS "Customer-ID" 
FROM Customer;

-- 8: Assignment Functions CountUniqueStartDates
SELECT COUNT(DISTINCT StartDate) AS "Total Dates" 
FROM Subscription;

-- 9: Assignment Functions MinDiscountPercent
SELECT MIN(DiscountPercent) AS "Min Discount Percent", 
       COUNT(CustomerId) AS "No. Of Customers" 
FROM Subscription 
WHERE TO_CHAR(StartDate, 'MM') = '11';

-- 10: Assignment Functions NoofUniqueCustomers
SELECT COUNT(DISTINCT CustomerId) AS "NoOfUniqueCustomer" 
FROM Subscription 
WHERE TO_CHAR(StartDate, 'Month') != 'June';

-- OR
  
SELECT COUNT(DISTINCT CustomerId) AS "NoOfUniqueCustomer" 
FROM Subscription 
WHERE TO_CHAR(StartDate, 'MM') != '06';

-- 11: Assignment Functions_TotalMonthlyCharges
SELECT SUM(MonthlyCharges) AS "Monthly Charges" 
FROM Journal 
WHERE SUBSTR(PublisherId, 4) > 4;

-- 12: Assignment Functions NestedDateFunctions
SELECT SubscriptionId, CustomerId 
FROM Subscription 
WHERE ADD_MONTHS(StartDate, DurationInMonths) 
      BETWEEN DATE '2024-06-30' AND DATE '2024-07-30';

-- 13: Assignment Case JournalCategory
SELECT JournalName, MonthlyCharges,
       CASE 
            WHEN MonthlyCharges < 75 THEN 'LowCost'
            WHEN MonthlyCharges >= 75 AND MonthlyCharges <= 100 THEN 'AverageCost'
            ELSE 'HighCost'
       END AS JournalCategory
FROM Journal;


-- 14: Assignment_Case_NewMonthly.charges
SELECT JournalName, Genre, MonthlyCharges,
       CASE Genre
            WHEN 'Trade'      THEN MonthlyCharges * 1.1
            WHEN 'Scientific' THEN MonthlyCharges * 1.15
            WHEN 'Academics'  THEN MonthlyCharges * 1.05
            WHEN 'Politics'   THEN MonthlyCharges * 1.25
            ELSE MonthlyCharges * 1.20
       END AS "NewMonthlyCharge"
FROM Journal 
ORDER BY Genre;
