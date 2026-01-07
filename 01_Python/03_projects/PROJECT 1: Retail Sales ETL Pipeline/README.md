# Retail Sales ETL Pipeline (Python)

## 1. Problem Statement
Retail company receives daily sales data in CSV format.
The goal is to clean, validate, and aggregate sales data
to generate category-level revenue reports.

---

## 2. Architecture

Raw CSV → Python ETL → Cleaned & Aggregated CSV

---

## 3. Tech Stack
- Python
- Pandas
- JSON (config)
- Logging

---

## 4. Pipeline Flow
1. Read configuration
2. Extract raw sales data
3. Validate input schema
4. Clean and filter data
5. Aggregate sales by category
6. Write processed output

---

## 5. Error Handling
- File read errors
- Empty dataset validation
- Schema validation
- Centralized logging

---

## 6. How to Run
bash
python etl_pipeline.py

## 7. Output
Generates sales_summary.csv with:

- category

- total_sales

## 8. Learnings
How to build config-driven ETL pipelines

Data validation and logging

Modular Python code for Data Engineering


# ✅ WHY THIS PROJECT IS **PERFECT**

✔ Real retail use case  
✔ Config-driven  
✔ Logging + validation  
✔ Modular code  
✔ Interview-ready explanation  
✔ Clean GitHub structure 
