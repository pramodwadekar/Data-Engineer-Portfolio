# Project 02 — Enterprise Data Warehouse on Dedicated SQL Pool (MPP)

## ✅ What is this project?
A full enterprise-style Data Warehouse implemented on **Dedicated SQL Pool**:
- Star schema (dim + fact)
- MPP distributions
- Columnstore index
- Partitioning
- Statistics
- Bulk load using COPY INTO
- BI marts

---

## 🎯 Why this project?
This is the #1 project for Synapse interviews because it proves:
- You understand MPP architecture
- You can tune performance
- You know dedicated pool best practices

---

## 🧱 Architecture
ADLS Curated Parquet
   |
   v
COPY INTO / PolyBase
   |
   v
Dedicated SQL Pool (DWH tables)
   |
   v
Marts (aggregated)
   |
   v
Power BI dashboards

---

## 📂 Folder Structure
- `00_project_overview.md`
- `01_data_model.md`
- `02_build_steps.md`
- `03_sql_scripts/`
- `04_performance_tuning.md`
- `05_validation_queries.sql`
- `06_interview_talking_points.md`

---

## ⭐ What makes it interview-winning
- Correct distribution choices
- Columnstore for facts
- Partitioning by date
- Stats creation
- DQ + reconciliation
