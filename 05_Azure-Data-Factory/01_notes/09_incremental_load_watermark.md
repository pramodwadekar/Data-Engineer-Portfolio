# 09 - Incremental Load (Watermark Pattern) (Most Asked)

## 1) What is incremental load?
Load only new/changed data instead of full load.

---

## 2) What is watermark?
Watermark is the last processed value.

Examples:
- last_updated_timestamp
- last_id

---

## 3) Watermark pipeline design
Typical steps:
1. Read last watermark from control table
2. Copy data where updated_at > watermark
3. Write data to sink
4. Update watermark

---

## 4) Where watermark is stored?
- SQL control table
- Delta control table
- ADLS config file

---

## 5) Example SQL query (source)
```sql
SELECT *
FROM orders
WHERE updated_at > @watermark
```

---

## 6) Common Interview Questions
### Q1: Why incremental load is needed?
Cost saving + faster pipelines.

### Q2: How to handle late arriving data?
Use watermark overlap (buffer) like last 5 minutes.

### Q3: How to avoid duplicates?
Use merge/upsert in sink.

---

## 7) Best Practices
- always keep audit columns
- store watermark per table
- make pipeline idempotent
