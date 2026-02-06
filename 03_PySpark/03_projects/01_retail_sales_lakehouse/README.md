# Project 01 — Retail Sales Lakehouse (Bronze → Silver → Gold)

A complete **PySpark + Delta Lake** project that simulates a real retail company pipeline.

This project is designed for interviews:
- You can explain the full pipeline
- You can show Delta features (MERGE, time travel, OPTIMIZE)
- You can demonstrate performance + data quality practices

---

## 🎯 Why This Project?
Retail sales pipelines are the most common real-world Data Engineering use case.

In interviews, this project proves you know:
- How to ingest raw CSV
- How to clean and standardize data
- How to build fact + dimension model
- How to create Gold KPI tables for dashboards
- How to handle incremental loads safely

---

## 🧠 What This Project Builds

### Bronze (Raw)
- Read CSV from `data/raw/`
- Minimal transformations
- Store as Delta

### Silver (Clean)
- Fix nulls
- Cast types
- Deduplicate
- Add audit columns (`created_at`, `updated_at`, `load_date`, `batch_id`)
- Build clean tables:
  - customers_silver
  - products_silver
  - stores_silver
  - orders_silver
  - order_items_silver

### Gold (Business)
- Build analytics-ready tables:
  - daily_sales_kpi
  - category_sales_kpi
  - store_sales_kpi
  - top_customers_kpi

---

## 🗂️ Folder Structure

```
01_retail_sales_lakehouse/
│
├── data/
│   └── raw/
│       ├── customers.csv
│       ├── products.csv
│       ├── stores.csv
│       ├── orders.csv
│       └── order_items.csv
│
├── notebooks/
│   ├── 00_setup.sql
│   ├── 01_bronze_ingestion.py
│   ├── 02_silver_cleaning.py
│   ├── 03_incremental_merge.py
│   ├── 04_gold_kpis.py
│   └── 05_optimize_time_travel.sql
│
├── src/
│   ├── config.py
│   ├── dq_checks.py
│   └── utils.py
│
└── docs/
    └── architecture.md
```

---

## 🧪 Data Quality Checks Included
- null checks
- duplicate checks
- invalid keys (referential integrity)
- row count validation

Bad records are written to:
- `quarantine/` delta path

---

## 🚀 How to Run (Databricks Recommended)

1. Upload the folder `data/raw/` to DBFS
2. Run notebooks in order:

```
00_setup.sql
01_bronze_ingestion.py
02_silver_cleaning.py
03_incremental_merge.py
04_gold_kpis.py
05_optimize_time_travel.sql
```

---

## 🔥 Topics Covered
✅ SparkSession, DataFrames, schema  
✅ Read/Write CSV, Parquet, Delta  
✅ Joins + aggregations  
✅ Window functions (Top customers)  
✅ Partitioning + coalesce  
✅ MERGE INTO (upsert)  
✅ Idempotency (replaceWhere)  
✅ Audit columns + batch_id  
✅ OPTIMIZE + ZORDER + VACUUM  
✅ Time Travel  
✅ Performance tuning (explain)  

---

## 🧑‍💻 Interview Talking Points
- “I used Bronze-Silver-Gold architecture.”
- “I used MERGE for incremental loads.”
- “I made pipeline idempotent using replaceWhere.”
- “I added quarantine for bad records.”
- “I optimized Delta tables using OPTIMIZE and ZORDER.”

---

## 📌 Output (Gold Tables)
- Daily revenue trend
- Store-wise sales
- Category-wise sales
- Top customers

---

## 👤 Author
Pramod Wadekar
