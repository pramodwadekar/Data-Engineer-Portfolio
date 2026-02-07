# 16 - Real World Best Practices (ADF)

## 1) Design best practices
- use medallion architecture (bronze/silver/gold)
- keep ingestion and transformation separate
- use child pipelines

---

## 2) Performance best practices
- partitioned copy for large tables
- avoid copying huge single files
- tune DIU and parallelism

---

## 3) Reliability best practices
- retries
- idempotency
- watermark incremental loads

---

## 4) Monitoring best practices
- alerts on failure
- log row counts
- log run_id + batch_id

---

## 5) Security best practices
- Key Vault for secrets
- managed identity
- least privilege

---

## 6) Interview-ready statements
- “ADF is orchestrator, Databricks is compute”
- “I use watermark incremental loads”
- “I build metadata-driven pipelines”
- “I use Key Vault + managed identity”
- “I deploy using ARM templates CI/CD”

---

## 7) What makes you stand out
If you can explain:
- metadata-driven pipeline
- incremental load
- ADF + Databricks orchestration
- CI/CD
Then you are above 90% candidates.
