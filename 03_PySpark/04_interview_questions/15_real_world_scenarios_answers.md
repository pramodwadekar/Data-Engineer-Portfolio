# 15 - Real-World PySpark Interview Scenarios (With Best Answers)

This file contains real scenario questions asked in Data Engineer interviews.

---

## 1) Your Spark job is slow. What will you check first?
**Best Answer:**
1) Spark UI (stages, shuffle, skew)
2) Execution plan (explain)
3) Join strategy (broadcast vs sort merge)
4) Partition count (too high/too low)
5) Data skew keys

---

## 2) Your join output row count increased unexpectedly. Why?
**Best Answer:**
Because join key is duplicated in one side.
It becomes one-to-many join and duplicates rows.

Fix:
- deduplicate right table
- aggregate before join
- window latest record

---

## 3) How do you handle incremental loads in Delta?
**Best Answer:**
- read new data
- deduplicate latest per key
- MERGE into target
- write audit columns + batch_id
- OPTIMIZE regularly

---

## 4) How to handle duplicates in daily files?
**Best Answer:**
Use window:
- partitionBy(business_key)
- orderBy(updated_at desc)
- row_number = 1

---

## 5) How to handle schema changes in production?
**Best Answer:**
- enforce schema in Bronze
- allow schema evolution only if approved
- mergeSchema option for Delta
- keep schema versioning

---

## 6) How to handle bad records?
**Best Answer:**
- write corrupt rows to quarantine table
- continue pipeline with good rows
- audit counts

Never silently drop.

---

## 7) What is the difference between partitioning and bucketing?
**Best Answer:**
- partitioning = folder-based pruning
- bucketing = fixed hash-based files for join optimization

---

## 8) When should you NOT cache?
**Best Answer:**
- if DataFrame is used only once
- if DF is huge and memory is limited
- if pipeline is streaming and state is heavy

---

## 9) How to reduce small files?
**Best Answer:**
- coalesce before write
- OPTIMIZE for Delta
- correct partitioning
- avoid writing too frequently

---

## 10) What is AQE and why it matters?
**Best Answer:**
AQE optimizes at runtime:
- reduces shuffle partitions
- handles skew join
- changes join strategy

---

## 11) Explain Bronze-Silver-Gold to interviewer
**Best Answer:**
- Bronze: raw ingestion, minimal changes
- Silver: cleaned + standardized
- Gold: business KPIs ready for BI/reporting

---

## 12) How do you ensure idempotency?
**Best Answer:**
- MERGE instead of append
- replaceWhere for partition reload
- unique keys + dedup
- store batch_id

---

## 13) Streaming interview scenario
**Question:**
How to ensure streaming job is exactly once?

**Best Answer:**
- checkpointing
- Delta sink
- idempotent merge in foreachBatch

---

## 14) What will you do if one partition is huge (skew)?
**Best Answer:**
- identify skew keys
- salt keys
- broadcast if possible
- AQE skew join enabled

---

## 15) Best “Senior” answer template
Whenever asked “how will you do this”, answer like:
1) Ingestion (schema, bad records)
2) Cleaning (nulls, duplicates)
3) Transform (joins, window, agg)
4) Load (MERGE, partitions)
5) Performance (AQE, broadcast, optimize)
6) Monitoring (audit counts)

---

## ⭐ Final Quick Revision (Must Remember)
- shuffle is expensive
- broadcast small tables
- window for dedup + top N
- MERGE for incremental loads
- Delta = ACID + time travel
- checkpoint mandatory in streaming
- AQE helps skew + shuffle

---

✅ Interview section complete.
