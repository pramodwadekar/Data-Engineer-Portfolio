# 03 - Read/Write Formats Interview Questions (CSV/JSON/Parquet/Delta)

This file covers file-format related PySpark interview questions.

---

## 1) How to read CSV in PySpark?
**Answer:**
```python
df = spark.read.option("header","true").option("inferSchema","true").csv("/path/file.csv")
```

---

## 2) How to write CSV in PySpark?
**Answer:**
```python
df.write.mode("overwrite").option("header","true").csv("/path/out/")
```

---

## 3) What is schema inference?
**Answer:**
Spark automatically detects column data types.

Problem:
- sometimes wrong types
- slower for big files

---

## 4) Why manual schema is recommended?
**Answer:**
Because it:
- improves performance
- avoids wrong datatypes
- prevents corrupt data

---

## 5) How to read JSON?
**Answer:**
```python
df = spark.read.json("/path/file.json")
```

---

## 6) How to read multi-line JSON?
**Answer:**
```python
df = spark.read.option("multiLine","true").json("/path/file.json")
```

---

## 7) How to read Parquet?
**Answer:**
```python
df = spark.read.parquet("/path/file.parquet")
```

---

## 8) Why Parquet is preferred in DE?
**Answer:**
Because Parquet is:
- columnar
- compressed
- faster for analytics
- supports predicate pushdown

---

## 9) What is Delta Lake?
**Answer:**
Delta Lake is a storage layer on top of Parquet that provides:
- ACID transactions
- schema enforcement
- time travel
- merge/upsert

---

## 10) How to read Delta table?
**Answer:**
```python
df = spark.read.format("delta").load("/path/delta_table")
```

---

## 11) How to write Delta table?
**Answer:**
```python
df.write.format("delta").mode("overwrite").save("/path/delta_table")
```

---

## 12) Write modes in Spark
**Answer:**
- overwrite
- append
- ignore
- errorifexists

---

## 13) What is partitionBy while writing?
**Answer:**
It creates folder partitions.

Example:
```python
df.write.format("delta").mode("overwrite").partitionBy("dept").save("/path/")
```

Benefits:
- faster filtering
- partition pruning

---

## 14) Compression in Spark
**Answer:**
Spark supports compression like:
- snappy (default for parquet)
- gzip
- lz4

Example:
```python
df.write.option("compression","snappy").parquet("/path/")
```

---

## 15) Difference between save() and saveAsTable()
**Answer:**
- save(): writes to path
- saveAsTable(): creates metastore table

---

## 16) What is corrupt record handling?
**Answer:**
Spark can store bad rows in a special column `_corrupt_record`.

```python
spark.read.option("columnNameOfCorruptRecord","_corrupt_record")
```

---

## ⭐ Quick Revision
- Parquet is columnar + fast
- Delta adds ACID + MERGE
- partitionBy helps pruning
- manual schema is best

---

✅ Next file: `04_schema_datatypes_questions.md`
