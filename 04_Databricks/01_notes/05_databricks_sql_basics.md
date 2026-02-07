# 05 - Databricks SQL Basics (Data Engineer)

Databricks SQL is used for analytics, reporting, dashboards, and also for DE tasks like table validation.

---

## 1) What is Databricks SQL?
Databricks SQL is a SQL execution environment on Databricks.

It provides:
- SQL editor
- SQL Warehouses (compute)
- dashboards
- query history
- BI tool integration

---

## 2) Databricks SQL vs Spark SQL

### Spark SQL
- executed inside Spark cluster
- used in notebooks/jobs

### Databricks SQL
- executed on SQL Warehouse
- optimized for BI queries
- supports dashboards

---

## 3) SQL Warehouse (Compute)
A SQL warehouse is compute dedicated for SQL queries.

Key concepts:
- warehouse size
- auto stop/start
- concurrency
- serverless warehouses (if enabled)

---

## 4) Creating Tables in Databricks SQL

Example:
```sql
CREATE TABLE IF NOT EXISTS demo_sales (
  id INT,
  amount DOUBLE,
  created_at TIMESTAMP
) USING DELTA;
```

---

## 5) Querying Delta Tables
```sql
SELECT * FROM demo_sales;
```

---

## 6) Creating Views
### Temp View
```sql
CREATE OR REPLACE TEMP VIEW v_sales AS
SELECT * FROM demo_sales;
```

### Permanent View
```sql
CREATE VIEW IF NOT EXISTS v_sales_perm AS
SELECT * FROM demo_sales;
```

---

## 7) SQL Dashboards
You can create:
- charts
- KPI cards
- filters

---

## 8) BI Tool Integration
Databricks SQL supports:
- Power BI
- Tableau
- Looker
- Excel

---

## 9) SQL Best Practices
- use Delta tables
- avoid SELECT *
- use partition pruning
- use OPTIMIZE for small files
- use ZORDER for common filters

---

## 10) Interview Questions
### Q1) What is SQL Warehouse?
**Answer:**
A compute layer dedicated for running SQL queries.

### Q2) Databricks SQL vs notebook SQL?
**Answer:**
Databricks SQL runs on warehouse and is optimized for analytics.

---

## 11) Summary
- Databricks SQL is used for BI + analytics
- SQL warehouses provide compute
- Use Delta for tables

---

✅ Next: `06_delta_lake_in_databricks.md`
