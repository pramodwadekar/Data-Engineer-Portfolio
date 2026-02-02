-- Assignments:
-- 1: Assienmcot DML Insert JournalColumns
insert into Journal values('3209', 'Omnitrix', 'Scientific', 120, 'P105')

-- 2: Assignment DML Insert Journal
INSERT INTO Journal VALUES ('3210', 'Tech-Era', 'Scientific', 10, 'M101');

-- 3: Assignment DML InsertPublisher
insert into Publisher values('P105', 'Oxford Press, 4.6, NULL);

-- 4: Assignment DML InsertCustomer
INSERT INTO Customer VALUES ('C118', 'Joseph', NULL, 'Florida', 'Miami');

-- 5: Assignment DML InsertSubscriptions
insert into Subscription values('5315', 'J206', 'C103', '2023-08-17', '6', NULL), (S316', NULL, NULL, '2023-02-15', '5', '10')

-- 6: Assignment DML Insert Subscription
INSERT INTO Subscription
(SUBSCRIPTIONID, JOURNALID, CUSTOMERID, DURATIONINMONTHS, DISCOUNTPERCENT)
VALUES ('5317', '1201', 'C105', 6, 15);


-- 7: Assignment DML DisplayJournals
SELECT JOURNALID, JOURNALNAME FROM JOURNAL WHERE GENRE IN ('Scientific', 'Politics')

-- 8: Assignment DML DisplayDiscountedAmount
SELECT JournalName,
       MonthlyCharges AS "Current Charges",
       MonthlyCharges * (1 - 5/100.0) AS "Offer Price",
       MonthlyCharges * (5/100.0) AS "Discounted Amount"
FROM Journal;


-- 9: Assignment DML Dates Range
SELECT SUBSCRIPTIONID, CUSTOMERID FROM SUBSCRIPTION WHERE STARTDATE BETWEEN '2023-01-01' AND '2023-06-30'

-- 10: Assignment DEL Display non Regular Customers
SELECT CUSTOMERID, CUSTOMERNAME, STATE, CITY FROM CUSTOMER WHERE CUSTOMERTYPE<> 'Regular';

-- 11: Assignment DEL SOLOperators
SELECT JOURNALNAME, GENRE FROM JOURNAL WHERE GENRE IN ('Trade', 'Politics') AND MONTHLYCHARGES BETWEEN 90 AND 125;

-- 12: Assignment DML Operators
SELECT CustomerId, CustomerName, CustomerType, State
FROM Customer
WHERE State = 'Illinois'
  AND (CustomerType LIKE '%rime%' OR CustomerType LIKE '%gul%');


-- 13: Assignment. DML MissingContact.Nos
SELECT PUBLISHERNAME FROM PUBLISHER WHERE CONTACTNO IS NULL;

-- 14: Assignment DML MonthlyCharges Range
SELECT JOURNALID, JOURNALNAME, MONTHLYCHARGES FROM JOURNAL WHERE MONTHLYCHARGES BETWEEN 86 AND 129;

-- 15:Assignment_DML_SelectiveGenre
SELECT JournalId, MonthlyCharges
FROM Journal
WHERE Genre IN ('Trade', 'Politics');


-- 16: Assignment DML UniqueStates
SELECT DISTINCT STATE FROM CUSTOMER

-- 17: Assignment DBL UniqueStartDates
SELECT DISTINCT STARTDATE FROM SUBSCRIPTION

-- 18: Assignment DML UniqueStatePerCustomerType
SELECT DISTINCT CUSTOMERTYPE, STATE FROM CUSTOMER

-- 19: Assignment DML Like ti
SELECT JOURNALNAME, GENRE FROM JOURNAL WHERE GENRE LIKE '%ti%'

-- 20: Assignment DML LIKE
SELECT FROM PUBLISHER WHERE PUBLISHERNAME LIKE '%i_'
