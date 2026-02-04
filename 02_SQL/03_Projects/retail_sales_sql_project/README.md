# 🛒 Retail Sales Data Warehouse & Analytics using SQL (Data Engineering Project)

## 📌 Project Overview
This project is a complete SQL-based Data Engineering project where raw retail transactional data is transformed into an analytics-ready Data Warehouse model (Star Schema).

In real companies, data is usually stored in transactional tables (OLTP).  
But for reporting, dashboards, and analytics, we need a Data Warehouse format (OLAP).

So in this project, I designed and built:
- Raw Source Tables (OLTP)
- Data Cleaning Layer
- Dimension Tables
- Fact Table
- Business KPI Analytics Queries
- Basic SQL Performance Optimization

---

## 🎯 Objective (Why this project?)
The main objective of this project is to demonstrate real-world SQL skills required for a Data Engineer role, such as:

✅ Converting raw transactional data into a Data Warehouse schema  
✅ Implementing ETL logic using SQL  
✅ Building Fact & Dimension tables  
✅ Writing analytics queries for business KPIs  
✅ Using advanced SQL concepts (CTE, Joins, Aggregations, Window functions)  
✅ Understanding optimization using indexing  

---

## 🧠 Business Problem Statement
A retail company wants to analyze its sales data to answer questions like:

- What is the total revenue?
- What is monthly revenue growth?
- Which customers spend the most?
- Which products are top-selling?
- Which categories generate the highest revenue?
- How many orders are placed daily/monthly?

The raw data is available in transactional form (customers, orders, products, order_items).  
The goal is to build an analytics-ready structure using SQL.

---

## 🗂️ Dataset Used
This project uses 4 CSV files (sample retail data):

- `customers.csv`
- `products.csv`
- `orders.csv`
- `order_items.csv`

---

## 🏗️ Project Architecture (SQL Pipeline)
The project is designed in multiple layers like real Data Engineering pipelines:

### 1️⃣ Raw Layer (OLTP Tables)
- customers
- products
- orders
- order_items

### 2️⃣ Cleaning Layer
- remove duplicates
- handle null values
- validate data types

### 3️⃣ Data Warehouse Layer (Star Schema)
#### Dimension Tables
- dim_customer
- dim_product

#### Fact Table
- fact_sales

### 4️⃣ Analytics Layer
KPI queries such as:
- total revenue
- monthly revenue
- top customers
- category performance
- top products

---

## ⭐ Star Schema Design
This project follows the Data Warehouse Star Schema approach.

### 🟦 Fact Table
**fact_sales**
- order_id
- order_date
- customer_id
- product_id
- quantity
- sales_amount

### 🟩 Dimension Tables
**dim_customer**
- customer_id
- customer_name
- city

**dim_product**
- product_id
- product_name
- category
- price

---

## 🧾 SQL Scripts Included
| File | Purpose |
|------|---------|
| `02_source_schema.sql` | Creates raw tables |
| `03_data_cleaning.sql` | Cleans raw data |
| `04_dim_tables.sql` | Builds dimension tables |
| `05_fact_table.sql` | Builds fact table |
| `06_analytics_queries.sql` | KPI queries |
| `07_performance_optimization.sql` | Indexing & optimization |

---

## 🔥 SQL Concepts Covered
This project covers the most important SQL skills required for Data Engineers:

- Joins (Inner Join)
- Group By Aggregations
- CTE (Common Table Expressions)
- Date functions (Monthly revenue)
- Fact and Dimension modeling
- Data cleaning logic
- Indexing for performance

---

## 📊 Sample KPIs Implemented
- Total Revenue
- Monthly Revenue Trend
- Top Customers by Spending
- Top Products by Sales
- Category-wise Revenue
- Daily Orders Count

---

## ⚡ Performance Optimization
To improve query performance, indexing is applied on:
- order_date
- customer_id

This is important because fact tables can grow very large in real-world systems.

---

## 🚀 Future Enhancements
In the next version of this project, I will extend it by:

- Implementing the same pipeline using PySpark
- Loading tables into Databricks Delta Lake
- Creating incremental load (CDC simulation)
- Building BI dashboards

---

## ✅ Outcome
This project demonstrates end-to-end SQL skills used in Data Engineering:
- transforming raw data
- designing star schema
- writing business KPI queries
- preparing data for reporting

---

## 👨‍💻 Author
**Pramod Wadekar**  
GitHub: pramodwadekar
