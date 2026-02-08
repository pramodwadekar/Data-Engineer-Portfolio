# 07 - ETL vs ELT in DW

## ETL
Extract → Transform → Load

Transform happens before loading into DW.

Used in:
- traditional DW tools

---

## ELT
Extract → Load → Transform

Load raw into lake/warehouse then transform.

Used in:
- modern lakehouse (Databricks, Snowflake)

---

## Data Engineering reality
Most companies use hybrid:
- ADF loads raw to lake (E)
- Databricks transforms (T)
- Delta/Synapse stores curated (L)

---
