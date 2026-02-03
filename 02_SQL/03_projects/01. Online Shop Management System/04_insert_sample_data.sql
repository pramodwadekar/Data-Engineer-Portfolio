INSERT INTO Categories (CategoryName) VALUES
('Electronics'), ('Clothing'), ('Books');

INSERT INTO Products (ProductName, Price, Stock, CategoryID) VALUES
('Laptop', 55000, 10, 1),
('Mobile', 20000, 20, 1),
('T-Shirt', 500, 50, 2),
('SQL Book', 800, 30, 3);

INSERT INTO Customers (CustomerName, Email, Phone, City) VALUES
('Amit', 'amit@gmail.com', '9999999999', 'Pune'),
('Rohit', 'rohit@gmail.com', '8888888888', 'Mumbai'),
('Neha', 'neha@gmail.com', '7777777777', 'Nashik');

INSERT INTO Employees (EmployeeName, Role, Salary) VALUES
('Suresh', 'Sales', 25000),
('Mahesh', 'Manager', 40000);

INSERT INTO Orders (CustomerID, OrderDate, EmployeeID) VALUES
(1, '2026-02-01', 1),
(2, '2026-02-02', 2),
(3, '2026-02-03', 1);

INSERT INTO OrderItems (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 4, 2);

INSERT INTO Payments (OrderID, Amount, PaymentDate, PaymentMode) VALUES
(1, 56000, '2026-02-01', 'UPI'),
(2, 20000, '2026-02-02', 'Card'),
(3, 1600, '2026-02-03', 'Cash');
