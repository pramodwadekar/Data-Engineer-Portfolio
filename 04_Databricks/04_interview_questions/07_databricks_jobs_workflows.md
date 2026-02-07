# 07 - Databricks Jobs & Workflows (Interview Questions)

## 1) What is a Databricks Job?
A scheduled execution of:
- notebook
- jar
- python wheel
- dbt task
- SQL task

---

## 2) What is a Workflow?
A workflow is a DAG of tasks inside Databricks Jobs.

---

## 3) Job cluster vs All-purpose cluster
Production should use job cluster for:
- isolation
- cost
- reproducibility

---

## 4) Multi-task job
Supports:
- task dependencies
- parallel tasks
- conditional tasks

---

## 5) Job parameters
You can pass:
- notebook params
- base parameters
- widgets

---

## 6) Retries & timeouts
Important for production reliability.

---

## 7) Alerts/notifications
Send notifications on:
- failure
- success

---

## 8) Scheduling
- cron schedules
- continuous jobs
- triggered jobs

---

## 9) Common job patterns
- Bronze → Silver → Gold chain
- daily incremental loads
- streaming availableNow pattern

---

## 10) Job monitoring
- run logs
- Spark UI per run
- cluster logs

---

## 11) Interview scenario
**Q:** How do you handle failures?  
**A:** retries + idempotent design + checkpointing + alerts.

---

## 12) Best practices
- small tasks
- avoid huge monolith notebook
- use parameterization
- use service principal for prod jobs
