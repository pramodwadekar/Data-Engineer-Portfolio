# 10 - Delta Live Tables (DLT) (Interview Questions)

## 1) What is DLT?
DLT is a managed pipeline framework in Databricks for building:
- bronze/silver/gold pipelines
- with monitoring and lineage

---

## 2) Why DLT?
- less boilerplate
- built-in monitoring
- built-in data quality
- declarative pipeline

---

## 3) DLT tables
- streaming tables
- materialized views

---

## 4) What are DLT Expectations?
Data quality rules:
- expect
- expect_or_drop
- expect_or_fail

---

## 5) DLT pipeline modes
- triggered
- continuous

---

## 6) Auto Loader inside DLT
DLT uses Auto Loader for file ingestion.

---

## 7) DLT monitoring
DLT UI shows:
- row counts
- failures
- expectation metrics
- lineage graph

---

## 8) DLT vs normal notebooks
DLT is preferred for:
- standardized pipelines
- production monitoring
Normal notebooks are preferred for:
- custom ETL logic

---

## 9) Interview scenario
**Q:** How do you implement data quality in Databricks?  
**A:** DLT expectations + quarantine tables + validation checks.

---

## 10) Best practices
- keep tables small and modular
- use expectations for key rules
- use medallion architecture
