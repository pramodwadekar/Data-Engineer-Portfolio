-- Exercise DDL Create VendorOffering
-- Composite Primary key example:
/* Create the VendorOffering table as per the structure given below: 
| Column Name | Data Type and Size | Constraint                         | Description                                                      |
| ----------- | ------------------ | ---------------------------------- | ---------------------------------------------------------------- |
| VendorId    | VARCHAR(5)         | FOREIGN KEY, PRIMARY KEY           | Existing `VendorId` present in the **Vendor** table              |
| ProductId   | VARCHAR(5)         | FOREIGN KEY, NOT NULL, PRIMARY KEY | Existing `ProductId` present in the **Product** table            |
| Price       | NUMERIC(7,2)       | NOT NULL, CHECK                    | Price offered by the vendor in INR, should be greater than **0** |
*/
CREATE TABLE Vendoroffering (VendorId VARCHAR(5) REFERENCES Vendor (VendorId),
ProductId VARCHAR(5) NOT NULL REFERENCES Product (ProductId),
Price NUMERIC(7,2) NOT NULL CHECK (Price>0),
PRIMARY KEY (VendorId, ProductId));

-- Composite foregn key in same table in vendoroffering 
/*Create the invoice table as per the structure given below:
| Column Name       | Data Type and Size | Constraint         | Description                                                          |
| ----------------- | ------------------ | ------------------ | -------------------------------------------------------------------- |
| InvoiceId         | VARCHAR(5)         | PRIMARY KEY, CHECK | Unique `InvoiceId` for every invoice, should start with **'IN'**     |
| CustId            | VARCHAR(5)         | FOREIGN KEY        | Existing `CustId` present in **Customer** table                      |
| VendorId          | VARCHAR(5)         | FOREIGN KEY        | Existing `{VendorId, ProductId}` present in **VendorOffering** table |
| ProductId         | VARCHAR(5)         | FOREIGN KEY        | Existing `{VendorId, ProductId}` present in **VendorOffering** table |
| QuantityPurchased | NUMERIC(2)         | NOT NULL           | Quantity (number of products) purchased by the customer              |
| Discount          | NUMERIC(3,1)       | NOT NULL           | Discount offered on the purchase (in percentage)                     |
| PurchaseDate      | DATE               | NOT NULL           | Date of purchase                                                     |
*/

-- Exercise DDL Create Invoice
CREATE TABLE Invoice (InvoiceId VARCHAR(5) PRIMARY KEY CHECK(InvoiceId LIKE 'IN%'),
CustId VARCHAR(5) REFERENCES Customer (CustId),
VendorId VARCHAR(5),
ProductId VARCHAR(5),
QuantityPurchased NUMERIC (2) NOT NULL,
Discount NUMERIC (3,1) NOT NULL,
PurchaseDate DATE NOT NULL,
foreign key (VendorId, ProductId) references Vendoroffering (VendorId, ProductId)) 
