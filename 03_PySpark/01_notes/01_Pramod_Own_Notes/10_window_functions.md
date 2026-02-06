# 10 - Window Functions (PySpark) (Advanced + Must)

This note covers Spark Window Functions:
- row_number()
- rank(), dense_rank()
- lag(), lead()
- running sum
- partitionBy + orderBy
- real examples: latest record, top N per group

Window functions are one of the most important topics for:
✅ Data Engineering  
✅ Analytics  
✅ Interview preparation  

---

## 1) Setup

```python
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, row_number, rank, dense_rank, lag, lead, sum
from pyspark.sql.window import Window

spark = SparkSession.builder.appName("WindowFunctions").getOrCreate()
```

Sample DataFrame:

```python
data = [
    (1, "Pramod", "IT", 50000, "2026-01-01"),
    (2, "Akash", "HR", 60000, "2026-01-01"),
    (3, "Rahul", "IT", 45000, "2026-01-02"),
    (4, "Neha", "Finance", 70000, "2026-01-01"),
    (5, "Om", "HR", 40000, "2026-01-03"),
    (6, "Kiran", "IT", 55000, "2026-01-03"),
    (7, "Riya", "IT", 55000, "2026-01-04"),
]

cols = ["emp_id", "name", "dept", "salary", "join_date"]

df = spark.createDataFrame(data, cols)
df.show()
```

---

## 2) What is a Window Function?
A window function performs calculations across a set of rows related to the current row, without collapsing rows like groupBy.

Difference:

### groupBy()
- Reduces rows (aggregation output is smaller)

### Window function
- Keeps all rows
- Adds new calculated column

---

## 3) Window Specification (partitionBy + orderBy)

Window specification defines:
- partitionBy: grouping
- orderBy: sorting within group

Example:

```python
w = Window.partitionBy("dept").orderBy(col("salary").desc())
```

---

## 4) row_number()

`row_number()` assigns unique sequential number within a partition.

Example: row number by dept, highest salary first

```python
w = Window.partitionBy("dept").orderBy(col("salary").desc())

df2 = df.withColumn("row_num", row_number().over(w))
df2.show()
```

---

## 5) rank() and dense_rank()

### 5.1 rank()
- Gives same rank for ties
- Skips next rank

Example:
Salaries: 70000, 55000, 55000, 45000  
Rank:      1,     2,     2,     4

```python
df2 = df.withColumn("rank", rank().over(w))
df2.show()
```

---

### 5.2 dense_rank()
- Gives same rank for ties
- Does NOT skip rank

Example:
Salaries: 70000, 55000, 55000, 45000  
DenseRank: 1,     2,     2,     3

```python
df2 = df.withColumn("dense_rank", dense_rank().over(w))
df2.show()
```

---

## 6) lag() and lead()

Used to access previous/next row value.

---

### 6.1 lag()
Get previous salary in same department (ordered by join_date)

```python
w_date = Window.partitionBy("dept").orderBy(col("join_date"))

df2 = df.withColumn("prev_salary", lag("salary", 1).over(w_date))
df2.show()
```

---

### 6.2 lead()
Get next salary in same department

```python
df2 = df.withColumn("next_salary", lead("salary", 1).over(w_date))
df2.show()
```

---

## 7) Running Sum (Cumulative Sum)

Example: running sum of salary by dept ordered by join_date

```python
w_running = Window.partitionBy("dept").orderBy(col("join_date"))     .rowsBetween(Window.unboundedPreceding, Window.currentRow)

df2 = df.withColumn("running_salary_sum", sum("salary").over(w_running))
df2.show()
```

---

## 8) Real Examples (Most Important)

---

### 8.1 Latest Record per Department (Example: Latest joined employee)
Use row_number ordered by join_date desc.

```python
w_latest = Window.partitionBy("dept").orderBy(col("join_date").desc())

df_latest = df.withColumn("rn", row_number().over(w_latest))     .filter(col("rn") == 1)     .drop("rn")

df_latest.show()
```

---

### 8.2 Top N Employees per Department (Top 2 salaries)
Use dense_rank (recommended).

```python
w_salary = Window.partitionBy("dept").orderBy(col("salary").desc())

df_top2 = df.withColumn("dr", dense_rank().over(w_salary))     .filter(col("dr") <= 2)     .drop("dr")

df_top2.show()
```

---

### 8.3 Detect Salary Change (Using lag)
Example: check if salary increased compared to previous record.

```python
w_dept_date = Window.partitionBy("dept").orderBy(col("join_date"))

df_change = df.withColumn("prev_salary", lag("salary").over(w_dept_date))     .withColumn(
        "salary_change",
        col("salary") - col("prev_salary")
    )

df_change.show()
```

---

## 9) Best Practices

✅ Use `dense_rank()` for top N per group  
✅ Always define correct `partitionBy` and `orderBy`  
✅ Use window only when groupBy cannot solve requirement  
✅ Be careful: window functions can be expensive on huge data  
✅ For running sums, always use `rowsBetween`  

---

## 10) Summary (Quick Notes)

- Window functions keep all rows and add new columns.
- `row_number()` gives unique sequence number.
- `rank()` skips ranks when ties occur.
- `dense_rank()` does not skip ranks.
- `lag()` gets previous row value.
- `lead()` gets next row value.
- Running sum is done using `sum().over(window)` with `rowsBetween`.
- Most common real use cases:
  - latest record
  - top N per group
  - change detection

---

