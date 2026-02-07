# 12 - Delta Lake Interview Questions (Databricks Must)

This file covers Delta Lake questions from basic to advanced.

---

## 1) What is Delta Lake?
**Answer:**
Delta Lake is a storage layer built on top of Parquet that provides:
- ACID transactions
- schema enforcement
- schema evolution
- time travel
- MERGE (upsert)
- scalable metadata

---

## 2) Why Delta is needed? Why not only Parquet?
**Answer:**
Parquet is only a file format.
It does not support:
- transactions
- upserts
- deletes
- history

Delta adds reliability + correctness.

---

## 3) What does ACID mean in Delta?
**Answer:**
- **Atomicity**: all or nothing
- **Consistency**: valid state always
- **Isolation**: concurrent reads/writes safe
- **Durability**: committed data is permanent

---

## 4) What is Delta transaction log?
**Answer:**
Delta maintains `_delta_log/` folder which stores JSON and Parquet log files.
This log tracks:
- file additions/removals
- schema
- table versions

---

## 5) What is time travel?
**Answer:**
Ability to query older versions of a Delta table.

Example:
```sql
SELECT * FROM sales VERSION AS OF 5;
```

---

## 6) How to do time travel in PySpark?
**Answer:**
```python
df = spark.read.format("delta").option("versionAsOf", 5).load(path)
```

---

## 7) What is MERGE INTO?
**Answer:**
MERGE is used for upsert:
- update existing records
- insert new records

Example:
```sql
MERGE INTO target t
USING source s
ON t.id = s.id
WHEN MATCHED THEN UPDATE SET *
WHEN NOT MATCHED THEN INSERT *
```

---

## 8) What is schema enforcement?
**Answer:**
Delta prevents writing wrong schema automatically.

If mismatch → write fails.

---

## 9) What is schema evolution?
**Answer:**
Allow adding new columns.

```python
df.write.format("delta").option("mergeSchema","true").mode("append").save(path)
```

---

## 10) OPTIMIZE in Delta
**Answer:**
Compacts small files into larger files.

---

## 11) ZORDER in Delta
**Answer:**
ZORDER clusters data on disk to speed up queries on specific columns.

---

## 12) VACUUM in Delta
**Answer:**
Removes old files that are no longer needed.

Example:
```sql
VACUUM sales RETAIN 168 HOURS;
```

---

## 13) What is the default retention period?
**Answer:**
Usually 7 days (168 hours).

---

## 14) What is small files problem in Delta?
**Answer:**
Too many small Parquet files → slow reads and heavy metadata.

OPTIMIZE solves it.

---

## 15) What is Bronze-Silver-Gold architecture?
**Answer:**
- Bronze: raw ingestion
- Silver: cleaned, standardized
- Gold: business KPIs for reporting

---

## 16) What is Delta Live Tables (DLT)?
**Answer:**
Databricks feature for managed pipelines.
(Not mandatory, but good to know.)

---

## 17) What is Change Data Feed (CDF)?
**Answer:**
Delta feature that tracks row-level changes.

---

## 18) Interview Scenario
**Question:**
How do you handle daily incremental file loads in Delta?

**Answer:**
- read new file
- deduplicate
- merge into delta target
- optimize table

---

## ⭐ Quick Revision
- Delta = Parquet + log
- MERGE supports upsert
- time travel for history
- optimize compacts files
- vacuum cleans old files

---

✅ Next: `13_incremental_load_scd_questions.md`
