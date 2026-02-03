-- Total number of products
SELECT COUNT(*) AS TotalProducts FROM Products;

-- Average price
SELECT AVG(Price) AS AvgPrice FROM Products;

-- Total sales per customer
SELECT c.CustomerName, SUM(p.Price * oi.Quantity) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
GROUP BY c.CustomerName;

-- HAVING
SELECT c.CustomerName, SUM(p.Price * oi.Quantity) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
GROUP BY c.CustomerName
HAVING TotalSpent > 20000;
