# 06 — Answers / Key Points (Fast Revision)

> These are not long answers, but the exact key points interviewers want.

## 1) What is a Data Warehouse?
Central system for analytics and historical reporting. Integrated from multiple sources.

## 2) OLTP vs OLAP?
OLTP = transactions, normalized, frequent updates.
OLAP = analytics, dimensional model, heavy reads.

## 3) Star schema vs Snowflake?
Star = denormalized dimensions, fewer joins, faster BI.
Snowflake = normalized dimensions, more joins, more complexity.

## 4) Grain?
Meaning of one row in fact table. Must be defined first.

## 5) Fact types?
- Transaction: one row per event
- Snapshot: one row per period
- Accumulating: one row per process lifecycle
- Factless: only occurrence

## 6) SCD Type 1 vs Type 2?
Type 1 overwrite, no history.
Type 2 insert new row, keep history.

## 7) Semi-additive measure?
Can sum across some dimensions but not time.
Example: daily account balance.

## 8) CDC?
Tracks insert/update/delete changes in source.

## 9) Watermark?
Process rows with updated_ts > last_ts.

## 10) Idempotency?
Pipeline rerun should not create duplicates.

## 11) Partitioning?
Split data by key (date) to reduce scans.

## 12) RBAC?
Access based on roles not individuals.

## 13) RLS?
Restrict rows based on user region/department.

## 14) Data Vault?
Hub (keys), Link (relationships), Satellite (attributes/history).
