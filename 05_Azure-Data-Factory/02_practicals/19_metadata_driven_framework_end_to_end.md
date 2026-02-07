# 19 - Metadata Driven Framework (End-to-End) (Practical)

## Goal
Build a single ADF framework pipeline to ingest many tables incrementally.

---

## Components
- Config table (metadata)
- Watermark table
- Audit table
- Parent pipeline
- Child pipeline (per table)

---

## Steps (High level)
1. Lookup active tables
2. ForEach table:
   - read watermark
   - incremental copy
   - update watermark
   - log audit
3. Trigger Databricks silver job
4. Trigger gold aggregation job

---

## Interview Points
This is the #1 best ADF project pattern.
