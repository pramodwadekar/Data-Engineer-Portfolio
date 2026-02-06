# 22 - Delta Lake (Databricks Must)

This note covers:
- what is Delta Lake? why used? why needed?
- delta format
- ACID in delta
- merge into (upsert)
- time travel
- optimize + zorder
- vacuum
- bronze-silver-gold layers (architecture)

Delta Lake is one of the most important topics for Databricks Data Engineer roles.

---

## 1) What is Delta Lake?
Delta Lake is an **open table storage format** built on top of Parquet.

Delta adds:
- ACID transactions
- schema enforcement
- schema evolution
- time travel
- MERGE (upserts)
- scalable metadata handling

Delta is heavily used in:
- Databricks
- modern Data Lakes
- Lakehouse architecture

---

## 2) Why Delta Lake is Needed?

### 2.1 Problem with normal Parquet Data Lakes
If you store only Parquet files:
❌ no ACID transactions  
❌ no safe concurrent reads/writes  
❌ upserts are difficult  
❌ deletes/updates are difficult  
❌ no versioning  
❌ schema changes can break pipelines  

---

### 2.2 Delta Lake Solution
Delta solves these problems by maintaining:
- Parquet data files
- `_delta_log/` transaction log

---

## 3) Delta Format

A Delta table contains:
- Parquet data files
- `_delta_log` folder (JSON + checkpoint files)

Example structure:

```
/mnt/delta/employees/
  part-0000.snappy.parquet
  part-0001.snappy.parquet
  _delta_log/
      00000000000000000000.json
      00000000000000000001.json
      ...
```

The transaction log stores:
- schema
- metadata
- versions
- operations (insert, update, delete)

---

## 4) ACID in Delta Lake

Delta provides ACID properties:

### A - Atomicity
- operation is all-or-nothing

### C - Consistency
- schema rules enforced

### I - Isolation
- concurrent reads/writes safe

### D - Durability
- committed data remains safe

This makes Delta reliable for production pipelines.

---

## 5) Creating Delta Table (Databricks)

### 5.1 Write Delta

```python
df.write.format("delta").mode("overwrite").save("/mnt/delta/employees")
```

---

### 5.2 Read Delta

```python
df_delta = spark.read.format("delta").load("/mnt/delta/employees")
df_delta.show()
```

---

## 6) MERGE INTO (Upsert) (Most Important)

### 6.1 What is Upsert?
Upsert means:
- update existing records
- insert new records

---

### 6.2 MERGE Example (SQL)

```sql
MERGE INTO employees AS target
USING updates AS source
ON target.emp_id = source.emp_id
WHEN MATCHED THEN UPDATE SET *
WHEN NOT MATCHED THEN INSERT *
```

---

### 6.3 MERGE Example (PySpark SQL)

```python
updates_df.createOrReplaceTempView("updates")

spark.sql("""
MERGE INTO employees AS target
USING updates AS source
ON target.emp_id = source.emp_id
WHEN MATCHED THEN UPDATE SET *
WHEN NOT MATCHED THEN INSERT *
""")
```

---

## 7) Time Travel

Delta supports querying old versions of data.

### 7.1 By Version

```python
df_v0 = spark.read.format("delta")     .option("versionAsOf", 0)     .load("/mnt/delta/employees")
```

---

### 7.2 By Timestamp

```python
df_old = spark.read.format("delta")     .option("timestampAsOf", "2026-02-01 10:00:00")     .load("/mnt/delta/employees")
```

---

## 8) OPTIMIZE and ZORDER (Databricks)

### 8.1 OPTIMIZE
OPTIMIZE compacts small files into bigger files.

```sql
OPTIMIZE employees;
```

---

### 8.2 ZORDER
ZORDER improves data skipping (faster queries).

Example:

```sql
OPTIMIZE employees ZORDER BY (dept_id);
```

---

## 9) VACUUM

VACUUM removes old files that are no longer needed.

Example:

```sql
VACUUM employees RETAIN 168 HOURS;
```

168 hours = 7 days

⚠️ Note:
- Vacuum permanently deletes old files.
- Time travel older than retention will not work.

---

## 10) Bronze-Silver-Gold Architecture (Must Know)

Databricks recommends a layered architecture.

---

### 10.1 Bronze Layer (Raw)
- raw ingestion
- minimal transformation
- data as-is
- schema may be messy

Example:
- raw CSV/JSON stored in Delta

---

### 10.2 Silver Layer (Clean)
- cleaned data
- standardized schema
- deduplication
- null handling
- basic joins

This is the main ETL layer.

---

### 10.3 Gold Layer (Business)
- aggregated data
- business-ready tables
- reporting datasets
- KPI tables

Example:
- revenue per month
- top customers

---

## 11) Best Practices (Production Level)

✅ Always use Delta for Databricks pipelines  
✅ Use Bronze-Silver-Gold architecture  
✅ Use MERGE for incremental loads  
✅ Use OPTIMIZE to reduce small files  
✅ Use ZORDER for frequent filter columns  
✅ Use VACUUM carefully (retention)  
✅ Enable schema enforcement and evolution  

---

## 12) Summary (Quick Notes)

- Delta is Parquet + transaction log.
- Delta provides ACID transactions.
- MERGE INTO supports upserts.
- Time travel allows reading old versions.
- OPTIMIZE compacts small files.
- ZORDER improves query performance.
- VACUUM deletes old files.
- Bronze-Silver-Gold is standard Databricks architecture.

---

✅ Next File: `23_etl_pipeline_design.md`
