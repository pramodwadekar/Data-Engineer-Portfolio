# Project 01 — Retail Sales Data Warehouse (Full Implementation)

## ✅ What this project is
A complete **Retail Sales Data Warehouse** implemented with:
- Staging layer
- Core star schema
- SCD2 dimensions
- Transaction fact table
- Incremental loading
- Data quality checks
- Data marts

---

## ✅ Why interviewers like this project
Because it proves you can:
- Design a star schema correctly
- Define fact grain clearly
- Implement SCD2 (most asked)
- Build incremental pipelines
- Validate data correctness

---

## 🧱 Project Structure
- `00_project_overview.md`
- `01_business_problem.md`
- `02_architecture.md`
- `03_data_model.md`
- `04_build_steps.md`
- `05_sql_scripts/`
- `06_validation_queries.sql`
- `07_mart_tables.sql`

---

## 🛠️ How to run (simple)
1. Run `05_sql_scripts/01_create_staging_tables.sql`
2. Load sample data (use practicals data)
3. Run `05_sql_scripts/02_create_dimensions.sql`
4. Run `05_sql_scripts/03_create_fact_sales.sql`
5. Run `05_sql_scripts/04_load_dimensions_initial.sql`
6. Run `05_sql_scripts/05_load_fact_sales_initial.sql`
7. Run `05_sql_scripts/06_scd2_customer_merge.sql`
8. Run `05_sql_scripts/07_incremental_fact_load_watermark.sql`
9. Run marts: `07_mart_tables.sql`
10. Validate: `06_validation_queries.sql`

---

## 🧠 Interview Explanation (30 seconds)
"I built a Retail Sales Data Warehouse using Kimball star schema.
The fact table grain is 1 row per order item. Dimensions use surrogate keys.
Customer and Product are SCD2 to maintain history. Fact loads are incremental using watermark.
I implemented DQ checks like referential integrity and reconciliation totals.
Finally I created mart tables for BI dashboards."

---

## ⭐ What to improve further (optional)
- Add promotion junk dimension
- Add returns fact table
- Add accumulating snapshot for order lifecycle
