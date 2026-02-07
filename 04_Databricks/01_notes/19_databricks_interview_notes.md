# 19 - Databricks Interview Notes (Basic → Advanced)

This file contains the most asked Databricks interview questions and best answers.

---

## 1) Databricks Fundamentals

### Q1) What is Databricks?
Managed Spark + Delta platform for data engineering, analytics, ML, governance.

### Q2) Databricks vs Spark?
Spark is compute engine.
Databricks is managed platform with Spark + Delta + workflows + governance.

---

## 2) Clusters

### Q3) Job cluster vs all-purpose cluster?
- all-purpose: interactive
- job cluster: production, cheaper

### Q4) Why auto termination?
To reduce cost.

### Q5) What is Photon?
Databricks execution engine for faster SQL/Delta.

---

## 3) Storage

### Q6) What is DBFS?
File system abstraction layer for Databricks.

### Q7) DBFS vs cloud storage?
DBFS is interface, cloud storage is actual storage.

---

## 4) Delta Lake

### Q8) Why Delta?
ACID, MERGE, time travel, schema enforcement.

### Q9) What is `_delta_log`?
Transaction log that stores table history and file changes.

### Q10) OPTIMIZE vs VACUUM?
- OPTIMIZE: compaction
- VACUUM: delete old files

### Q11) ZORDER?
Improves data skipping for frequent filter columns.

---

## 5) Unity Catalog

### Q12) What is Unity Catalog?
Governance layer for catalogs/schemas/tables/permissions.

### Q13) UC object hierarchy?
catalog → schema → table/view

### Q14) Managed vs external table?
Managed: Databricks controls data
External: data stays in cloud storage

### Q15) External location?
Secure mapping between UC and cloud storage path.

---

## 6) Auto Loader

### Q16) What is Auto Loader?
Incremental file ingestion feature in Databricks.

### Q17) Why Auto Loader?
Scales better than file listing, supports schema evolution, checkpointing.

---

## 7) Jobs & Workflows

### Q18) What is workflow?
Job with multiple dependent tasks.

### Q19) How to pass parameters?
Widgets + base parameters.

### Q20) How to monitor jobs?
Run history + logs + Spark UI.

---

## 8) DLT

### Q21) What is Delta Live Tables?
Managed ETL pipeline framework with expectations and monitoring.

### Q22) Why DLT?
Simplifies pipeline management, adds DQ rules, lineage.

---

## 9) Security

### Q23) How do you store secrets?
Secret scopes (Key Vault backed preferred).

### Q24) Why not hardcode secrets?
Security risk and compliance issue.

---

## 10) Production Scenario Questions

### Q25) Your job is slow, what will you check?
- Spark UI
- shuffle size
- join strategy
- skew
- execution plan

### Q26) How do you ensure pipeline rerun safety?
Idempotency using MERGE / replaceWhere.

---

## 11) Final Must-Know Summary
If you want to crack Databricks DE interviews, you must know:
- Unity Catalog
- Jobs/Workflows
- Delta Lake
- Auto Loader
- performance + cost optimization

---

✅ Next: Bonus topics (20-24)
