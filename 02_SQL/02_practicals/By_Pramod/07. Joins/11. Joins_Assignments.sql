-- ASSIGNMENTS
-- 1: Assignment Join Andor
SELECT customerid, customername
FROM customer c
INNER JOIN subscription s ON c.customerid = s.customerid
WHERE customertype IN ('Regular', 'Prime')
GROUP BY customerid, customername;


-- 2: Assignment Join Where
SELECT journalid, publishername
FROM publisher p
INNER JOIN journal j ON p.publisherid = j.publisherid
WHERE p.contactNo IS NOT NULL;


-- 3: Assignment Join CustomerWiseSubscriptionCount
SELECT customerid, customername, COUNT(*) AS "SUBSCRIPTIONCOUNT"
FROM customer c
INNER JOIN subscription s ON c.customerid = s.customerid
GROUP BY customerid, customername
HAVING COUNT(*) > 1;


-- 4: Assignment Join FilterStartdate
SELECT customername, journalname, startdate, durationinmonths
FROM customer c
INNER JOIN subscription s ON c.customerid = s.customerid
INNER JOIN journal j ON j.journalid = s.journalid
WHERE s.startdate <= DATE '2023-11-01';


-- 5: Assignment Join_SelectiveJournals
SELECT journalname, genre
FROM journal j1
INNER JOIN subscription s ON j1.journalid = s.journalid
WHERE s.discountpercent > 10;


-- 6: Assignment Join_SameGence DifferentPublisher
SELECT publishername, genre, rating
FROM journal j1
INNER JOIN journal j2 ON j1.genre = j2.genre AND j1.journalid != j2.journalid
INNER JOIN publisher p ON p.publisherid = j1.publisherid
GROUP BY publishername, genre, rating;


-- 7: Assignment_Join_CountPublisherWiseUniqueSubscriptions
SELECT p.publishername AS "PublisherName",
       COUNT(DISTINCT customerid) AS "NoOfUniqueSubscribers"
FROM publisher p
INNER JOIN journal j ON p.publisherid = j.publisherid
INNER JOIN subscription s ON s.journalid = j.journalid
GROUP BY p.publishername
HAVING COUNT(customerid) > 3;


-- 8: Assignment Join_PublisherWiseMonthlyCharges
SELECT publishername,
       SUM(J.monthlycharges * S.durationinmonths * (1 - S.discountpercent/100)) AS "TOTALREVENUE"
FROM publisher p
INNER JOIN journal J ON p.publisherid = J.publisherid
INNER JOIN subscription S ON S.journalid = J.journalid
GROUP BY publishername
ORDER BY SUM(J.monthlycharges * S.durationinmonths * (1 - S.discountpercent/100)) DESC;


-- 10:Assignment_Join_CountPublisherWiseSubscriptions
SELECT publishername, COUNT(subscriptionid) AS "NO_SUBSCRIPTION"
FROM publisher p
INNER JOIN journal j ON p.publisherid = j.publisherid
INNER JOIN subscription s ON j.journalid = s.journalid
GROUP BY publishername
HAVING COUNT(subscriptionid) >= 3;


-- 11: Assignment Join FilterCustomers
SELECT customername, journalname
FROM journal j
INNER JOIN subscription s ON j.journalid = s.journalid
INNER JOIN customer c ON c.customerid = s.customerid
WHERE j.genre = 'Trade' AND c.state = 'Illinois';


-- 12: Assignment_Join_SamePublisher SameGenre
SELECT j.journalid, j.journalname, j.genre, j.publisherid
FROM journal j
INNER JOIN publisher p ON p.publisherid = j.publisherid
INNER JOIN journal j2 ON j.genre = j2.genre
                     AND j.publisherid = j2.publisherid
                     AND j.journalid != j2.journalid
GROUP BY j.journalid, j.journalname, j.genre, j.publisherid;


13: Assignment_Join_CountSubscriptions
SELECT publishername,
       NVL(genre, 'NOT PUBLISHED') AS "GENRE",
       COUNT(subscriptionid) AS "SUBSCRIBERCOUNT"
FROM publisher p
FULL OUTER JOIN journal j ON p.publisherid = j.publisherid
FULL OUTER JOIN subscription s ON j.journalid = s.journalid
GROUP BY publishername, genre;

-- OR
  
SELECT publishername,
       NVL(genre, 'NOT PUBLISHED') AS "GENRE",
       COUNT(subscriptionid) AS "SUBSCRIBERCOUNT"
FROM publisher p1
LEFT OUTER JOIN journal j ON p1.publisherid = j.publisherid
LEFT OUTER JOIN subscription s ON s.journalid = j.journalid
GROUP BY publishername, genre;


-- 14: Assignment Join AllPublishers
SELECT publishername, contactno,
       NVL(journalname, 'NO JOURNAL') AS "JOURNALNAME"
FROM publisher p
LEFT OUTER JOIN journal j ON p.publisherid = j.publisherid;


-- 15: Assignment_Join_Publisher's Journals
SELECT publisherid,
       NVL(journalname, 'Yet To Publish') AS "JOURNAL_PUBLISHED"
FROM publisher p
LEFT OUTER JOIN journal j ON p.publisherid = j.publisherid;


-- 16: Assignment_Join_FilterAcademic Journals
SELECT publishername, journalname
FROM publisher p
LEFT OUTER JOIN journal j ON p.publisherid = j.publisherid AND j.genre = 'Academics'
WHERE j.rating >= 4;

