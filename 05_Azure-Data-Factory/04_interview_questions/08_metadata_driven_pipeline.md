# 08 - Metadata Driven Pipeline (Interview Questions)

## 1) What is metadata-driven pipeline?
A single pipeline that processes multiple entities based on config.

---

## 2) Why metadata-driven?
- scalable
- low maintenance
- easy to onboard new tables

---

## 3) What is config table?
Table storing:
- table_name
- query
- target_path
- watermark_column
- active flag

---

## 4) Typical design
Lookup config → ForEach → dynamic copy → watermark update.

---

## 5) Interview scenario
**Q:** How do you avoid creating multiple pipelines?
A: Metadata-driven framework.

---

## 6) Best practices
- log per table status
- handle failures per table
- use child pipelines
