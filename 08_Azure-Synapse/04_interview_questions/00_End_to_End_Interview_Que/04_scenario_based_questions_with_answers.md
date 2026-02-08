# 04 — Scenario Based Synapse Questions (With Answers)

## 1) You have raw CSV files in ADLS. Business wants dashboards. What approach?
**Answer:**
- Use serverless SQL with OPENROWSET for exploration
- Convert CSV to Parquet using Spark
- Use CETAS to create gold curated parquet
- If high concurrency needed → load into dedicated SQL pool

---

## 2) Dedicated pool query is slow. What steps?
**Answer:**
- Check distribution mismatch
- Check data movement
- Check skew
- Ensure columnstore index
- Create/update statistics
- Add partitions
- Create marts/materialized views

---

## 3) Serverless query cost is high. What to do?
**Answer:**
- Avoid SELECT *
- Use parquet
- Partition folders
- Use CETAS curated layer
- Reduce file scanning

---

## 4) Pipeline incremental load duplicates data. How to fix?
**Answer:**
- Use watermark table
- Use upsert/merge strategy
- Ensure idempotency
- Store pipeline run state

---

## 5) Synapse cannot access ADLS. Linked service is correct. Why?
**Answer:**
- RBAC given but ACL missing
- Or private endpoint/network restrictions

---

## 6) Fact table joins are slow in dedicated pool.
**Answer:**
- Replicate dimensions
- Hash distribute fact on join key
- Ensure stats
- Reduce data movement

---

## 7) How do you design hybrid architecture?
**Answer:**
- Spark for transformations (Delta)
- Dedicated SQL pool for BI serving
- Pipelines for orchestration
- Serverless for validation
