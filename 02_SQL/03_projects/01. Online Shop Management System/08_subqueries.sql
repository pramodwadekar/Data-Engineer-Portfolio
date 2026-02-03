-- Products more expensive than average price
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

-- Customers who placed orders
SELECT CustomerName
FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Orders);

-- Most expensive product
SELECT *
FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products);
