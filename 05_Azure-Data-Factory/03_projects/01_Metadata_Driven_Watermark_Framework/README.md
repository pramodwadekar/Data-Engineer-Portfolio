# Project 01 - Metadata Driven Watermark Framework (ADF + SQL + ADLS + Databricks)

## Overview
This project demonstrates a **real enterprise ADF framework**:
- A single pipeline ingests **multiple SQL tables** dynamically
- Uses **watermark incremental load**
- Stores logs in **audit tables**
- Orchestrates **Databricks notebooks** for Silver/Gold processing

This is one of the **most asked ADF interview projects**.

---

## Why this project?
In real companies, you never build 50 separate pipelines.
You build a **metadata-driven framework**.

---

## Architecture (High Level)
1. **Config Table** → list of active tables
2. **Watermark Table** → last processed value per table
3. **ADF Parent Pipeline**:
   - Lookup config
   - ForEach each table
   - Execute Child pipeline
4. **ADF Child Pipeline**:
   - Read watermark
   - Incremental Copy SQL → ADLS Bronze (Parquet)
   - Update watermark
   - Log audit
5. Trigger Databricks notebook:
   - Bronze → Silver cleaning
   - Silver → Gold aggregations

---

## Tech Stack
- Azure Data Factory
- Azure SQL Database (metadata + watermark + source)
- ADLS Gen2 (bronze zone)
- Databricks (silver + gold)

---

## Folder Structure
```
01_Metadata_Driven_Watermark_Framework/
  datasets/
    sql/
      orders.csv
      customers.csv
    config/
      table_config.csv
      watermark_control.csv
  adf/
    pipelines/
      pl_parent_metadata_driver.json
      pl_child_incremental_copy.json
    datasets/
      ds_sql_table.json
      ds_adls_bronze_parquet.json
    linked_services/
      ls_sql.json
      ls_adls.json
      ls_keyvault.json
    triggers/
      tg_daily_1am.json
  databricks/
    notebooks/
      01_bronze_to_silver.py
      02_silver_to_gold.py
  sql/
    01_create_tables.sql
    02_control_tables.sql
  docs/
    pipeline_design.md
    interview_explanation.md
```

---

## What you can explain in interview
- What is a metadata-driven pipeline
- Watermark incremental load design
- How you ensure idempotency
- How you log pipeline execution
- How ADF triggers Databricks with parameters

---

## Expected Outcome
After running this project you will have:
- Bronze parquet files partitioned by run_date
- Silver Delta cleaned tables
- Gold KPIs (daily sales, top customers)

---

## Bonus Improvements (Optional)
- Add Teams/Email alerts
- Add quarantine folder for bad records
- Add CI/CD ARM template deployment

---
