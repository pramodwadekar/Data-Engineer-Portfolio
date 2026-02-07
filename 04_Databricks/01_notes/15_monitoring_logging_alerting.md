# 15 - Monitoring, Logging, and Alerting in Databricks

This note explains monitoring for Databricks pipelines in production.

---

## 1) Why monitoring is needed?
Production pipelines need:
- reliability
- alerting
- audit
- troubleshooting

---

## 2) What to monitor in Databricks?
### Cluster level
- CPU usage
- memory usage
- executor failures

### Job level
- success/failure
- runtime duration
- retries

### Data level
- row counts
- null counts
- duplicates
- bad records

---

## 3) Spark UI Monitoring
Spark UI helps detect:
- shuffle size
- skew partitions
- stage bottlenecks
- spills

---

## 4) Job Run Logs
Databricks provides:
- run output logs
- task logs
- cluster logs

---

## 5) Audit Tables Pattern (Recommended)
Store audit metrics into Delta table:

Example columns:
- job_name
- run_date
- batch_id
- source_count
- target_count
- bad_count
- status
- start_time
- end_time

---

## 6) Alerting
Alerts can be created using:
- job failure email alerts
- Databricks SQL alerts
- cloud monitoring tools (Azure Monitor)

---

## 7) Data Quality Monitoring
Common checks:
- row count should not be zero
- amount should not be negative
- no duplicate primary keys

---

## 8) Interview Questions
### Q1) How do you monitor pipelines?
Using Jobs run history + Spark UI + audit tables.

### Q2) How do you alert failures?
Email alerts + monitoring integration.

---

## 9) Summary
Monitoring is a key production skill in Databricks.

---

✅ Next: `16_cost_optimization.md`
