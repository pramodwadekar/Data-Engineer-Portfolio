# 15 - Job Parameters + Widgets Practical (Databricks)

🎯 Goal: Parameterize notebooks properly like production pipelines.

---

## ✅ What you will learn
- Widgets
- Default values
- Validation
- Passing parameters from Jobs
- Environment pattern (dev/prod)

---

## 1) Create Notebook
Name:
`15_widgets_demo`

---

## 2) Create Widgets
```python
dbutils.widgets.text("run_date", "")
dbutils.widgets.dropdown("env", "dev", ["dev","qa","prod"])

run_date = dbutils.widgets.get("run_date")
env = dbutils.widgets.get("env")

print("RUN DATE:", run_date)
print("ENV:", env)
```

---

## 3) Add Validation
```python
if run_date.strip() == "":
    raise Exception("run_date is mandatory. Example: 2026-01-01")
```

---

## 4) Environment Path Pattern
```python
if env == "dev":
    base_path = "dbfs:/tmp/dev/"
elif env == "qa":
    base_path = "dbfs:/tmp/qa/"
else:
    base_path = "dbfs:/tmp/prod/"

print("Base path:", base_path)
```

---

## 5) Run Notebook Manually
Set widget values and run.

---

## 6) Run Notebook via Job
Create job task and pass:
- run_date=2026-01-01
- env=prod

---

## 7) Best Practices
- validate inputs
- keep parameters at top
- use config-driven logic

---

## 8) Interview Talking Points
- widgets enable reusability
- jobs pass base parameters
- env pattern is used in real pipelines

---

## 9) Output
After this practical:
✅ you can parameterize notebooks  
✅ you can run same pipeline for multiple dates/env  

---

✅ Next: `16_retry_timeout_alerts_practical.md`
