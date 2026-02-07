# 15 - System Design Scenarios (Databricks) (Interview Questions)

## 1) Design a daily ingestion pipeline in Databricks
Expected answer:
- Auto Loader ingestion to bronze
- checkpointing
- silver cleaning
- gold aggregates
- job workflow orchestration
- optimize + zorder
- monitoring + alerts

---

## 2) Design a CDC pipeline
Expected:
- raw CDC files in storage
- MERGE INTO delta in silver
- batch_id for idempotency
- time travel for debugging

---

## 3) Design a streaming pipeline
Expected:
- Auto Loader / Kafka
- checkpointing
- watermarking
- foreachBatch for upserts
- gold KPIs

---

## 4) How do you handle schema evolution?
- Auto Loader schema evolution
- Delta schema evolution (mergeSchema)
- quarantine bad records
- controlled rollout

---

## 5) How do you handle bad records?
- _rescued_data
- quarantine table
- DQ checks
- expectation rules

---

## 6) How do you handle performance issues?
- explain plan
- Spark UI
- optimize + zorder
- broadcast join
- AQE
- fix skew

---

## 7) How do you secure data?
- Unity Catalog grants
- external locations
- secret scopes
- service principal jobs

---

## 8) How do you reduce cost?
- job clusters
- auto termination
- right sizing
- warehouse auto-stop
- avoid continuous clusters

---

## 9) Best final interview statement
“I build medallion pipelines with Delta, Auto Loader, and UC governance, and I optimize jobs using Spark UI, OPTIMIZE/ZORDER, AQE and cost controls.”

---

## 10) Must-have vocabulary
- Lakehouse
- Medallion
- UC
- Auto Loader
- DLT
- MERGE
- OPTIMIZE/ZORDER
- Photon
- AQE
