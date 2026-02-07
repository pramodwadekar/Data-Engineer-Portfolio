# 10 - Metadata Driven Pipeline (Top Interview Topic)

## 1) What is metadata-driven pipeline?
A single pipeline that processes multiple tables/files based on config metadata.

---

## 2) Why metadata-driven pipelines?
- avoids creating 100 pipelines manually
- scalable and maintainable
- supports new tables by config change only

---

## 3) Typical metadata config table
Columns:
- table_name
- source_query
- target_path
- watermark_column
- is_active

---

## 4) Design pattern
1. Lookup metadata table
2. ForEach over tables
3. Copy activity for each table
4. Log results
5. Update watermark

---

## 5) Common Interview Questions
### Q1: How do you build dynamic pipelines for many tables?
Metadata-driven pipeline.

### Q2: What is benefit?
Less maintenance.

---

## 6) Best Practices
- keep config table in SQL/Delta
- log per-table status
- use child pipelines for modularity
