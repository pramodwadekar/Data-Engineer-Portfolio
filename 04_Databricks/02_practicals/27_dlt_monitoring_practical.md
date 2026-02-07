# 27 - DLT Monitoring Practical (Databricks)

🎯 Goal: Monitor DLT pipelines like production.

---

## ✅ What you will learn
- pipeline UI monitoring
- event logs
- lineage
- troubleshooting DLT runs
- common DLT issues

---

## 1) Open DLT Pipeline UI
Workflows → Delta Live Tables → open your pipeline.

---

## 2) Check Pipeline Graph
DLT shows DAG:
- bronze → silver → gold

You can click each table and see:
- code
- dependencies
- metrics

---

## 3) Check Update Details
For each run, check:
- rows processed
- expectations results
- execution time

---

## 4) Check Event Log Table
DLT creates system event logs.

In some setups:
- event log is stored as Delta table
- you can query pipeline events

Example:
```sql
SELECT * FROM <pipeline_event_log_table>;
```

---

## 5) Common DLT Errors + Fix

### Schema inference stuck
Fix:
- provide schema
- clean raw files

### Permission denied
Fix:
- check UC grants
- external location permissions

### Pipeline fails due to expect_or_fail
Fix:
- change expectation type or clean data

---

## 6) Best Practices
- keep DLT pipelines small and modular
- use triggered pipelines unless continuous is required
- keep expectations in silver layer
- monitor event logs

---

## 7) Interview Talking Points
- DLT provides built-in monitoring UI
- DLT tracks pipeline DAG automatically
- DLT provides DQ metrics and lineage

---

## 8) Output
After this practical:
✅ you can monitor DLT runs  
✅ you can troubleshoot common DLT failures  
✅ you understand DLT pipeline graph  

---

✅ Next: `28_spark_ui_debugging_practical.md`
