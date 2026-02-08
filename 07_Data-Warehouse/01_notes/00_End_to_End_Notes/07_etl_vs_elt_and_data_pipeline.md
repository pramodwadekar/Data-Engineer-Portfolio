# 07 — ETL vs ELT + Data Pipeline in DWH

## 1) ETL
ETL = Extract → Transform → Load

Transform happens BEFORE loading to warehouse.

Used when:
- Warehouse compute is expensive
- Traditional DWH systems

---

## 2) ELT
ELT = Extract → Load → Transform

Transform happens INSIDE warehouse.

Used when:
- Cloud warehouses have powerful compute
- You want raw copy for audit

Examples:
- Snowflake ELT
- BigQuery ELT
- Synapse ELT
- Databricks Lakehouse ELT

---

## 3) Typical pipeline stages
1. Extract
2. Landing (raw)
3. Validation
4. Standardization
5. Deduplication
6. Business rules
7. Load into dimension/fact
8. Data marts
9. Reporting

---

## 4) Common transformation types
- Data type conversions
- Null handling
- Standardization (country codes, dates)
- Deduplication
- Lookups (dimension mapping)
- SCD handling
- Aggregations

---

## 5) Batch vs Streaming
Warehouses mostly batch, but modern DWH supports:
- Micro-batch
- Streaming ingestion

---

## 6) Interview questions
- ETL vs ELT difference?
- When to prefer ELT?
- What is staging layer?
