# 06 - Filtering, Sorting, and Limit (PySpark)

This note covers how to:
- filter() / where()
- apply multiple conditions
- use isin() and between()
- sort data using orderBy() / sort()
- limit rows

These are daily-used operations in Data Engineering pipelines.

---

## 1) Setup

```python
from pyspark.sql import SparkSession
from pyspark.sql.functions import col

spark = SparkSession.builder.appName("FilterSortLimit").getOrCreate()
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

cols = ["id", "name", "dept", "salary"]

df = spark.createDataFrame(data, cols)
df.show()
```

---

## 2) filter() and where()

### 2.1 filter()
`filter()` is used to filter rows based on condition.

```python
df.filter(col("dept") == "IT").show()
```

---

### 2.2 where()
`where()` is exactly same as filter().

```python
df.where(col("salary") > 50000).show()
```

✅ Both are same. Use any one.

---

## 3) Multiple Conditions

When using multiple conditions, always use:
- `&` for AND
- `|` for OR
- `~` for NOT

⚠️ Important:
- Always put each condition inside brackets `( )`

---

### 3.1 AND Condition

```python
df.filter((col("dept") == "HR") & (col("salary") > 45000)).show()
```

---

### 3.2 OR Condition

```python
df.filter((col("dept") == "IT") | (col("dept") == "Finance")).show()
```

---

### 3.3 NOT Condition

```python
df.filter(~(col("dept") == "IT")).show()
```

---

### 3.4 Complex Conditions Example

```python
df.filter(
    ((col("dept") == "IT") & (col("salary") >= 45000)) |
    ((col("dept") == "Finance") & (col("salary") >= 65000))
).show()
```

---

## 4) isin() and between()

### 4.1 isin()
Used when you want to filter using list of values.

Example:

```python
df.filter(col("dept").isin("IT", "HR")).show()
```

---

### 4.2 between()
Used for range filtering (inclusive).

Example:

```python
df.filter(col("salary").between(45000, 65000)).show()
```

Meaning:
- salary >= 45000 AND salary <= 65000

---

## 5) orderBy() and sort()

### 5.1 orderBy() (Ascending by default)

```python
df.orderBy("salary").show()
```

---

### 5.2 Descending order

```python
df.orderBy(col("salary").desc()).show()
```

---

### 5.3 Sort by multiple columns

```python
df.orderBy(col("dept").asc(), col("salary").desc()).show()
```

---

### 5.4 sort() is same as orderBy()

```python
df.sort(col("salary").desc()).show()
```

---

## 6) limit()

`limit()` returns the first N rows.

```python
df.limit(3).show()
```

---

### 6.1 Example: Top 3 highest salary employees

```python
df.orderBy(col("salary").desc()).limit(3).show()
```

---

## 7) Real Data Engineering Use Cases

### 7.1 Filter valid records (salary not null and > 0)

```python
df.filter(col("salary").isNotNull() & (col("salary") > 0)).show()
```

---

### 7.2 Filter only required departments

```python
valid_depts = ["IT", "HR"]
df.filter(col("dept").isin(valid_depts)).show()
```

---

### 7.3 Find top 5 latest records (example concept)

```python
df.orderBy(col("id").desc()).limit(5).show()
```

---

## 8) Best Practices

✅ Always use `col()` for readability  
✅ Use brackets `( )` for each condition  
✅ Use `isin()` instead of multiple OR conditions  
✅ Use `between()` for clean range filters  
✅ Always sort before limit when you want top N  

---

## 9) Summary (Quick Notes)

- `filter()` and `where()` are same.
- Multiple conditions:
  - AND = `&`
  - OR = `|`
  - NOT = `~`
- `isin()` is used for multiple values.
- `between()` is used for range filtering.
- `orderBy()` and `sort()` are same.
- `limit()` returns first N rows.

---

✅ Next File: `07_null_handling.md`

