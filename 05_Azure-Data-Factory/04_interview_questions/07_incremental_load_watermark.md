# 07 - Incremental Load (Watermark) (Interview Questions)

## 1) What is incremental load?
Loading only new/changed data.

---

## 2) What is watermark?
Last processed value (timestamp/id).

---

## 3) Where watermark is stored?
- SQL control table
- Delta control table
- config file

---

## 4) Incremental pipeline steps
1. Read watermark
2. Copy new rows
3. Update watermark
4. Log audit

---

## 5) How to avoid missing records?
Use overlap buffer:
- watermark - 5 minutes

---

## 6) How to avoid duplicates?
Use merge/upsert in target.

---

## 7) Incremental file ingestion?
Track processed file names.

---

## 8) Interview scenario
**Q:** Table has no updated_at column, what do you do?
A: Use incremental id or load full daily + deduplicate in Databricks.

---

## 9) Best practices
- watermark per table
- idempotent loads
- audit logs
