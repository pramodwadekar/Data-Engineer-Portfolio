CREATE VIEW OrderSummary AS
SELECT o.OrderID, c.CustomerName, o.OrderDate, pay.Amount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Payments pay ON o.OrderID = pay.OrderID;

-- Use the view
SELECT * FROM OrderSummary;
