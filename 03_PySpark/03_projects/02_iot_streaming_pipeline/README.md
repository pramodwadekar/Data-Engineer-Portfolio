# Project 02 — IoT Structured Streaming Pipeline (Bronze → Silver → Gold)

A complete **Structured Streaming + Delta Lake** project.

This project is designed for interviews to prove:
- you can build streaming pipelines
- you understand checkpointing + triggers
- you can handle late data with watermark
- you can build streaming aggregations for dashboards

---

## 🎯 Why This Project?
Streaming is one of the biggest differentiators in interviews.

Most candidates only know batch ETL.
This project shows you can build:
- near real-time ingestion
- streaming transformations
- streaming to Delta tables

---

## 🧠 What This Project Builds

### Bronze (Streaming)
- readStream from files (Auto Loader style)
- store raw events into Delta bronze

### Silver (Streaming)
- cast schema
- null handling
- quarantine bad records
- add audit columns

### Gold (Streaming Aggregations)
- window aggregations (5 min)
- device health KPIs
- anomaly alerts (basic)

---

## 🗂️ Folder Structure

```
02_iot_streaming_pipeline/
│
├── data/
│   └── raw_events/
│       └── iot_events.csv
│
├── notebooks/
│   ├── 00_setup.sql
│   ├── 01_stream_bronze.py
│   ├── 02_stream_silver.py
│   ├── 03_stream_gold_kpis.py
│   └── 04_stream_triggers.sql
│
├── docs/
│   └── streaming_design.md
│
└── src/
    └── schemas.py
```

---

## 🔥 Topics Covered
✅ Structured Streaming  
✅ readStream / writeStream  
✅ checkpointing  
✅ triggers (processingTime / availableNow)  
✅ output modes (append/update/complete)  
✅ watermark (late events)  
✅ streaming + delta sink  
✅ quarantine bad records  
✅ aggregations + window  
✅ performance basics  

---

## 🚀 How to Run (Databricks)

1. Upload `iot_events.csv` into DBFS folder:
   - `/mnt/raw/iot/`

2. Run notebooks in order:
```
00_setup.sql
01_stream_bronze.py
02_stream_silver.py
03_stream_gold_kpis.py
04_stream_triggers.sql
```

---

## 🧑‍💻 Interview Talking Points
- “I built a streaming pipeline with checkpointing.”
- “I used watermark to handle late events.”
- “I wrote streaming output into Delta tables.”
- “I created gold window KPIs for dashboards.”

---

## 👤 Author
Pramod Wadekar
