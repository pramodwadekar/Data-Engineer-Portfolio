# 08 — Incremental Loading (CDC, Watermark, Merge, Upsert)

## 1) Why incremental loading?
Full load is expensive.
Incremental load ensures:
- Faster pipeline
- Lower cost
- Less compute

---

## 2) Common incremental strategies

### a) Watermark strategy
Track last processed timestamp:
- last_updated_ts

Process only new/changed rows.

Example:
SELECT * FROM orders
WHERE updated_ts > last_watermark;

---

### b) CDC (Change Data Capture)
CDC captures:
- Inserts
- Updates
- Deletes

CDC sources:
- SQL Server CDC
- Debezium (Kafka)
- Oracle GoldenGate

---

### c) Upsert / Merge strategy
Use MERGE:
- If match → update
- If not match → insert

Used heavily in:
- Delta Lake
- Snowflake
- Synapse SQL

---

### d) Partition-based incremental
Load only new partitions:
Example:
- daily partitions

---

## 3) Handling deletes
Options:
- Soft delete flag (is_deleted)
- Hard delete
- Tombstone records

---

## 4) Late arriving data
Data comes late due to:
- delayed source systems
- network issues
- backfills

Solution:
- reprocess last N days
- keep buffer window

---

## 5) Idempotency (Must know)
Pipeline should be safe to rerun without duplicates.

---

## 6) Interview questions
- What is CDC?
- Watermark vs CDC?
- How do you handle late data?
- How do you ensure idempotency?
