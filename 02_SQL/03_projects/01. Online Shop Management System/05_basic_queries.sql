-- SELECT
SELECT * FROM Products;
SELECT * FROM Customers;

-- INSERT
INSERT INTO Customers (CustomerName, Email, Phone, City)
VALUES ('Rahul', 'rahul@gmail.com', '6666666666', 'Pune');

-- UPDATE
UPDATE Products
SET Price = 52000
WHERE ProductName = 'Laptop';

-- DELETE
DELETE FROM Customers
WHERE CustomerName = 'Rahul';

-- WHERE, ORDER BY
SELECT * FROM Products
WHERE Price > 1000
ORDER BY Price DESC;
