# 03 - Databricks Notebooks (Basics → Advanced)

This note covers Databricks notebooks features used in real projects.

---

## 1) What is a Databricks Notebook?
A notebook is an interactive environment where you write and run:
- Python
- SQL
- Scala
- R

Notebooks are widely used in:
- ETL development
- debugging
- exploration
- job tasks

---

## 2) Notebook Languages

You can use:
- `%python`
- `%sql`
- `%scala`
- `%r`

Example:
```sql
%sql
SELECT 1;
```

---

## 3) Notebook Cells
Cells can contain:
- code
- markdown documentation

Best practice:
Write clean markdown for project explanation.

---

## 4) Notebook Parameters (Widgets)

Widgets allow parameterized notebooks.

Example:
```python
dbutils.widgets.text("run_date", "")
run_date = dbutils.widgets.get("run_date")
```

Used in Jobs.

---

## 5) Notebook Output
Notebook can show:
- DataFrame output
- charts
- logs
- tables

---

## 6) Notebook to Job
A notebook can be scheduled as a job task.

This is how production pipelines are built.

---

## 7) Notebook Utilities (dbutils)

### dbutils.fs
Used for file operations:
```python
dbutils.fs.ls("/FileStore/")
```

### dbutils.secrets
Used to access secrets:
```python
dbutils.secrets.get(scope="my_scope", key="storage_key")
```

### dbutils.notebook
Used for:
- notebook chaining
- exit values

Example:
```python
dbutils.notebook.run("/path/notebook", 0, {"run_date":"2026-01-01"})
```

---

## 8) Notebook Best Practices
- Keep notebooks small and modular
- One notebook = one responsibility
- Use widgets for parameters
- Use notebooks as tasks in workflows
- Use repos for version control

---

## 9) Interview Questions
### Q1) Why use widgets?
**Answer:**
To run same notebook for different dates/environments.

### Q2) How to call another notebook?
**Answer:**
Using `dbutils.notebook.run()`.

---

## 10) Summary
- notebooks are core to Databricks development
- widgets enable parameterization
- dbutils provides file + secrets + workflow utilities

---

✅ Next: `04_dbfs_and_storage.md`
