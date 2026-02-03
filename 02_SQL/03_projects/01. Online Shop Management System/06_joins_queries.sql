-- INNER JOIN
SELECT o.OrderID, c.CustomerName, o.OrderDate
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

-- MULTI TABLE JOIN
SELECT o.OrderID, p.ProductName, oi.Quantity
FROM OrderItems oi
JOIN Orders o ON oi.OrderID = o.OrderID
JOIN Products p ON oi.ProductID = p.ProductID;

-- LEFT JOIN
SELECT c.CustomerName, o.OrderID
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;
