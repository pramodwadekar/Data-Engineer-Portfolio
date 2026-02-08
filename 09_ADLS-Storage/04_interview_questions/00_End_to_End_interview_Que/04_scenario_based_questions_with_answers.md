# 04 — Scenario Based ADLS Questions (With Answers)

## 1) Synapse cannot read ADLS folder. IAM role is correct. Why?
**Answer:** ACL missing, or missing execute permission on parent folders.

---

## 2) User can access ADLS in portal but ADF pipeline fails.
**Answer:** Pipeline uses managed identity/SPN. That identity lacks RBAC or ACL.

---

## 3) You created private endpoint but still cannot access storage.
**Answer:** Private DNS zone not linked or wrong endpoint (dfs vs blob).

---

## 4) Serverless SQL queries are expensive.
**Answer:** Too much data scanned due to CSV, no partitions, SELECT *.
Fix: parquet + partitions + CETAS.

---

## 5) Many small files causing slow Spark.
**Answer:** Use compaction strategy:
- coalesce/repartition
- write parquet/delta
- optimize partitioning

---

## 6) Analysts should read gold but not raw.
**Answer:**
- RBAC: Reader for analysts
- ACL: r-x on gold, no permissions on raw

---

## 7) Need to share a folder for 2 days to vendor.
**Answer:** Use SAS token with expiry and limited permissions.
