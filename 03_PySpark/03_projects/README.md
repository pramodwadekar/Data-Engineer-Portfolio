# 03 - PySpark Projects (End-to-End)

Welcome to the **Projects** section of my PySpark portfolio.

This folder contains **3 complete end-to-end Data Engineering projects** that I can confidently explain in interviews.

Each project is built using:
- **PySpark**
- **Databricks**
- **Delta Lake**
- **Bronze → Silver → Gold architecture**
- Real production-style patterns

---

## 📌 Why These Projects?

Most portfolios contain only:
- random practice code
- incomplete notebooks
- no real pipeline structure

These projects are different.

They prove I can build:
✅ Batch pipelines  
✅ Streaming pipelines  
✅ Incremental loads  
✅ Delta MERGE (upsert)  
✅ SCD Type 2 history tracking  
✅ Gold KPI tables for reporting  

---

## 🗂️ Projects Included

---

## 01) Retail Sales Lakehouse (Batch Pipeline)

📂 Folder: `01_retail_sales_lakehouse/`

### 🎯 Purpose
Build a complete retail analytics pipeline using:
- raw CSV ingestion
- cleaning + standardization
- incremental MERGE
- business KPI gold tables

### 🔥 Key Topics Covered
- Bronze → Silver → Gold
- Delta read/write
- MERGE INTO (upsert)
- audit columns + batch_id
- quarantine bad records
- window functions (top customers)
- OPTIMIZE + ZORDER + VACUUM
- time travel

### ✅ Gold Outputs
- daily sales KPI
- category sales KPI
- store-wise revenue KPI
- top customers KPI

---

## 02) IoT Structured Streaming Pipeline

📂 Folder: `02_iot_streaming_pipeline/`

### 🎯 Purpose
Build a streaming pipeline where sensor events arrive continuously and KPIs are created in near real-time.

### 🔥 Key Topics Covered
- Structured Streaming
- readStream / writeStream
- checkpointing
- output modes (append/update/complete)
- triggers (processingTime / availableNow)
- watermark (late events)
- streaming → Delta sink
- quarantine bad events

### ✅ Gold Outputs
- 5-minute window device KPIs
- sensor health monitoring tables

---

## 03) HR Employee CDC + SCD Type 2

📂 Folder: `03_hr_employee_cdc_scd2/`

### 🎯 Purpose
Simulate real company HR feed where employee details change over time.

This project maintains:
- Current snapshot table (Type 1)
- Full history table (SCD Type 2)

### 🔥 Key Topics Covered
- incremental batch ingestion
- MERGE INTO
- deduplication using window functions
- idempotency
- SCD Type 2 history tracking
- gold reporting tables

### ✅ Gold Outputs
- department-wise salary summary
- active employee KPI tables

---

## 🚀 How to Run Projects (Databricks Recommended)

Inside each project folder you will find:
- `data/` (CSV datasets)
- `notebooks/` (step-by-step code)
- `docs/` (architecture explanation)
- `src/` (helper modules)

### Run Order (Same for all projects)
1. `00_setup.sql`
2. `01_*` ingestion
3. `02_*` silver pipeline
4. `03_*` gold pipeline

---

## 🧑‍💻 Interview Talking Points

In interviews, I explain:
- how I designed the pipeline layers
- how I handled incremental loads and reruns
- how I used Delta MERGE and SCD2
- how I optimized Delta tables
- how I built gold KPI tables for analytics

---

## 👤 Author
Pramod Wadekar
