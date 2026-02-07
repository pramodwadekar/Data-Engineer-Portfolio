# 13 - Incremental Load + CDC + SCD Interview Questions

This file covers incremental loading patterns used in real projects.

---

## 1) What is incremental load?
**Answer:**
Loading only new/changed data instead of full reload.

Benefits:
- faster
- cheaper
- scalable

---

## 2) What is full load?
**Answer:**
Reloading entire dataset every run.

Used only for:
- small data
- initial load
- backfill

---

## 3) What is CDC?
**Answer:**
CDC = Change Data Capture  
Captures inserts/updates/deletes from source systems.

---

## 4) How to implement incremental load in Spark?
**Answer:**
Common patterns:
- watermark using timestamp
- last_processed_date table
- left_anti join to find new rows
- MERGE into Delta

---

## 5) What is idempotency?
**Answer:**
Pipeline produces same result even if re-run multiple times.

Very important for production.

---

## 6) How to make pipeline idempotent?
**Answer:**
- MERGE (upsert)
- replaceWhere for partitions
- delete+insert pattern for partition
- use batch_id + audit

---

## 7) What is SCD Type 1?
**Answer:**
Overwrite old value with new value.
No history maintained.

Example:
Employee department changes → update current row.

---

## 8) What is SCD Type 2?
**Answer:**
Maintains full history.

Common columns:
- effective_from
- effective_to
- is_current

---

## 9) How to implement SCD Type 2 in Delta?
**Answer:**
Use MERGE:
- expire old row (set is_current=false, effective_to=now)
- insert new row as current

---

## 10) What is deduplication in incremental load?
**Answer:**
Daily file may contain multiple updates for same key.
We must pick latest record using window row_number.

---

## 11) What is late arriving data?
**Answer:**
Data arrives late for previous dates.

Solution:
- allow backfill partitions
- use merge based on business key

---

## 12) What is schema evolution in incremental loads?
**Answer:**
Source adds new column over time.
Delta can evolve schema.

---

## 13) What is a watermark table?
**Answer:**
A table that stores last processed timestamp/date.

Example:
`pipeline_watermark(job_name, last_processed_ts)`

---

## 14) Interview Scenario
**Question:**
Daily file arrives with duplicates, updates and deletes. What will you do?

**Answer:**
- read file with schema
- deduplicate latest per key
- apply deletes separately (soft delete)
- MERGE into Delta
- audit columns + batch_id

---

## 15) SCD Type 2 best practices
**Answer:**
- always maintain surrogate key if needed
- keep is_current column
- keep effective date range
- use merge conditions carefully

---

## ⭐ Quick Revision
- incremental = only new/changed
- CDC captures changes
- idempotency is must
- SCD2 maintains history

---

✅ Next: `14_streaming_questions.md`
