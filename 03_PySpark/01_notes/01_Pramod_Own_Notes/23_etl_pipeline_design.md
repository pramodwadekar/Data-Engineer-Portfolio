# 23 - ETL Pipeline Pattern (Real Project) (PySpark)

This note covers the real-world ETL pattern used in Data Engineering:
- ingest → clean → transform → load
- schema evolution
- incremental load
- idempotency
- audit columns (created_at, updated_at)

This is one of the most important topics for real job work.

---

## 1) What is ETL Pipeline?
ETL means:

- **E**xtract (Ingest)
- **T**ransform (Clean + Business logic)
- **L**oad (Write curated output)

In modern data platforms, ETL is often implemented as:
- ELT (load raw first, transform later)
- Lakehouse pattern (Bronze → Silver → Gold)

---

## 2) Standard Pipeline Flow

### 2.1 Ingest
Read raw data from:
- CSV
- JSON
- Parquet
- Delta
- Kafka
- APIs

Example:

```python
raw_df = spark.read.option("header", "true").csv("/mnt/raw/employees.csv")
```

---

### 2.2 Clean
Cleaning includes:
- handle nulls
- remove duplicates
- standardize strings
- cast datatypes
- remove corrupt records

Example:

```python
from pyspark.sql.functions import col, trim, upper

clean_df = raw_df     .dropDuplicates()     .withColumn("name", upper(trim(col("name"))))     .withColumn("salary", col("salary").cast("int"))
```

---

### 2.3 Transform
Transformation means:
- joins
- aggregations
- business rules
- derived columns
- window functions

Example:

```python
from pyspark.sql.functions import when

transformed_df = clean_df.withColumn(
    "salary_band",
    when(col("salary") >= 60000, "HIGH")
    .when(col("salary") >= 50000, "MEDIUM")
    .otherwise("LOW")
)
```

---

### 2.4 Load
Write final output to:
- Parquet
- Delta
- Data Warehouse

Example:

```python
transformed_df.write.format("delta").mode("overwrite").save("/mnt/silver/employees")
```

---

## 3) Schema Evolution (Important)

### 3.1 What is Schema Evolution?
Schema evolution means:
- schema changes over time
- new columns come in
- datatype changes happen
- columns removed/renamed

Example:
- today: (id, name, dept)
- tomorrow: (id, name, dept, location)

---

### 3.2 How to Handle Schema Evolution?

#### Option 1: Manual schema update (best for control)
- maintain schema file
- update it when new columns arrive

#### Option 2: Delta schema evolution (Databricks)
Delta supports schema evolution.

Example:

```python
df.write.format("delta")     .mode("append")     .option("mergeSchema", "true")     .save("/mnt/silver/employees")
```

---

## 4) Incremental Load (Very Important)

### 4.1 What is Incremental Load?
Incremental load means:
- process only new/changed data
- not full data every day

This saves:
- time
- cost
- compute resources

---

### 4.2 Common Incremental Strategies

#### Strategy 1: Load by date partition
Example: load only yesterday’s data.

```python
df.filter(col("event_date") == "2026-02-07")
```

---

#### Strategy 2: Load by watermark timestamp
Example: load records where updated_at > last_run_ts.

---

#### Strategy 3: CDC (Change Data Capture)
Using:
- merge into
- upsert logic

---

## 5) Idempotency (Must Know)

### 5.1 What is Idempotency?
Idempotency means:
- running pipeline multiple times gives same result

This is critical because:
- jobs may fail and rerun
- scheduler retries jobs

---

### 5.2 How to Achieve Idempotency?

#### Option 1: Overwrite partition
Example: overwrite only one partition.

```python
df.write.format("delta")     .mode("overwrite")     .option("replaceWhere", "event_date = '2026-02-07'")     .save("/mnt/gold/sales")
```

---

#### Option 2: MERGE INTO (Upsert)
Upsert ensures same result even if rerun.

---

#### Option 3: Deduplication with primary key
Example:

```python
df.dropDuplicates(["emp_id"])
```

---

## 6) Audit Columns (created_at, updated_at)

Audit columns help in:
- tracking pipeline runs
- debugging
- incremental loads
- governance

Common audit columns:
- created_at
- updated_at
- created_by
- updated_by
- ingestion_date
- batch_id
- source_file_name

---

### 6.1 Add audit columns

```python
from pyspark.sql.functions import current_timestamp, current_date, lit

df_audit = transformed_df     .withColumn("created_at", current_timestamp())     .withColumn("updated_at", current_timestamp())     .withColumn("ingestion_date", current_date())     .withColumn("batch_id", lit("batch_001"))
```

---

## 7) Real Project Pattern (Bronze → Silver → Gold)

### 7.1 Bronze
- raw ingestion
- minimal transformation

### 7.2 Silver
- cleaned + standardized
- deduplicated
- correct datatypes

### 7.3 Gold
- business aggregates
- reporting tables

---

## 8) Best Practices (Production Level)

✅ Always use layered architecture (Bronze/Silver/Gold)  
✅ Keep ingestion separate from transformation  
✅ Handle schema evolution (Delta mergeSchema)  
✅ Implement incremental loads  
✅ Make pipeline idempotent  
✅ Add audit columns for tracking  
✅ Write to Delta for reliability  

---

## 9) Summary (Quick Notes)

- ETL flow: ingest → clean → transform → load.
- Schema evolution is common in real pipelines.
- Incremental load saves cost and time.
- Idempotency ensures safe reruns.
- Audit columns help tracking and governance.

---

✅ Next File: `24_structured_streaming.md`
