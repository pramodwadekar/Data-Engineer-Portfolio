# 🛍️ E-commerce Data Warehouse + Incremental ETL (SQL)

## Project Overview
This is an end-to-end **Data Engineering SQL project** where raw e-commerce transactional data is cleaned and transformed into a **Star Schema Data Warehouse**.

In addition to warehouse modeling, this project also simulates **incremental loads** (daily new orders) and includes **data quality checks**.

---

## Why this project?
Most companies store data in OLTP format (orders, customers, products).  
But reporting and analytics require OLAP format (fact + dimension tables).

This project demonstrates:
- OLTP ➝ OLAP transformation
- Data cleaning for real bad data
- Fact/Dimension modeling
- Incremental load logic
- KPI analytics queries
- Performance optimization with indexes

---

## Dataset
`sample_data/`
- customers.csv
- products.csv
- orders.csv
- order_items.csv

⚠️ Note: These files intentionally include bad data:
- duplicates
- null values
- invalid statuses
- negative price
- invalid foreign keys
- invalid email format

---

## Star Schema
### Dimension Tables
- `dim_customer`
- `dim_product`
- `dim_date`

### Fact Tables
- `fact_orders` (order level)
- `fact_sales`  (order item level)

---

## Run Order (PostgreSQL)
1. `02_raw_schema.sql`
2. Load CSV into raw tables
3. `04_data_cleaning.sql`
4. `05_dim_tables.sql`
5. `06_fact_tables.sql`
6. `07_incremental_load.sql`
7. `08_kpi_queries.sql`
8. `09_data_quality_checks.sql`
9. `10_performance_optimization.sql`

---

## Databricks SQL Version
Inside `databricks_sql/` folder.
