# 09 - Joins in PySpark (Very Important)

This note covers the most important join concepts in PySpark:
- inner join, left join, right join, full join
- left_anti join, left_semi join
- join on multiple columns
- handling duplicate columns
- broadcast join concept

Joins are one of the most common operations in Data Engineering pipelines.

---

## 1) Setup

```python
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, broadcast

spark = SparkSession.builder.appName("Joins").getOrCreate()
```

Sample DataFrames:

```python
emp_data = [
    (1, "Pramod", 101),
    (2, "Akash", 102),
    (3, "Rahul", 101),
    (4, "Neha", 103),
    (5, "Om", None)
]

dept_data = [
    (101, "IT"),
    (102, "HR"),
    (103, "Finance"),
    (104, "Admin")
]

emp_cols = ["emp_id", "emp_name", "dept_id"]
dept_cols = ["dept_id", "dept_name"]

df_emp = spark.createDataFrame(emp_data, emp_cols)
df_dept = spark.createDataFrame(dept_data, dept_cols)

df_emp.show()
df_dept.show()
```

---

## 2) Basic Join Syntax

```python
df_join = df_emp.join(df_dept, on="dept_id", how="inner")
df_join.show()
```

---

## 3) Inner Join

Inner join returns only matching records.

```python
df_emp.join(df_dept, on="dept_id", how="inner").show()
```

---

## 4) Left Join

Left join returns:
- all rows from left table
- matching rows from right table
- non-matching rows become null on right side

```python
df_emp.join(df_dept, on="dept_id", how="left").show()
```

---

## 5) Right Join

Right join returns:
- all rows from right table
- matching rows from left table
- non-matching rows become null on left side

```python
df_emp.join(df_dept, on="dept_id", how="right").show()
```

---

## 6) Full Outer Join

Full join returns:
- all rows from both tables
- non-matching rows become null

```python
df_emp.join(df_dept, on="dept_id", how="full").show()
```

---

## 7) Left Semi Join

Left semi join returns:
- only rows from left table
- where match exists in right table
- does NOT return right side columns

Example: employees who have valid department

```python
df_emp.join(df_dept, on="dept_id", how="left_semi").show()
```

---

## 8) Left Anti Join

Left anti join returns:
- only rows from left table
- where NO match exists in right table
- does NOT return right side columns

Example: employees with invalid department

```python
df_emp.join(df_dept, on="dept_id", how="left_anti").show()
```

---

## 9) Join on Multiple Columns

Sometimes join condition needs multiple columns.

Example Data:

```python
sales_data = [
    (1, "2026-01-01", 1000),
    (2, "2026-01-01", 2000),
    (1, "2026-01-02", 1500)
]

target_data = [
    (1, "2026-01-01", 900),
    (2, "2026-01-01", 1800),
    (1, "2026-01-03", 1200)
]

df_sales = spark.createDataFrame(sales_data, ["emp_id", "sale_date", "amount"])
df_target = spark.createDataFrame(target_data, ["emp_id", "sale_date", "target"])

df_sales.show()
df_target.show()
```

Join on multiple columns:

```python
df_sales.join(
    df_target,
    on=["emp_id", "sale_date"],
    how="inner"
).show()
```

---

## 10) Handling Duplicate Columns in Join (Important)

If you join on a condition instead of `on="col"`, Spark keeps both columns.

Example:

```python
df_emp.join(
    df_dept,
    df_emp.dept_id == df_dept.dept_id,
    "inner"
).show()
```

Now you will have duplicate columns:
- dept_id (from emp)
- dept_id (from dept)

---

### 10.1 Best Practice: Use alias() + select required columns

```python
e = df_emp.alias("e")
d = df_dept.alias("d")

df_join = e.join(d, col("e.dept_id") == col("d.dept_id"), "inner")     .select(
        col("e.emp_id"),
        col("e.emp_name"),
        col("e.dept_id"),
        col("d.dept_name")
    )

df_join.show()
```

---

### 10.2 Drop duplicate column

```python
df_join = df_emp.join(
    df_dept,
    df_emp.dept_id == df_dept.dept_id,
    "inner"
).drop(df_dept.dept_id)

df_join.show()
```

---

## 11) Broadcast Join Concept (Very Important)

### 11.1 What is Broadcast Join?
Broadcast join means:
- Spark sends a small table to all executors
- So join happens locally without shuffle

This makes joins faster when:
- one table is very small
- another table is huge

---

### 11.2 When to Use Broadcast Join?
Use broadcast join when:
- dimension table is small (ex: dept table)
- fact table is huge (ex: transactions)

---

### 11.3 Broadcast Join Example

```python
df_join = df_emp.join(broadcast(df_dept), on="dept_id", how="left")
df_join.show()
```

---

### 11.4 Broadcast Join Benefit
Without broadcast:
- Spark may shuffle both tables

With broadcast:
- Spark avoids shuffle
- join becomes faster

---

## 12) Join Types Summary Table

| Join Type | Output |
|----------|--------|
| inner | Only matching rows |
| left | All left + matching right |
| right | All right + matching left |
| full | All rows from both |
| left_semi | Left rows where match exists |
| left_anti | Left rows where match does NOT exist |

---

## 13) Best Practices (Production Level)

✅ Use correct join type (avoid full join unless required)  
✅ Always handle duplicate columns using alias/select  
✅ Use broadcast join for small dimension tables  
✅ Avoid joining huge tables without partition strategy  
✅ Check skew when joining on high-frequency keys  

---

## 14) Summary (Quick Notes)

- Joins combine data from multiple DataFrames.
- Most common join types: inner, left, right, full.
- left_semi and left_anti are very useful in DE pipelines.
- Join on multiple columns using `on=[...]`.
- Handle duplicate columns with alias + select.
- Broadcast join is used for small dimension tables.

---


