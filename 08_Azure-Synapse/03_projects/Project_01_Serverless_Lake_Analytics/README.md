# Project 01 — Serverless Lake Analytics (OPENROWSET + External Tables + CETAS)

## ✅ What is this project?
A complete project using **Synapse Serverless SQL Pool** to:
- Query raw files in ADLS (OPENROWSET)
- Create reusable external tables
- Create a Gold layer using CETAS
- Build BI-ready curated parquet datasets

---

## 🎯 Why this project?
This is a real-world pattern used when:
- You want fast delivery
- You want low cost
- You want to avoid dedicated pool cost

It is very common in startups and mid-size companies.

---

## 🧱 Architecture
ADLS Raw (CSV/Parquet)
   |
   v
Serverless SQL (OPENROWSET)
   |
   v
External Tables (metadata)
   |
   v
CETAS Gold Parquet (optimized)
   |
   v
Power BI / Tableau

---

## 📌 What you will build
- Raw orders dataset in ADLS
- Serverless queries for validation
- External table `ext_orders`
- Gold table `gold_monthly_sales` using CETAS

---

## 📂 Folder Structure
- `00_project_overview.md`
- `01_setup_steps.md`
- `02_serverless_sql_scripts/`
- `03_gold_layer_cetas/`
- `04_validation_queries.sql`
- `05_interview_talking_points.md`

---

## 🧠 Interview talking points
- Serverless pricing model (TB scanned)
- How you optimized scanning (Parquet + partitions)
- Why you used CETAS
- Why external tables help BI

---

## ⭐ Extra improvements
- Add partition folders by year/month
- Add views for analysts
