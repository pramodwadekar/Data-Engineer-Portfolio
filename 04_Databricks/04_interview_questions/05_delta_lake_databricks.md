# 05 - Delta Lake in Databricks (Interview Questions)

## 1) What is Delta Lake?
Delta Lake is a storage layer that provides:
- ACID transactions
- schema enforcement/evolution
- time travel
- efficient merges (upsert)

---

## 2) Why Delta is needed?
Because Parquet alone has problems:
- no ACID
- no safe updates
- no concurrency handling

---

## 3) What is the Delta transaction log?
A folder `_delta_log/` containing JSON/Parquet logs that track:
- table versions
- file adds/removes
- schema changes

---

## 4) Delta table operations
- INSERT
- UPDATE
- DELETE
- MERGE INTO
- OPTIMIZE
- VACUUM

---

## 5) What is MERGE INTO?
MERGE performs upsert:
- update matching records
- insert non-matching records

Used for CDC pipelines.

---

## 6) What is time travel?
Query old versions:
```sql
SELECT * FROM table VERSION AS OF 5;
```

---

## 7) What is VACUUM?
Deletes old files not referenced by Delta log (cleanup).

---

## 8) What is OPTIMIZE?
Compacts small files into larger files for better performance.

---

## 9) What is ZORDER?
ZORDER clusters data based on columns to speed up filters.

---

## 10) Bronze-Silver-Gold with Delta
- Bronze: raw, append-only
- Silver: cleaned
- Gold: business aggregates

---

## 11) Schema enforcement vs evolution
- enforcement: prevents bad schema
- evolution: allows new columns (controlled)

---

## 12) Delta best practices
- partition only when needed
- optimize regularly
- handle small files
- use merge for incremental loads

---

## 13) Interview scenario
**Q:** Why is Delta better than Parquet?  
**A:** ACID + MERGE + time travel + schema control.
