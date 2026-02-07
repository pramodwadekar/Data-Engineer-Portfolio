# 10 - Parameters, Widgets, and Environment Config (Must)

This note explains how to parameterize notebooks and build reusable pipelines.

---

## 1) Why parameters are needed?
Because production pipelines run for:
- different dates
- different environments (dev/qa/prod)
- different paths
- different tables

---

## 2) Databricks Widgets
Widgets allow input parameters.

### Text widget
```python
dbutils.widgets.text("run_date", "")
run_date = dbutils.widgets.get("run_date")
```

### Dropdown widget
```python
dbutils.widgets.dropdown("env", "dev", ["dev","qa","prod"])
env = dbutils.widgets.get("env")
```

---

## 3) Passing Parameters from Job
In job task:
- Base parameters:
  - run_date=2026-01-01
  - env=prod

---

## 4) Notebook Chaining
One notebook can call another.

```python
dbutils.notebook.run("/Repos/.../silver_pipeline", 0, {"run_date": run_date})
```

---

## 5) Environment Based Paths
Example:
```python
if env == "dev":
    base_path = "abfss://dev@storage.dfs.core.windows.net/"
else:
    base_path = "abfss://prod@storage.dfs.core.windows.net/"
```

---

## 6) Config File Pattern (Recommended)
Create a `config.py` in repo:
```python
def get_config(env):
    return {...}
```

---

## 7) Parameterizing SQL Tasks
In Databricks SQL:
- query parameters
- dashboard parameters

---

## 8) Best Practices
- never hardcode paths
- keep widgets minimal
- validate parameter values
- use config-driven pipelines

---

## 9) Interview Questions
### Q1) How do you run same pipeline for multiple dates?
Using widgets and passing parameters from jobs.

### Q2) How do you handle dev/prod differences?
Using env parameter + config mapping.

---

## 10) Summary
Widgets + parameters make notebooks reusable and production-ready.

---

✅ Next: `11_unity_catalog_basics.md`
