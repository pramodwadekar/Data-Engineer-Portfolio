-- ASSIGNMENTS
-- 1: Assignment GroupBy_CountProduct
SELECT REVIEW, COUNT(REVIEW) AS "NUMBER_OF_PRODUCTS"
FROM PRODUCT
GROUP BY REVIEW;

-- 2: Assignment GroupBy MonthWiseCount
SELECT TO_CHAR(startdate, 'Month') AS "MONTH",
       COUNT(*) AS "SUBSCRIBERCOUNT"
FROM subscription
GROUP BY TO_CHAR(startdate, 'Month');

-- 3: Assignment GroupBy_TwoColumns
SELECT customerid, discountpercent,
       AVG(durationinmonths) AS "AVG_DURATION"
FROM subscription
WHERE durationinmonths > 3
GROUP BY customerid, discountpercent
HAVING COUNT(customerid) > 1;

-- 4: Assignment GroupBy_Having
SELECT pcategory
FROM product
GROUP BY pcategory
HAVING COUNT(pcategory) > 1;

-- 5: Assignment GroupBy GenreWiseAvgMonthlyCharges
SELECT genre, AVG(monthlycharges) AS "AVG_CHARGES"
FROM journal
GROUP BY genre
HAVING AVG(monthlycharges) > 100;

-- 6: Assignment GroupBy FilterMonthWiseCount
SELECT TO_CHAR(startdate, 'MON') AS "MONTH",
       COUNT(durationinmonths) AS "TOTAL_SUBSCRIPTIONS"
FROM subscription
WHERE durationinmonths >= 6
GROUP BY TO_CHAR(startdate, 'MON')
HAVING COUNT(startdate) > 1;

-- 7: Assignment GroupBy FilterAvgDiscount
SELECT journalid, AVG(discountpercent) AS "AVG_DIS"
FROM subscription
WHERE startdate < '2023-11-01'
GROUP BY journalid;

-- 8: Assignment_GroupBy_AvgMonthlyCharges
SELECT genre, AVG(monthlycharges) AS "Average Charge"
FROM journal
GROUP BY genre
HAVING AVG(monthlycharges) < 100;

-- 9: Assignment GroupBy_AvgMonthlyCharges
SELECT genre, AVG(monthlycharges) AS "Average Charge"
FROM journal
WHERE genre = 'Trade'
GROUP BY genre
HAVING AVG(monthlycharges) < 100;

-- 10: Assignment_GroupBy JournalWiseSubscription
SELECT journalid, COUNT(*) AS "TOTALSUBSCRIPTIONS"
FROM subscription
GROUP BY journalid;

-- 11: Assignment_GroupBy_FilterAvgCharges
SELECT publisherid, AVG(monthlycharges) AS "MONTHLY_CHARGES"
FROM journal
WHERE genre = 'Trade' OR genre = 'Politics'
GROUP BY publisherid
HAVING AVG(monthlycharges) < 110;

-- 12: Assignment_GroupBy StartDate
SELECT startdate, AVG(discountpercent) AS "AVG_DISCOUNT"
FROM subscription
WHERE durationinmonths >= 6
GROUP BY startdate
HAVING AVG(discountpercent) > 10;
