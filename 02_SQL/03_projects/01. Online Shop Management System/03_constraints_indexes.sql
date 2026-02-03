ALTER TABLE Categories
ADD CONSTRAINT uq_category_name UNIQUE (CategoryName);

ALTER TABLE Customers
ADD CONSTRAINT uq_customer_email UNIQUE (Email);

ALTER TABLE Products
ADD CONSTRAINT fk_products_category
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

ALTER TABLE Orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

ALTER TABLE Orders
ADD CONSTRAINT fk_orders_employee
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);

ALTER TABLE OrderItems
ADD CONSTRAINT fk_orderitems_order
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);

ALTER TABLE OrderItems
ADD CONSTRAINT fk_orderitems_product
FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

ALTER TABLE Payments
ADD CONSTRAINT fk_payments_order
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);

CREATE INDEX idx_product_name ON Products(ProductName);
CREATE INDEX idx_customer_name ON Customers(CustomerName);
