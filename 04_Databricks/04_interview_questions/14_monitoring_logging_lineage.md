# 14 - Monitoring, Logging, Lineage (Interview Questions)

## 1) How do you monitor Databricks jobs?
- Job run UI
- Spark UI
- cluster logs
- metrics

---

## 2) What is Spark UI used for?
- stages breakdown
- task duration
- shuffle read/write
- skew detection

---

## 3) DLT monitoring
DLT provides built-in:
- pipeline event logs
- expectation metrics
- lineage

---

## 4) Unity Catalog lineage
UC lineage shows:
- table dependencies
- notebook/job sources

---

## 5) Job logs
Logs show:
- stdout/stderr
- driver logs
- executor logs

---

## 6) Audit logs
UC provides audit logs for:
- access events
- grants
- object changes

---

## 7) Common interview scenario
**Q:** How do you debug a failed job?  
**A:** check error stack trace + Spark UI + input data + permissions.

---

## 8) Production best practices
- alerts on failure
- log important metrics
- use quarantine tables
- maintain run_id/batch_id
