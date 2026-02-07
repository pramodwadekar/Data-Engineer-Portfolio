# 06 - Delta Lake in Databricks (Platform View)

This note explains how Delta Lake works inside Databricks and what a Data Engineer must know.

---

## 1) What is Delta Lake in Databricks?

Delta Lake is the default table format used in Databricks.

It is:
- built on Parquet
- managed using `_delta_log`
- supports ACID + MERGE + time travel

---

## 2) Delta Table vs Delta Files

### Delta Table
A registered object in metastore / Unity Catalog.

Example:
```sql
CREATE TABLE sales USING DELTA LOCATION 'abfss://.../sales/';
```

### Delta Files
Physical Parquet files + `_delta_log` folder.

---

## 3) Delta Table Types in Databricks

### 3.1 Managed Table
- Databricks manages storage location
- if table is dropped → data deleted

### 3.2 External Table
- data stored in external cloud storage
- drop table → data stays

---

## 4) Why Delta is mandatory for DE work?
Because real pipelines need:
- incremental loads
- upserts
- deletes
- history
- schema enforcement

---

## 5) Important Delta Features (Must)

### 5.1 ACID Transactions
Reliable reads/writes even with concurrent jobs.

### 5.2 MERGE INTO
Upsert support.

### 5.3 Time Travel
Query old versions.

### 5.4 Schema Enforcement
Stops bad writes.

### 5.5 Schema Evolution
Allows adding columns safely.

---

## 6) Delta Operations (SQL)

### Create Delta table
```sql
CREATE TABLE IF NOT EXISTS demo (
  id INT,
  name STRING
) USING DELTA;
```

### Insert
```sql
INSERT INTO demo VALUES (1,'A');
```

### Update
```sql
UPDATE demo SET name='B' WHERE id=1;
```

### Delete
```sql
DELETE FROM demo WHERE id=1;
```

### Merge
```sql
MERGE INTO demo t
USING updates s
ON t.id = s.id
WHEN MATCHED THEN UPDATE SET *
WHEN NOT MATCHED THEN INSERT *;
```

---

## 7) OPTIMIZE + ZORDER + VACUUM (Must)

### OPTIMIZE
Compacts small files.

### ZORDER
Improves query performance for common filters.

### VACUUM
Deletes old files after retention.

---

## 8) Delta Table History
```sql
DESCRIBE HISTORY demo;
```

---

## 9) Delta Table Properties
```sql
SHOW TBLPROPERTIES demo;
```

---

## 10) Best Practices
- Always use Delta for pipeline tables
- Avoid too many partitions
- Use OPTIMIZE on gold tables
- Use ZORDER on filter columns
- Use MERGE for incremental loads

---

## 11) Interview Questions
### Q1) Why Delta is better than Parquet?
ACID + MERGE + time travel + schema enforcement.

### Q2) What is `_delta_log`?
Transaction log that tracks table versions.

---

## 12) Summary
Delta is the foundation of Databricks DE pipelines.

---

✅ Next: `07_repos_git_integration.md`
