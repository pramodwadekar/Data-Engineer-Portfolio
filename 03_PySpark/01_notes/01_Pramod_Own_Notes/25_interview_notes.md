# 25 - PySpark Interview Notes (Advanced)

This file contains high-value PySpark interview notes:
- join types
- partition vs bucketing
- caching
- broadcast
- AQE
- performance questions
- window questions
- partitioning
- real scenario questions

---

## 1) Join Types (Most Asked)

### 1.1 Inner Join
Returns only matching rows.

### 1.2 Left Join
All left + matching right, else null.

### 1.3 Right Join
All right + matching left, else null.

### 1.4 Full Outer Join
All rows from both.

### 1.5 Left Semi Join
Returns only left rows where match exists (no right columns).

### 1.6 Left Anti Join
Returns only left rows where match does NOT exist.

---

## 2) Partition vs Bucketing (Important)

### 2.1 Partitioning
Partitioning creates folder structure on storage.

Example:
```
dept=IT/
dept=HR/
```

Used for:
- pruning while reading
- faster queries

---

### 2.2 Bucketing
Bucketing splits data into fixed number of buckets by hash of key.

Used for:
- faster joins (bucketed joins)
- stable distribution

Partitioning is file-system based.  
Bucketing is hash based.

---

## 3) Caching (Most Asked)

### Interview Question:
**When should we cache?**

Answer:
- when same DataFrame is reused multiple times
- when multiple actions are performed
- when iterative processing is needed

---

## 4) Broadcast Join

### Interview Question:
**When to use broadcast join?**

Answer:
- when one table is small (dimension)
- to avoid shuffle
- improves performance for skew joins

---

## 5) AQE (Adaptive Query Execution)

### Interview Question:
**What is AQE?**
Answer:
- Spark feature that optimizes query at runtime

AQE helps in:
- skew join handling
- shuffle partition coalescing
- dynamic join strategy selection

Enable:

```python
spark.conf.set("spark.sql.adaptive.enabled", "true")
```

---

## 6) Performance Questions (Common)

### Q1: What causes shuffle?
- join
- groupBy
- distinct
- orderBy
- repartition

### Q2: How to reduce shuffle?
- broadcast join
- filter early
- select required columns
- repartition by key (sometimes)
- tune shuffle partitions

### Q3: Why UDF is slow?
- breaks Catalyst optimization
- JVM ↔ Python overhead

---

## 7) Window Questions (Very Common)

### Q1: row_number vs rank vs dense_rank?
- row_number: unique numbering
- rank: ties share rank, skips next rank
- dense_rank: ties share rank, no skipping

### Q2: Top N per group?
Use:
- dense_rank
or
- row_number

---

## 8) Partitioning Questions

### Q1: repartition vs coalesce?
- repartition: full shuffle, can increase/decrease partitions
- coalesce: reduce partitions, less shuffle

### Q2: spark.sql.shuffle.partitions?
Default = 200  
Controls shuffle stage tasks.

---

## 9) Real Scenario Questions (Most Important)

### Scenario 1:
**Job is slow, one task taking too long.**
Likely:
- data skew

Fix:
- broadcast join
- salting
- AQE skew join

---

### Scenario 2:
**Too many small output files**
Fix:
- coalesce before write
- optimize (Delta)
- correct partition strategy

---

### Scenario 3:
**Join is very slow**
Fix:
- broadcast small table
- repartition by join key
- check skew
- enable AQE

---

### Scenario 4:
**Pipeline rerun duplicates data**
Fix:
- idempotency
- merge into
- overwrite partition

---

## 10) Quick One-Liners (Fast Revision)

- Spark is lazy (executes only on action).
- Shuffle is expensive.
- Broadcast avoids shuffle.
- Cache helps reuse.
- Delta provides ACID.
- AQE optimizes runtime plan.
- DataFrames are preferred over RDD.

---

✅ End of PySpark Notes 🎯
