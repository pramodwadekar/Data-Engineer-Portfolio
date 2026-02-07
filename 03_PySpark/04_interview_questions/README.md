
# 04 - PySpark Interview Questions (Data Engineering)

This folder contains **PySpark interview questions from Basic → Advanced**, written specifically for **Data Engineer / Databricks Data Engineer roles**.

All questions are structured in:
- Simple language
- Clear answers
- Real-world examples
- Interview-ready scenarios

---

## 🎯 Why This Section?

Most candidates only learn PySpark syntax.

But in interviews, companies ask:
- Why Spark behaves in a certain way
- Performance tuning questions
- Delta Lake + MERGE questions
- Incremental load & SCD questions
- Streaming & checkpointing questions
- Real production scenarios

This folder helps you prepare for all of that.

---

## 📌 Interview Questions Index (Basic → Advanced)

### ✅ Level 1: Spark Core
01. `01_pyspark_core_concepts.md`

Covers:
- Spark architecture (Driver/Executor)
- RDD vs DataFrame
- Lazy evaluation
- DAG, Job, Stage, Task
- Shuffle, narrow vs wide transformations

---

### ✅ Level 2: DataFrame API
02. `02_dataframe_api_questions.md`

Covers:
- DataFrame creation
- select, withColumn, drop, rename
- filter/where
- cache/persist
- repartition/coalesce
- explain()

---

### ✅ Level 3: Read/Write + Formats
03. `03_read_write_formats_questions.md`

Covers:
- CSV / JSON / Parquet read/write
- Schema inference vs manual schema
- Save modes
- PartitionBy
- Compression
- Corrupt record handling

---

### ✅ Level 4: Schema + Datatypes
04. `04_schema_datatypes_questions.md`

Covers:
- StructType / StructField
- Casting
- Nullability
- Timestamp vs Date
- Schema evolution & drift

---

### ✅ Level 5: Cleaning + Data Quality
05. `05_nulls_duplicates_bad_data.md`

Covers:
- dropna / fillna / replace
- coalesce / nvl
- dropDuplicates vs window dedup
- quarantine table concept
- data quality checks

---

### ✅ Level 6: Joins (Most Important)
06. `06_joins_questions.md`

Covers:
- all join types (inner/left/right/full)
- left_semi / left_anti
- join on multiple columns
- duplicate column handling
- broadcast join concept

---

### ✅ Level 7: GroupBy + Aggregations
07. `07_groupby_aggregations_questions.md`

Covers:
- groupBy + agg
- countDistinct
- having equivalent
- pivot / rollup / cube
- optimization tips

---

### ✅ Level 8: Window Functions (Must)
08. `08_window_functions_questions.md`

Covers:
- row_number, rank, dense_rank
- lag/lead
- running sum
- top N per group
- latest record dedup patterns

---

### ✅ Level 9: Partitioning + Bucketing
09. `09_partitioning_bucketing_questions.md`

Covers:
- partitioning vs bucketing
- repartition vs coalesce
- partition pruning
- small files problem

---

### ✅ Level 10: Performance Tuning (Very Important)
10. `10_performance_tuning_questions.md`

Covers:
- shuffle optimization
- caching strategy
- broadcast join
- skew handling
- AQE basics
- best practices

---

### ✅ Level 11: Execution Model + DAG + explain()
11. `11_execution_plan_dag_questions.md`

Covers:
- execution plan
- logical vs physical plan
- Spark UI
- shuffle boundaries
- tasks vs partitions

---

### ✅ Level 12: Delta Lake (Databricks Must)
12. `12_delta_lake_questions.md`

Covers:
- ACID transactions
- delta log
- MERGE INTO
- time travel
- OPTIMIZE / ZORDER / VACUUM
- Bronze-Silver-Gold

---

### ✅ Level 13: Incremental Loads + CDC + SCD
13. `13_incremental_load_scd_questions.md`

Covers:
- incremental vs full load
- idempotency
- MERGE based pipelines
- SCD Type 1 vs Type 2
- late arriving data

---

### ✅ Level 14: Structured Streaming
14. `14_streaming_questions.md`

Covers:
- readStream/writeStream
- checkpointing
- triggers
- output modes
- watermark
- foreachBatch
- Auto Loader basics

---

### ✅ Level 15: Real Interview Scenarios (Best Answers)
15. `15_real_world_scenarios_answers.md`

Covers:
- real company scenarios
- best answers template
- senior-level talking points
- production troubleshooting questions

---

## ⭐ Best Way to Prepare
Recommended order:
1) Read files 01 → 05 (foundation)
2) Practice joins + window + performance (06 → 10)
3) Focus on Delta + incremental loads (12 → 13)
4) If applying for streaming roles, revise 14
5) Use 15 for final interview revision

---

## 🏆 Outcome
After completing this section, you will be able to:
✅ answer PySpark interview questions confidently  
✅ explain Spark internals clearly  
✅ handle Delta Lake + MERGE questions  
✅ answer incremental load + SCD questions  
✅ explain streaming concepts properly  
✅ crack Data Engineer / Databricks interviews  

---

## 👤 Author
Pramod Wadekar
