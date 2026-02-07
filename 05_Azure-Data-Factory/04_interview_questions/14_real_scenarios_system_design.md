# 14 - Real Scenarios & System Design (ADF) (Interview Questions)

## 1) Design a daily pipeline (SQL → ADLS → Databricks)
Expected:
- schedule trigger
- copy SQL → bronze parquet
- trigger databricks silver
- trigger databricks gold
- logging + alerts

---

## 2) Design an incremental pipeline
Expected:
- watermark table
- lookup watermark
- incremental query
- update watermark
- idempotency

---

## 3) Design a pipeline for 100 tables
Expected:
- metadata-driven framework
- lookup config
- foreach
- child pipeline
- audit logging

---

## 4) Design file arrival ingestion
Expected:
- event trigger
- get metadata exists
- quarantine on failure

---

## 5) How to handle partial failures?
- continue on error
- log failed items
- alert at end

---

## 6) How to optimize copy cost?
- avoid full loads
- incremental copy
- partitioned copy

---

## 7) Best final line
“I build metadata-driven, incremental, idempotent ADF pipelines with audit logging and Databricks orchestration.”
