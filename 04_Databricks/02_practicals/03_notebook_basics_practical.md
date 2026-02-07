# 03 - Notebook Basics Practical (Databricks)

🎯 Goal: Learn notebook features used in real Data Engineering work.

---

## ✅ What you will learn
- Markdown + code cells
- Running cells
- Switching languages (%sql, %python)
- Displaying DataFrames
- Notebook organization style

---

## 1) Create Notebook
Path:
`Workspace/Users/<email>/02_practicals/`

Name:
`03_notebook_basics`

---

## 2) Add Markdown Cell
Add:

```markdown
# Databricks Notebook Basics
This notebook tests Python + SQL + display outputs.
```

---

## 3) Run Basic PySpark Code

```python
df = spark.range(1, 6).toDF("id")
df.show()
```

---

## 4) Create a Temp View

```python
df.createOrReplaceTempView("temp_ids")
```

---

## 5) Run SQL Cell

```sql
%sql
SELECT * FROM temp_ids;
```

---

## 6) Display DataFrame
```python
display(df)
```

---

## 7) Notebook Best Practices (Must)
- Keep markdown headings
- One notebook = one responsibility
- Keep parameters at top
- Avoid huge notebooks

---

## 8) Notebook Chaining (Preview)
Databricks allows:

```python
# Example only
dbutils.notebook.run("/path/another_notebook", 0)
```

Used in workflows.

---

## 9) Output
After this practical, you can:
✅ use python + sql in same notebook  
✅ use markdown for documentation  
✅ create temp views and query using SQL  

---

✅ Next: `04_dbutils_fs_practical.md`
