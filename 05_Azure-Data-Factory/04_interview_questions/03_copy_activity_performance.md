# 03 - Copy Activity + Performance (Interview Questions)

## 1) What is Copy Activity?
Moves data from source to sink.

---

## 2) Copy activity is used for?
- SQL → ADLS
- ADLS → SQL
- SFTP → ADLS
- REST → ADLS

---

## 3) What is DIU?
Data Integration Unit = copy compute capacity.

---

## 4) How to improve copy performance?
- increase DIU
- parallel copy
- partitioned copy
- staging

---

## 5) What is partitioned copy?
Splits source data into partitions and copies in parallel.

---

## 6) Copy behavior options?
- overwrite
- append
- upsert (sink dependent)

---

## 7) Copy activity vs Data Flow?
- Copy = movement
- Data Flow = transformations

---

## 8) How to handle large SQL tables?
- use partitioned copy
- incremental loads
- avoid full loads daily

---

## 9) Common copy failures?
- permissions
- IR issues
- schema mismatch
- network/firewall

---

## 10) Best practices
- write parquet for bronze
- partition folders by date
- log rows copied
