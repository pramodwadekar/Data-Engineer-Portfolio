# 11 - Databricks SQL Warehouse (Interview Questions)

## 1) What is Databricks SQL?
Databricks SQL provides:
- SQL editor
- dashboards
- alerts
- SQL warehouses (compute)

---

## 2) What is SQL Warehouse?
A compute endpoint optimized for SQL/BI workloads.

---

## 3) SQL Warehouse vs Cluster
- Warehouse: BI/SQL optimized
- Cluster: Spark ETL + notebooks

---

## 4) Photon and SQL
Photon boosts SQL performance significantly.

---

## 5) Dashboards
Dashboards are built from queries and visualizations.

---

## 6) Alerts
Alerts trigger notifications when query conditions match.

---

## 7) Common interview scenario
**Q:** How do you serve gold tables to BI?  
**A:** Create SQL warehouse + dashboards, query gold delta tables.

---

## 8) Best practices
- use auto-stop
- query optimized gold tables
- avoid scanning raw bronze data
