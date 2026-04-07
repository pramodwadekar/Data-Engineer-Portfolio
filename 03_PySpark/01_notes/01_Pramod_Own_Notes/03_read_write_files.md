# 03 - Reading & Writing Data (PySpark)

This note covers how to read and write data in PySpark using the most common formats used in Data Engineering:
- CSV
- JSON
- Parquet
- Delta (Databricks)

Also covers:
- Save modes (overwrite, append, ignore, errorifexists)
- partitionBy while writing
- compression
- schema inference vs manual schema

---

## 1) Why Read/Write is Important in Data Engineering?
In real projects, PySpark is mostly used for:
- Reading raw data from Data Lake
- Cleaning and transforming it
- Writing it back as curated datasets (Parquet/Delta)

---

## 2) Spark Read API Basics

General syntax:

```python
df = spark.read.format("csv").option("header", "true").load("path")
```

Or simplified:

```python
df = spark.read.csv("path")
```

---

## 3) Reading & Writing CSV

### 3.1 Read CSV (Basic)

```python
df = spark.read.option("header", "true").csv("data/employees.csv")
df.show()
```

---

### 3.2 Read CSV with inferSchema

```python
df = spark.read.option("header", "true").option("inferSchema", "true").csv("data/employees.csv")
df.printSchema()
```

⚠️ Note:
- `inferSchema=true` is slower for big data.
- In production, prefer manual schema.

---

### 3.3 Read CSV with delimiter

```python
df = spark.read.option("header", "true").option("sep", "|").csv("data/employees_pipe.csv")
```

---

### 3.4 Write CSV (Basic)

```python
df.write.mode("overwrite").option("header", "true").csv("output/employees_csv")
```

⚠️ Spark writes CSV as a **folder** with multiple part files.

---

## 4) Reading & Writing JSON

### 4.1 Read JSON (Basic)

```python
df = spark.read.json("data/employees.json")
df.show()
df.printSchema()
```

---

### 4.2 Read JSON with multiline

If your JSON is in multiline format:

```python
df = spark.read.option("multiline", "true").json("data/employees_multiline.json")
```

---

### 4.3 Write JSON

```python
df.write.mode("overwrite").json("output/employees_json")
```

---

## 5) Reading & Writing Parquet

### 5.1 What is Parquet?
Parquet is a **columnar storage format**.

Benefits:
- Very fast for analytics
- Compressed by default
- Supports schema
- Best for Data Lakes

---

### 5.2 Read Parquet

```python
df = spark.read.parquet("data/employees.parquet")
df.show()
```

---

### 5.3 Write Parquet

```python
df.write.mode("overwrite").parquet("output/employees_parquet")
```

---

## 6) Reading & Writing Delta (Databricks)

### 6.1 What is Delta?
Delta Lake is an open storage format built on Parquet.

Delta provides:
- ACID transactions
- Time travel
- MERGE (upsert)
- Schema evolution

Delta is heavily used in Databricks.

---

### 6.2 Read Delta (Databricks)

```python
df = spark.read.format("delta").load("/mnt/delta/employees")
df.show()
```

---

### 6.3 Write Delta (Databricks)

```python
df.write.format("delta").mode("overwrite").save("/mnt/delta/employees")
```

---

## 7) Save Modes (Very Important)

Save modes decide what happens if output already exists.

### 7.1 overwrite
- Deletes old data
- Writes fresh data

```python
df.write.mode("overwrite").parquet("output/path")
```

---

### 7.2 append
- Adds new data to existing data

```python
df.write.mode("append").parquet("output/path")
```

---

### 7.3 ignore
- If path exists, Spark does nothing

```python
df.write.mode("ignore").parquet("output/path")
```

---

### 7.4 errorifexists (default)
- Throws error if output exists

```python
df.write.mode("errorifexists").parquet("output/path")
```

---

## 8) PartitionBy while Writing (Most Used in DE)

Partitioning improves performance for filtering queries.

Example:
Partition by `department`

```python
df.write.mode("overwrite").partitionBy("department").parquet("output/employees_partitioned")
```

Output structure:
```
employees_partitioned/
  department=IT/
  department=HR/
  department=Finance/
```

---

## 9) Compression while Writing

Compression reduces storage and improves performance.

### 9.1 Parquet compression (snappy default)

```python
df.write.mode("overwrite").option("compression", "snappy").parquet("output/employees_parquet")
```

Other compression types:
- snappy (default, best for speed)
- gzip (more compression, slower)
- lz4
- zstd (very good)

---

### 9.2 CSV compression

```python
df.write.mode("overwrite").option("header", "true").option("compression", "gzip").csv("output/employees_csv_gzip")
```

---

## 10) Schema Inference vs Manual Schema (Important)

### 10.1 Schema Inference (Easy but not recommended for big data)

```python
df = spark.read.option("header", "true").option("inferSchema", "true").csv("data/employees.csv")
```

Problems:
- Slower for large files
- Sometimes wrong datatype inference
- Not stable for production pipelines

---

### 10.2 Manual Schema (Recommended for Production)

```python
from pyspark.sql.types import StructType, StructField, IntegerType, StringType

schema = StructType([
    StructField("id", IntegerType(), True),
    StructField("name", StringType(), True),
    StructField("department", StringType(), True)
])

df = spark.read.option("header", "true").schema(schema).csv("data/employees.csv")
df.printSchema()
```

Benefits:
- Faster read
- Correct schema
- Stable pipeline

---

## 11) Best Practices (Real Company Level)

✅ Use Parquet/Delta for storage  
✅ Use manual schema for stable pipelines  
✅ Use partitionBy for big tables  
✅ Avoid too many small files  
✅ Use compression (snappy/zstd)  
✅ Use overwrite carefully (can delete full dataset)

---

## 12) Summary (Quick Notes)

- CSV is easy but slow for analytics.
- JSON is flexible but can be heavy.
- Parquet is best for Data Lakes.
- Delta is best for Databricks pipelines.
- Save modes:
  - overwrite
  - append
  - ignore
  - errorifexists
- partitionBy improves query performance.
- Manual schema is recommended for production.

---

