-- Exercise 1: Delete customers from Ithaca or Auburn with age < 35
DELETE FROM Customer
WHERE (CustLocation = 'Ithaca' OR CustLocation = 'Auburn')
AND Age < 35;

-- Exercise 2: Delete products with 'Bad' review
DELETE FROM Product
WHERE Review = 'Bad';

-- Exercise 3: Delete vendors with contact number but no rating
DELETE FROM Vendor
WHERE VendorContactNo IS NOT NULL
  AND Rating IS NULL;
