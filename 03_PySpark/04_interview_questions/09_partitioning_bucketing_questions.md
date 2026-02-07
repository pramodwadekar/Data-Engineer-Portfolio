# 09 - Partitioning & Bucketing Interview Questions (PySpark)

This file covers partitioning concepts deeply.

---

## 1) What is partition in Spark?
**Answer:**
A partition is a chunk of distributed data processed in parallel.

---

## 2) What is partitioning in file storage?
**Answer:**
Partitioning creates folder structure based on column values.

Example:
```
/sales/date=2025-01-01/
/sales/date=2025-01-02/
```

---

## 3) Partitioning in Spark vs Partitioning in storage
**Answer:**
- Spark partitions = in-memory processing partitions
- Storage partitions = folder partitions on disk (partitionBy)

---

## 4) repartition() vs coalesce()
**Answer:**
- repartition() = shuffle, can increase/decrease partitions
- coalesce() = no shuffle, only reduces partitions

---

## 5) When to use repartition()?
**Answer:**
- before big joins
- to increase parallelism
- when data is skewed across partitions

---

## 6) When to use coalesce()?
**Answer:**
- before writing output
- reduce small files

---

## 7) What is spark.sql.shuffle.partitions?
**Answer:**
Controls number of partitions after shuffle operations.
Default = 200.

---

## 8) What is partition pruning?
**Answer:**
Spark reads only required partitions when filtering on partition column.

Example:
If table partitioned by date, and query filters date=2025-01-01,
Spark reads only that folder.

---

## 9) What is bucketing?
**Answer:**
Bucketing divides data into fixed number of files based on hash of column.

Used for:
- faster joins
- faster aggregations

---

## 10) Partitioning vs Bucketing
**Answer:**
| Partitioning | Bucketing |
|-------------|-----------|
| folder based | file based |
| good for low-cardinality columns | good for high-cardinality columns |
| helps pruning | helps joins |
| can create many folders | fixed number of buckets |

---

## 11) What is small files problem?
**Answer:**
When output creates too many small files → slow reads and metadata overhead.

---

## 12) How to solve small files problem?
**Answer:**
- coalesce before write
- OPTIMIZE in Delta
- use correct partition strategy

---

## 13) Best practices for partitioning
**Answer:**
- partition on commonly filtered columns
- avoid high-cardinality columns
- use date partitioning for fact tables
- avoid too many partitions

---

## 14) What is data skew in partitions?
**Answer:**
When one partition becomes huge due to skewed key distribution.

---

## 15) Interview Scenario
**Question:**
Your Delta table is partitioned by customer_id and has millions of customers. Problem?

**Answer:**
Too many partitions → slow metadata and reads.
Better partition by date or region.

---

## ⭐ Quick Revision
- repartition = shuffle
- coalesce = reduce partitions
- partition pruning speeds reads
- bucketing helps joins

---

✅ Next: `10_performance_tuning_questions.md`
