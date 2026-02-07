# 09 - Databricks Jobs & Workflows (Basics → Advanced)

This note explains Databricks orchestration using Jobs and Workflows.

---

## 1) What is Databricks Job?
A Job is a scheduled execution of tasks.

Tasks can be:
- Notebook task
- Spark Python script
- SQL task
- DLT pipeline task
- JAR task

---

## 2) What is Databricks Workflow?
Workflow is a job with:
- multiple tasks
- dependencies
- scheduling
- retries

---

## 3) Why Jobs are important for DE?
Because production pipelines need:
- scheduling
- retries
- alerts
- monitoring
- dependencies

---

## 4) Job Cluster vs All-Purpose Cluster
Best practice:
Use **Job clusters** for workflows.

---

## 5) Task Dependencies
You can set:
- Task B runs after Task A success
- parallel tasks
- conditional tasks

---

## 6) Parameters in Jobs
You can pass:
- notebook parameters (widgets)
- base parameters
- environment variables

---

## 7) Retry + Timeout Policies
You can configure:
- max retries
- retry interval
- timeout per task

---

## 8) Alerts and Notifications
Jobs can notify via:
- email
- webhook (in some setups)

---

## 9) Job Monitoring
You can check:
- run history
- logs
- task output
- cluster events

---

## 10) Scheduling
Options:
- cron schedule
- manual runs
- continuous (streaming)

---

## 11) Best Practices
- keep tasks small
- use modular notebooks
- store config in one place
- use job clusters
- log audit metrics

---

## 12) Interview Questions
### Q1) How do you schedule pipelines in Databricks?
Using Jobs/Workflows.

### Q2) How do you handle failure?
Retries + alerts + checkpointing.

---

## 13) Summary
Jobs/Workflows are orchestration layer in Databricks.

---

✅ Next: `10_parameters_widgets.md`
