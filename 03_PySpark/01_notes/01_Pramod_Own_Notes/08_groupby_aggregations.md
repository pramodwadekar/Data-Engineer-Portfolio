# 08 - GroupBy and Aggregations (PySpark)

This note covers aggregations in PySpark:
- groupBy().count()
- sum, avg, max, min
- countDistinct
- agg()
- having equivalent (filter after aggregation)

Aggregations are extremely common in Data Engineering for reporting and analytics.

---

## 1) Setup

```python
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, avg, max, min, countDistinct

spark = SparkSession.builder.appName("GroupByAggregations").getOrCreate()
```

Sample DataFrame:

```python
data = [
    (1, "Pramod", "IT", 50000),
    (2, "Akash", "HR", 60000),
    (3, "Rahul", "IT", 45000),
    (4, "Neha", "Finance", 70000),
    (5, "Om", "HR", 40000),
    (6, "Kiran", "IT", 55000),
]

cols = ["id", "name", "dept", "salary"]

df = spark.createDataFrame(data, cols)
df.show()
```

---

## 2) groupBy().count()

### 2.1 Count employees per department

```python
df.groupBy("dept").count().show()
```

Output:
- dept
- count

---

## 3) sum(), avg(), max(), min()

### 3.1 Sum of salary per department

```python
df.groupBy("dept").agg(sum("salary").alias("total_salary")).show()
```

---

### 3.2 Average salary per department

```python
df.groupBy("dept").agg(avg("salary").alias("avg_salary")).show()
```

---

### 3.3 Max salary per department

```python
df.groupBy("dept").agg(max("salary").alias("max_salary")).show()
```

---

### 3.4 Min salary per department

```python
df.groupBy("dept").agg(min("salary").alias("min_salary")).show()
```

---

## 4) agg() (Multiple Aggregations Together)

`agg()` is used to apply multiple aggregation functions in one query.

Example:

```python
df.groupBy("dept").agg(
    countDistinct("id").alias("emp_count"),
    sum("salary").alias("total_salary"),
    avg("salary").alias("avg_salary"),
    max("salary").alias("max_salary"),
    min("salary").alias("min_salary")
).show()
```

---

## 5) countDistinct()

`countDistinct()` gives unique count.

Example: unique departments

```python
df.select(countDistinct("dept").alias("unique_dept_count")).show()
```

Example: unique employees in each dept

```python
df.groupBy("dept").agg(countDistinct("name").alias("unique_names")).show()
```

---

## 6) Having Equivalent in PySpark

In SQL:
```sql
SELECT dept, COUNT(*)
FROM employees
GROUP BY dept
HAVING COUNT(*) > 2;
```

In PySpark:
- First do groupBy
- Then apply filter on aggregated result

---

### 6.1 Having-like Filter Example

```python
df_dept_count = df.groupBy("dept").count()
df_dept_count.show()
```

Now filter departments having count > 2

```python
df_dept_count.filter(col("count") > 2).show()
```

---

### 6.2 Another Having-like Example (Average salary > 50000)

```python
df_avg = df.groupBy("dept").agg(avg("salary").alias("avg_salary"))

df_avg.filter(col("avg_salary") > 50000).show()
```

---

## 7) Aggregations with Multiple Group Columns

Example: group by dept and salary (demo)

```python
df.groupBy("dept", "salary").count().show()
```

---

## 8) Real Data Engineering Use Cases

### 8.1 Department level summary table

```python
dept_summary = df.groupBy("dept").agg(
    countDistinct("id").alias("total_employees"),
    avg("salary").alias("avg_salary"),
    max("salary").alias("highest_salary")
)

dept_summary.show()
```

---

### 8.2 Top department by total salary

```python
dept_summary.orderBy(col("avg_salary").desc()).show()
```

---

## 9) Best Practices

✅ Always use `.alias()` for aggregated column names  
✅ Use `agg()` to combine multiple metrics  
✅ Use `countDistinct()` for unique counts  
✅ For HAVING condition → filter after aggregation  
✅ For big tables, consider partitioning and caching if reused  

---

## 10) Summary (Quick Notes)

- `groupBy().count()` gives group counts.
- Use `sum()`, `avg()`, `max()`, `min()` for aggregations.
- `countDistinct()` gives unique counts.
- Use `agg()` for multiple aggregations in one query.
- HAVING is done by filtering aggregated DataFrame.

---



