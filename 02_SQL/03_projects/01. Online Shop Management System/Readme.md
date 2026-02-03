# 🛒 Online Shop Management System - SQL Project

## 📌 Project Overview

This is a complete SQL project for practicing and demonstrating **core to advanced SQL concepts** using a real-world scenario: an **Online Shop Management System**.

The project covers:
- Database design
- Table creation with constraints
- Sample data insertion
- CRUD operations
- Joins
- Aggregate functions
- Subqueries
- Views
- Indexes
- Stored Procedures
- Triggers
- Business reports

This project is suitable for:
- SQL practice
- Interview preparation
- Portfolio / GitHub showcase
- Understanding real-world relational database design

---

## 🧩 Why This Project?

In real-world applications, almost every system (e-commerce, billing, ERP, CRM) needs a well-designed relational database to store and manage data such as customers, products, orders, and payments.

This project simulates a **real Online Shop backend database** and is designed to:

- Practice **real-world database design**
- Understand **how different tables are related**
- Learn **how business data flows** (Customer → Order → Order Items → Payment)
- Apply **SQL concepts in a practical scenario** instead of only theory
- Build a **portfolio-ready SQL project** that can be explained in interviews

Instead of writing random queries, this project shows how SQL is used to:
- Store business data safely
- Maintain data integrity using constraints
- Fetch meaningful reports using joins and aggregations
- Automate tasks using procedures and triggers

---


## 🗄️ Database Used

- MySQL (You can adapt it to PostgreSQL / SQL Server with small changes)

---

## 📂 Project Structure

online-shop-sql-project/
│

├── README.md

├── 01_create_database.sql

├── 02_create_tables.sql

├── 03_constraints_indexes.sql

├── 04_insert_sample_data.sql

├── 05_basic_queries.sql

├── 06_joins_queries.sql

├── 07_aggregate_queries.sql

├── 08_subqueries.sql

├── 09_views.sql

├── 10_procedures.sql

├── 11_triggers.sql

└── 12_reports.sql


---

## ▶️ How to Run This Project

1. Open your SQL client (MySQL Workbench / phpMyAdmin / Command Line / etc.)
2. Run the files **in order**:

01_create_database.sql
02_create_tables.sql
03_constraints_indexes.sql
04_insert_sample_data.sql
05_basic_queries.sql
06_joins_queries.sql
07_aggregate_queries.sql
08_subqueries.sql
09_views.sql
10_procedures.sql
11_triggers.sql
12_reports.sql


3. Make sure each file executes successfully before moving to the next one.

---

## 🧱 Tables Included

- Categories
- Products
- Customers
- Employees
- Orders
- OrderItems
- Payments

---

## 🏗️ Database Design Explanation

The database is designed using a **relational model**:

- `Customers` stores customer details  
- `Products` stores product information  
- `Categories` groups products  
- `Orders` stores each order placed by a customer  
- `OrderItems` stores which products are inside each order (many-to-many relationship)  
- `Payments` stores payment details for orders  
- `Employees` stores staff who handle orders  

Relationships:
- One customer can place many orders
- One order can have many products (via OrderItems)
- One product belongs to one category
- One employee can handle many orders

This design follows:
- **Normalization principles**
- **Primary key & foreign key relationships**
- **Proper separation of concerns between entities**

--- 

## ✨ Features Covered

- ✅ CREATE, INSERT, UPDATE, DELETE (CRUD)
- ✅ PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL
- ✅ Indexes for performance
- ✅ INNER JOIN, LEFT JOIN, RIGHT JOIN
- ✅ Aggregate functions (COUNT, SUM, AVG, etc.)
- ✅ GROUP BY, HAVING
- ✅ Subqueries
- ✅ Views
- ✅ Stored Procedures
- ✅ Triggers
- ✅ Business Reports (Sales, Top Customers, Top Products, etc.)

---

## 📊 Example Reports

- Top selling products
- Customer who spent the most
- Monthly sales report
- Low stock products
- Orders handled by each employee

---

## 🎯 Learning Outcome

After completing this project, you will understand:
- How to design a relational database
- How to write optimized SQL queries
- How to use joins, subqueries, views, procedures, and triggers
- How to generate real business reports from SQL data

---

## 👨‍💻 Author

Created for learning and practice by:  
**Pramod Wadekar**

---

## 📜 License

This project is for educational purposes and free to use for learning and practice.
