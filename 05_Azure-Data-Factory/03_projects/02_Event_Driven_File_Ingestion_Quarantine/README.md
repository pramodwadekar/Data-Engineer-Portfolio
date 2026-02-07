# Project 02 - Event Driven File Ingestion + Quarantine (ADF)

## Overview
This project shows how to build an **event-driven ingestion pipeline** in ADF:
- Pipeline triggers when a file arrives in ADLS
- Validates schema + basic data quality
- Bad files are moved to **quarantine**
- Good files go to **bronze** partitioned folders
- Logs are stored in audit table

---

## Why this project?
Companies get files from:
- vendors
- SFTP drops
- third-party systems

Files can be:
- missing columns
- corrupt
- wrong delimiter
So quarantine pattern is a must.

---

## What you learn
- Event Trigger
- Get Metadata + If Condition
- ForEach over childItems
- Failure dependency handling
- Quarantine folder strategy
- Logging + monitoring

---

## Folder Structure
```
02_Event_Driven_File_Ingestion_Quarantine/
  datasets/
    landing/
      good_sales_2026-02-01.csv
      bad_sales_2026-02-02.csv
  adf/
    pipelines/
      pl_event_ingestion_quarantine.json
    triggers/
      tg_event_blob_created.json
  docs/
    dq_rules.md
    interview_explanation.md
```

---

## Interview Explanation
Explain:
- Why event trigger reduces latency
- How quarantine avoids pipeline stop
- How you log bad files and continue

---
