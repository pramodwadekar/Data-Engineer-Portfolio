-- Exercise DDL Create VendorOffering
CREATE TABLE Vendoroffering (VendorId VARCHAR(5) REFERENCES Vendor (VendorId),
ProductId VARCHAR(5) NOT NULL REFERENCES Product (ProductId),
Price NUMERIC(7,2) NOT NULL CHECK (Price>0),
PRIMARY KEY (VendorId, ProductId));

-- Exercise DDL Create Invoice
CREATE TABLE Invoice (InvoiceId VARCHAR(5) PRIMARY KEY CHECK(InvoiceId LIKE 'IN%'),
CustId VARCHAR(5) REFERENCES Customer (CustId),
VendorId VARCHAR(5),
ProductId VARCHAR(5),
QuantityPurchased NUMERIC (2) NOT NULL,
Discount NUMERIC (3,1) NOT NULL,
PurchaseDate DATE NOT NULL,
foreign key (VendorId, ProductId) references Vendoroffering (VendorId, ProductId)) 
