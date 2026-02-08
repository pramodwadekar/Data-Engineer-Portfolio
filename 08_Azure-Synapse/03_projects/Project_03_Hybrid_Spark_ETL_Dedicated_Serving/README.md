# Project 03 — Hybrid Synapse: Spark ETL + Dedicated Serving + Pipelines

## ✅ What is this project?
A complete hybrid Synapse project:
- Spark for transformations (Delta Lake)
- Dedicated SQL Pool for BI serving
- Synapse Pipelines for orchestration
- Serverless SQL for quick validation

---

## 🎯 Why this project?
This is the most realistic enterprise architecture:
- Spark handles complex transformations
- Dedicated pool serves dashboards
- Pipelines orchestrate everything

---

## 🧱 Architecture
ADLS Raw
   |
   v
Synapse Spark (Bronze → Silver → Gold Delta)
   |
   v
Synapse Pipelines (orchestration)
   |
   v
Dedicated SQL Pool (final serving tables)
   |
   v
Power BI

---

## 📂 Folder Structure
- `00_project_overview.md`
- `01_medallion_design.md`
- `02_spark_notebooks/`
- `03_pipeline_design.md`
- `04_sql_pool_serving_scripts/`
- `05_monitoring_cost_security.md`
- `06_interview_talking_points.md`

---

## ⭐ Why this project gets you hired
Because it proves you know:
- Lakehouse + DWH together
- Real-world ETL
- Incremental loads
- Production mindset
