# 22 - Databricks SQL Warehouses (Deep) (Bonus)

Databricks SQL warehouses are compute resources dedicated for SQL analytics.

This topic is important if you apply for:
- Databricks SQL developer
- analytics engineer
- DE role with BI integration

---

## 1) What is SQL Warehouse?
SQL Warehouse is a compute engine used to run:
- SQL queries
- dashboards
- BI tool connections

---

## 2) SQL Warehouse vs Spark Cluster

### Spark Cluster
- best for ETL
- DataFrame API
- batch + streaming pipelines

### SQL Warehouse
- best for BI
- high concurrency SQL queries
- dashboards

---

## 3) Warehouse Size
Warehouse sizes define:
- CPU
- memory
- cost

---

## 4) Concurrency
Concurrency means:
How many users/queries can run at same time.

Higher concurrency = higher cost.

---

## 5) Auto Stop / Auto Start
Warehouses can:
- stop when idle
- start when query comes

This saves cost.

---

## 6) Serverless SQL (If enabled)
Databricks offers serverless warehouses in some editions.
Benefits:
- fast startup
- managed compute
- simplified scaling

---

## 7) Query Performance Tips
- use Delta tables
- use OPTIMIZE + ZORDER
- avoid SELECT *
- use partition pruning
- use filters on ZORDER columns

---

## 8) BI Tool Integration
Databricks SQL supports:
- Power BI
- Tableau
- Looker
- Excel

---

## 9) Interview Questions
### Q1) When to use SQL warehouse?
For BI dashboards and high concurrency SQL queries.

### Q2) How to reduce SQL warehouse cost?
Use auto stop, right size, optimize tables.

---

## 10) Summary
SQL warehouses are for analytics, not heavy ETL.

---

✅ Next: `23_mlflow_basics_for_de.md`
