# 17 - Spark SQL (PySpark)

This note covers Spark SQL:
- createOrReplaceTempView
- running SQL queries
- Spark SQL vs DataFrame API
- best practices

Spark SQL is heavily used in Data Engineering because it is:
✅ easy  
✅ readable  
✅ supported by Catalyst optimizer  
✅ familiar to SQL developers  

---

## 1) Setup

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("SparkSQL").getOrCreate()
```

Sample DataFrame:

```python
data = [
    (1, "Pramod", "IT", 50000),
    (2, "Akash", "HR", 60000),
    (3, "Rahul", "IT", 45000),
    (4, "Neha", "Finance", 70000),
    (5, "Om", "HR", 40000),
]

df = spark.createDataFrame(data, ["id", "name", "dept", "salary"])
df.show()
```

---

## 2) createOrReplaceTempView()

### 2.1 What is Temp View?
A Temp View allows you to run SQL queries on a DataFrame.

Temp view is:
- session-based
- available only inside current SparkSession
- not stored permanently

---

### 2.2 Create Temp View

```python
df.createOrReplaceTempView("employees")
```

Now you can query it using SQL.

---

## 3) Running SQL Queries

### 3.1 Select Query

```python
spark.sql("SELECT * FROM employees").show()
```

---

### 3.2 Filter Query

```python
spark.sql("SELECT * FROM employees WHERE dept = 'IT'").show()
```

---

### 3.3 Aggregation Query

```python
spark.sql("""
SELECT dept,
       COUNT(*) AS emp_count,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY dept
""").show()
```

---

### 3.4 Order By + Limit

```python
spark.sql("""
SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3
""").show()
```

---

## 4) Spark SQL vs DataFrame API

Both Spark SQL and DataFrame API are optimized by Catalyst.

So performance is usually similar.

---

### 4.1 DataFrame API Example

```python
from pyspark.sql.functions import col, avg

df.groupBy("dept").agg(avg("salary").alias("avg_salary")) \
  .orderBy(col("avg_salary").desc()) \
  .show()
```

---

### 4.2 Spark SQL Example

```python
spark.sql("""
SELECT dept, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept
ORDER BY avg_salary DESC
""").show()
```

---

### 4.3 Which is Better?
Depends on use case:

✅ Spark SQL is best when:
- logic is mostly SQL
- team is SQL-heavy
- queries are easier to read in SQL form

✅ DataFrame API is best when:
- logic is complex
- you need Python-based transformations
- you need loops and dynamic conditions

---

## 5) Best Practices (Production Level)

✅ Always use `createOrReplaceTempView()` for SQL transformations  
✅ Use SQL for aggregations and joins when it improves readability  
✅ Avoid `SELECT *` in production (select only needed columns)  
✅ Use multiline SQL queries for readability  
✅ Prefer Delta/Parquet tables for best performance  
✅ Use proper naming conventions for views and tables  

---

## 6) Summary (Quick Notes)

- `createOrReplaceTempView()` creates a temporary SQL view of DataFrame.
- Spark SQL queries run using `spark.sql()`.
- Spark SQL and DataFrame API both use Catalyst optimizer.
- Use SQL for readability, DataFrame API for complex logic.

---

✅ Next File: `18_rdd_basics.md`
