# Project 03 — E-commerce Order Lifecycle DWH (FULL End-to-End)

## ✅ What this project is
A complete E-commerce warehouse with:
- Staging tables + sample data
- Dimensions
- Transaction fact (order items)
- Accumulating snapshot fact (order lifecycle)
- Update logic for payment/shipment/delivery/return
- DQ checks
- SLA + funnel marts

---

## 🧱 Folder structure
- `00_project_overview.md`
- `01_business_problem.md`
- `02_architecture.md`
- `02_data_model.md`
- `03_build_steps.md`
- `03_sql_scripts/`
- `04_data_quality_checks.sql`
- `05_mart_tables.sql`
- `04_kpi_queries.sql`

---

## 🚀 Run steps
1. `03_sql_scripts/00_create_staging_tables.sql`
2. `03_sql_scripts/01_insert_sample_data.sql`
3. `03_sql_scripts/02_create_dimensions_facts.sql`
4. `03_sql_scripts/03_load_dim_date.sql`
5. `03_sql_scripts/04_load_dimensions.sql`
6. `03_sql_scripts/05_load_fact_order_items.sql`
7. `03_sql_scripts/06_load_fact_lifecycle_initial.sql`
8. `03_sql_scripts/07_update_lifecycle_payment.sql`
9. `03_sql_scripts/08_update_lifecycle_shipment.sql`
10. `03_sql_scripts/09_update_lifecycle_returns.sql`
11. marts: `05_mart_tables.sql`
12. DQ: `04_data_quality_checks.sql`

---

## 🧠 Interview explanation (30 seconds)
"I modeled e-commerce order lifecycle using an accumulating snapshot fact table.
One row represents one order and gets updated as payment, shipment, delivery and return events occur.
This design enables SLA metrics, funnel reporting, and partner performance KPIs."

---

## ⭐ Interview-winning concepts
- Accumulating snapshot
- Process analytics
- SLA reporting
- Fact updates
