# 99 — Data Warehouse Cheat Sheet (Fast Revision)

## Core Definitions
- **DWH**: Central system for analytics + history
- **Fact table**: Measures + foreign keys
- **Dimension**: Descriptive context
- **Grain**: One row meaning in fact table
- **Surrogate key**: Warehouse-generated key
- **Conformed dimension**: shared dimension across marts

---

## OLTP vs OLAP
- OLTP = transactions
- OLAP = analytics

---

## Schema
- Star = best for BI
- Snowflake = normalized dimensions

---

## Fact Types
- Transaction
- Snapshot
- Accumulating snapshot
- Factless

---

## Dimension Patterns
- Role-playing
- Junk
- Mini
- Outrigger
- Bridge

---

## SCD
- Type 0 = no change
- Type 1 = overwrite
- Type 2 = history
- Type 3 = limited history
- Type 4 = separate history table
- Type 6 = hybrid

---

## Incremental load
- Watermark
- CDC
- MERGE/Upsert
- Partition-based

---

## Performance
- Partitioning
- Columnstore
- Distribution keys (MPP)

---

## Security
- RBAC
- RLS
- Masking
- Encryption
