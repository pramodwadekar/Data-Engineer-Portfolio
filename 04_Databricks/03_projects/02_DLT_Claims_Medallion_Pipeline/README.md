# Project 02: DLT Medallion Pipeline (Claims Processing)

## 📌 Overview
This project builds a complete **DLT pipeline** using:
- Auto Loader ingestion
- Bronze → Silver → Gold
- DLT Expectations (Data Quality)
- Pipeline monitoring + lineage

This is a Databricks-first project (not a normal PySpark one).

---

## 🎯 Why this project?
Most Databricks DE roles ask:
- Have you used DLT?
- How do you implement data quality?
- How do you monitor pipelines?

This project answers all.

---

## 🧱 Dataset
Synthetic CSVs:
- `claims.csv`
- `providers.csv`

---

## 🧪 Pipeline Tables
### Bronze
- bronze_claims
- bronze_providers

### Silver
- silver_claims_clean
- silver_providers_clean

### Gold
- gold_city_claims_kpi
- gold_provider_kpi

---

## 🧠 Key Databricks Topics Covered
- DLT pipelines
- Auto Loader inside DLT
- Expectations: expect, expect_or_drop
- DLT monitoring
- Medallion architecture

---

## ▶️ Run Steps
1. Upload raw CSVs to:
   - `dbfs:/FileStore/dlt_claims/raw/`
2. Create DLT pipeline from notebook:
   - `01_dlt_claims_pipeline`
3. Run pipeline (Triggered mode)
4. Query gold tables in SQL

---

## 💬 Interview Explanation
“I built a DLT medallion pipeline for claims processing using Auto Loader, applied DQ expectations in silver, and generated gold KPIs with built-in DLT monitoring and lineage.”

