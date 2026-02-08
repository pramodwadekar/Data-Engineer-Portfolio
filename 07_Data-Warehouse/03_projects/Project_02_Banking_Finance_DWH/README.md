# Project 02 — Banking / Finance Data Warehouse (FULL End-to-End)

## ✅ What this project is
A complete finance Data Warehouse implemented end-to-end with:
- Staging tables + sample data
- SCD2 dimensions
- Transaction fact table
- Periodic snapshot fact table
- Incremental snapshot load (watermark)
- Data quality checks
- Finance marts for BI reporting

---

## 🧱 Folder structure
- `00_project_overview.md`
- `01_business_problem.md`
- `02_architecture.md`
- `02_data_model.md`
- `03_build_steps.md`
- `04_sql_scripts/`
- `05_data_quality_checks.sql`
- `06_mart_tables.sql`
- `05_reporting_queries.sql`

---

## 🚀 Run steps (recommended)
1. Run `04_sql_scripts/00_create_staging_tables.sql`
2. Run `04_sql_scripts/01_insert_sample_data.sql`
3. Run `04_sql_scripts/02_create_dimensions_facts.sql`
4. Run `04_sql_scripts/03_load_dim_date.sql`
5. Run `04_sql_scripts/04_initial_load_dimensions.sql`
6. Run `04_sql_scripts/05_load_fact_transactions.sql`
7. Run `04_sql_scripts/06_load_fact_balance_snapshot.sql`
8. Run `06_mart_tables.sql`
9. Validate using `05_data_quality_checks.sql`

---

## 🧠 Interview explanation (30 seconds)
"I designed a banking warehouse where daily account balance is stored as a periodic snapshot fact.
Balance is semi-additive across time so snapshot modeling is correct.
Customer and account dimensions are SCD2 to preserve history.
Transactions are stored as a separate transaction fact.
I implemented incremental snapshot loads using watermark and added DQ checks and marts."

---

## ⭐ Interview-winning concepts
- Periodic snapshot
- Semi-additive measures
- SCD2
- Reconciliation
- Governance mindset
