# 18 - Common Errors + Debugging in Databricks (Must)

This note covers the most common Databricks issues and how to debug them.

---

## 1) Cluster Not Starting
### Common reasons
- insufficient quota
- wrong node type
- cloud capacity issue
- policy restrictions

### Fix
- try smaller node type
- check cluster events
- check workspace admin policies

---

## 2) OutOfMemoryError (Executor / Driver)

### Reasons
- huge shuffle
- collecting large data to driver
- too few partitions
- caching too much

### Fix
- avoid collect()
- increase partitions
- broadcast small tables
- increase executor memory
- use disk persist

---

## 3) Shuffle Spill / Slow Stages

### Reasons
- groupBy on huge dataset
- join big-big
- skew

### Fix
- enable AQE
- salting for skew
- reduce shuffle partitions
- optimize join strategy

---

## 4) Permission Denied (Unity Catalog)
### Reasons
- missing USE CATALOG
- missing USE SCHEMA
- missing SELECT/MODIFY
- external location permission missing

### Fix
- check grants
- ask admin to grant privileges

---

## 5) Table Not Found / Path Not Found
### Reasons
- wrong catalog/schema
- wrong storage path
- table dropped
- cluster not attached to UC

### Fix
- verify fully qualified name: catalog.schema.table
- check Data Explorer

---

## 6) Schema Mismatch Errors
### Reasons
- source column type changed
- wrong schema inference
- missing columns

### Fix
- enforce schema
- use schema evolution carefully
- add missing columns with lit(None)

---

## 7) Streaming Checkpoint Errors
### Reasons
- checkpoint deleted
- schema changed
- same checkpoint used for multiple streams

### Fix
- keep unique checkpoint per stream
- do not delete checkpoint
- restart with new checkpoint only if required

---

## 8) Auto Loader Issues
### Problems
- schema inference stuck
- huge file listing

### Fix
- set schemaLocation
- use incremental trigger (availableNow)
- validate cloudFiles settings

---

## 9) Delta Merge Conflicts
### Reasons
- duplicate keys in source
- multiple updates for same key

### Fix
- deduplicate source using window row_number
- ensure unique merge key

---

## 10) Small Files Problem
### Symptoms
- slow reads
- slow merges
- high metadata time

### Fix
- OPTIMIZE
- coalesce before write
- reduce partition count

---

## 11) Debugging Tools in Databricks

### Spark UI
- stage time
- shuffle size
- skew partitions
- spills

### explain()
```python
df.explain("formatted")
```

### DESCRIBE HISTORY
```sql
DESCRIBE HISTORY table_name;
```

---

## 12) Summary
Databricks debugging requires:
- Spark UI
- execution plan
- Delta history
- understanding of permissions

---

✅ Next: `19_databricks_interview_notes.md`
