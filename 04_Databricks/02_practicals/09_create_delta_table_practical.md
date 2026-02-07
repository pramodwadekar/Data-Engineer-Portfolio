# 09 - Create Delta Table Practical (Databricks)

🎯 Goal: Create a Delta table in Databricks using PySpark + SQL.

---

## ✅ What you will learn
- Create Delta table
- Write DataFrame as Delta
- Register table
- Query table using SQL
- Delta table location concept

---

## 1) Create Notebook
Name:
`09_create_delta_table`

---

## 2) Create Sample Data
```python
from pyspark.sql.functions import current_timestamp

data = [
    (1, "Pramod", 5000),
    (2, "Nishank", 7000),
    (3, "Rahul", 6000)
]

df = spark.createDataFrame(data, ["id", "name", "salary"])           .withColumn("ingested_at", current_timestamp())

df.show()
```

---

## 3) Write as Delta (Path)
```python
delta_path = "dbfs:/tmp/delta/demo_employees"

(df.write
 .format("delta")
 .mode("overwrite")
 .save(delta_path))
```

---

## 4) Read Delta Back
```python
read_df = spark.read.format("delta").load(delta_path)
read_df.show()
```

---

## 5) Register Delta Table (SQL)
```sql
%sql
CREATE TABLE IF NOT EXISTS demo_employees
USING DELTA
LOCATION 'dbfs:/tmp/delta/demo_employees';
```

---

## 6) Query Table
```sql
%sql
SELECT * FROM demo_employees;
```

---

## 7) Check Delta History
```sql
%sql
DESCRIBE HISTORY demo_employees;
```

---

## 8) Output
After this practical:
✅ you created Delta table  
✅ you registered table in metastore  
✅ you queried it using SQL  

---

✅ Next: `10_managed_vs_external_tables_practical.md`
