# 14 - Workflow (Multiple Tasks) Practical (Databricks)

🎯 Goal: Build a real workflow pipeline with task dependencies.

---

## ✅ What you will learn
- Multiple tasks
- Task dependencies
- Parallel execution
- Passing parameters
- Retry settings

---

## 1) Create 3 Notebooks

### Notebook 1: bronze
Path:
`/Repos/.../bronze_task`

```python
dbutils.widgets.text("run_date", "")
run_date = dbutils.widgets.get("run_date")

print("BRONZE RUN DATE:", run_date)
```

---

### Notebook 2: silver
Path:
`/Repos/.../silver_task`

```python
dbutils.widgets.text("run_date", "")
run_date = dbutils.widgets.get("run_date")

print("SILVER RUN DATE:", run_date)
```

---

### Notebook 3: gold
Path:
`/Repos/.../gold_task`

```python
dbutils.widgets.text("run_date", "")
run_date = dbutils.widgets.get("run_date")

print("GOLD RUN DATE:", run_date)
```

---

## 2) Create Workflow Job
Workflows → Create job

Name:
`workflow_bronze_silver_gold`

---

## 3) Add Tasks
Add 3 notebook tasks:
- bronze_task
- silver_task (depends on bronze)
- gold_task (depends on silver)

---

## 4) Pass Base Parameters
Set for each task:
- run_date = `2026-01-01`

---

## 5) Run Workflow
Click:
Run now

---

## 6) Validate Dependency
Ensure:
- bronze runs first
- then silver
- then gold

---

## 7) Interview Talking Points
- workflows support DAG style orchestration
- tasks can be parallel
- parameters allow reusable pipeline

---

## 8) Output
After this practical:
✅ you built a workflow DAG  
✅ you used dependencies  
✅ you passed parameters  

---

✅ Next: `15_job_parameters_widgets_practical.md`
