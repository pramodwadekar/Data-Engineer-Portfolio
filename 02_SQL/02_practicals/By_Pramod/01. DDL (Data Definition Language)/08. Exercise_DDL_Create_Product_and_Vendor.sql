-- Exercise DDL Create Product

create table Product (Productid varchar(5) CONSTRAINT Productid_const_pk primary key 
check(productid LIKE'P%'), 
PName varchar (30) NOT NULL, 
Brand varchar (20) NOT NULL,
PCategory varchar(20));


-- Exercise DDL_Create Vendor
CREATE TABLE Vendor(
VendorId varchar (5) PRIMARY KEY CHECK( VendorId LIKE 'V%),
Vendorllame VARCHAR (30) NOT NULL,
VendorContactllo Numeric(10) unique,
Rating INTEGER CHECK(Rating BETWEEN 0 AND 5));
