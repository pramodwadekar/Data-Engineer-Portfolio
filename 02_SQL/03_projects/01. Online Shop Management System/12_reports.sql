-- Top selling products
SELECT p.ProductName, SUM(oi.Quantity) AS TotalSold
FROM OrderItems oi
JOIN Products p ON oi.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC;

-- Best customer (highest spending)
SELECT c.CustomerName, SUM(p.Price * oi.Quantity) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
GROUP BY c.CustomerName
ORDER BY TotalSpent DESC
LIMIT 1;

-- Low stock products
SELECT ProductName, Stock
FROM Products
WHERE Stock < 10;

-- Orders handled by each employee
SELECT e.EmployeeName, COUNT(o.OrderID) AS TotalOrders
FROM Employees e
LEFT JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeName;
