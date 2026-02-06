# PySpark for Data Engineering

This module covers **PySpark from Basic → Advanced strictly from a Data Engineering perspective**.

The goal is to make this section **self-sufficient**, so no external resources are required to understand, practice, and revise PySpark for Data Engineer / Databricks Data Engineer roles.

---

## 🎯 What this module covers

### ✅ PySpark Fundamentals
- Spark architecture (Driver, Executor, Cluster Manager)
- SparkSession & SparkContext
- RDD vs DataFrame vs Dataset (concepts)
- Transformations vs Actions (lazy evaluation)

### ✅ DataFrame API (Core)
- DataFrame creation (list, dict, RDD, file)
- select(), withColumn(), drop(), alias()
- Filtering, sorting, distinct, limit
- Column functions (when, regexp, split, concat, etc.)
- Null handling and data cleaning
- Aggregations and GroupBy
- Joins (all types)
- Window functions (top N, latest record, running sum)

### ✅ File Handling
- Read/Write CSV, JSON, Parquet
- Schema inference vs manual schema
- PartitionBy while writing
- Compression basics
- Corrupt record handling + quarantine

### ✅ Databricks + Delta Lake
- Delta read/write
- MERGE INTO (upsert)
- Time travel
- Schema evolution
- OPTIMIZE + ZORDER + VACUUM
- Bronze → Silver → Gold lakehouse architecture

### ✅ Performance Tuning (Must)
- Shuffle meaning + shuffle partitions
- repartition() vs coalesce()
- cache() / persist()
- Broadcast join
- Data skew handling
- AQE (Adaptive Query Execution)
- Bucketing (advanced)
- Execution plan debugging using explain()

### ✅ Streaming (Optional but Powerful)
- Structured Streaming basics
- Checkpointing
- Triggers and output modes
- Streaming → Delta sink
- Kafka basics
- Auto Loader (cloudFiles) in Databricks

### ✅ End-to-End Projects (Interview Ready)
- Batch lakehouse project
- Streaming pipeline project
- CDC + SCD Type 2 project

---

## 📂 Folder Structure

```
03_PySpark/
│
├── 00_resources/               # Optional references (not mandatory)
├── 01_notes/                   # Notes (Basic → Advanced)
├── 02_practicals/              # Hands-on practical tasks (41 files)
├── 03_projects/                # End-to-end projects (3 projects)
└── 04_interview_questions/     # Interview questions + scenarios
```

---

## ⭐ Recommended Learning Path

1) **01_notes**  
2) **02_practicals**  
3) **03_projects**  
4) **04_interview_questions**  

---

## 🏆 Outcome

After completing this module, you will be able to:

✅ Build scalable ETL pipelines using PySpark  
✅ Transform and clean large datasets efficiently  
✅ Work with Delta Lake in Databricks  
✅ Implement incremental loads and SCD Type 2  
✅ Optimize Spark jobs for performance  
✅ Build batch + streaming pipelines  
✅ Confidently answer PySpark interview questions  

---

## 👤 Author
Pramod Wadekar
