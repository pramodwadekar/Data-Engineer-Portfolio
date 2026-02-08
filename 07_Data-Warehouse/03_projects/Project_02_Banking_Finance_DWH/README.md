# Project 02 — Banking / Finance Data Warehouse (Snapshot Fact)

## ✅ What this project is
A finance domain warehouse using:
- SCD2 dimensions
- Periodic snapshot fact table
- Semi-additive measures
- Time-based reporting

---

## 🧠 Why this project is powerful in interviews
Most candidates only know transaction facts.

This project proves you know:
- Snapshot modeling
- Daily reporting design
- Semi-additive metrics (balance)
- Governance and compliance thinking

---

## 🧱 Folder structure
- `00_project_overview.md`
- `01_business_problem.md`
- `02_data_model.md`
- `03_build_steps.md`
- `04_sql_scripts/`
- `05_reporting_queries.sql`

---

## ⭐ Interview explanation (30 seconds)
"I modeled a banking warehouse where the main fact is a daily balance snapshot at account grain.
Balance is semi-additive across time, so I used snapshot fact.
Customer and Account dimensions are SCD2 to track changes.
I designed reporting queries for branch growth and daily deposits."
