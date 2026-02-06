# Project 03 — HR Employee CDC + SCD Type 2 (Delta MERGE)

A complete **Change Data Capture (CDC)** style project using:
- incremental loads
- deduplication
- Delta MERGE
- SCD Type 2 history table

This project is one of the best interview projects for Data Engineers.

---

## 🎯 Why This Project?
Almost every company maintains an employee/customer dimension table.

In real life:
- employee salary changes
- city changes
- dept changes

If you overwrite data, you lose history.

This project shows you can:
✅ maintain history (SCD Type 2)  
✅ build current snapshot table  
✅ handle incremental batches safely  

---

## 🧠 What This Project Builds

### Input
- CSV batch files (simulating daily HR feed)

### Silver Current Table (Type 1 snapshot)
- latest state of employee

### Silver History Table (SCD Type 2)
- maintains old + new records with:
  - start_date
  - end_date
  - is_current

### Gold
- dept salary trends
- active employee summary

---

## 🗂️ Folder Structure

```
03_hr_employee_cdc_scd2/
│
├── data/
│   └── raw_batches/
│       ├── employee_batch_01.csv
│       └── employee_batch_02.csv
│
├── notebooks/
│   ├── 00_setup.sql
│   ├── 01_bronze_ingestion.py
│   ├── 02_silver_current_merge.py
│   ├── 03_scd2_history_pipeline.py
│   └── 04_gold_reporting.py
│
├── docs/
│   └── scd2_explanation.md
│
└── src/
    └── helpers.py
```

---

## 🔥 Topics Covered
✅ incremental loads  
✅ MERGE INTO  
✅ idempotency  
✅ deduplication using window  
✅ SCD Type 2 (history)  
✅ audit columns  
✅ explain plan (optional)  
✅ performance best practices  

---

## 🚀 How to Run

Upload CSV batches to Databricks folder, then run notebooks:

```
00_setup.sql
01_bronze_ingestion.py
02_silver_current_merge.py
03_scd2_history_pipeline.py
04_gold_reporting.py
```

---

## 🧑‍💻 Interview Talking Points
- “I implemented SCD Type 2 using Delta MERGE.”
- “I keep employee history with is_current flag.”
- “I handle incremental batches and reruns safely.”
- “I deduplicate using window functions.”

---

## 👤 Author
Pramod Wadekar
