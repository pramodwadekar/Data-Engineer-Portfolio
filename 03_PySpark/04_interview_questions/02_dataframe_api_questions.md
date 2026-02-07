# 02 - DataFrame API Interview Questions (PySpark)

This file covers the most asked **DataFrame API** questions.

---

## 1) What is a DataFrame in Spark?
**Answer:**
A DataFrame is a distributed table-like structure with:
- rows and columns
- schema (column names + types)

Spark DataFrames are optimized by Catalyst.

---

## 2) Why DataFrame is preferred over RDD?
**Answer:**
Because DataFrame:
- is faster
- uses Catalyst optimizer
- uses Tungsten
- has SQL support
- less code

---

## 3) How to create DataFrame in PySpark?
**Answer:**
Common ways:
1) list of tuples
2) list of dict
3) pandas DataFrame
4) RDD
5) reading file (CSV/JSON/Parquet)

Example:
```python
df = spark.createDataFrame([(1,"A"),(2,"B")], ["id","name"])
```

---

## 4) Difference between select() and withColumn()
**Answer:**
- `select()` chooses columns (projection)
- `withColumn()` creates/updates a column

Example:
```python
df.select("id","name")
df.withColumn("salary2", col("salary")*2)
```

---

## 5) What is the difference between drop() and dropDuplicates()?
**Answer:**
- drop(): removes columns
- dropDuplicates(): removes duplicate rows

---

## 6) How to rename columns?
**Answer:**
1) withColumnRenamed
```python
df = df.withColumnRenamed("old","new")
```

2) selectExpr
```python
df.selectExpr("old as new")
```

---

## 7) What is alias() used for?
**Answer:**
- rename a column temporarily
- used in joins/aggregations

Example:
```python
df.select(col("salary").alias("emp_salary"))
```

---

## 8) How to filter data in PySpark?
**Answer:**
Use:
- filter()
- where()

Example:
```python
df.filter(col("salary") > 50000)
df.where("salary > 50000")
```

---

## 9) How to apply multiple conditions?
**Answer:**
Use `&` and `|` with parentheses.

```python
df.filter((col("salary")>50000) & (col("dept")=="IT"))
```

---

## 10) Difference between isNull() and == None?
**Answer:**
Use `isNull()` / `isNotNull()`.

Correct:
```python
df.filter(col("salary").isNull())
```

---

## 11) What is cache() and persist()?
**Answer:**
- cache() stores DataFrame in memory (default)
- persist() stores with custom level (memory/disk)

Used when same DF is reused multiple times.

---

## 12) What is repartition()?
**Answer:**
repartition() increases/decreases partitions with shuffle.

Used for:
- parallelism
- before joins

---

## 13) What is coalesce()?
**Answer:**
coalesce() reduces partitions without shuffle (faster).

Used before writing to reduce small files.

---

## 14) What is explain()?
**Answer:**
It shows Spark execution plan.

```python
df.explain()
df.explain("formatted")
```

---

## 15) How to check schema?
**Answer:**
```python
df.printSchema()
```

---

## 16) How to see summary stats?
**Answer:**
```python
df.describe().show()
```

---

## 17) Difference between collect() and show()?
**Answer:**
- show(): prints sample rows (safe)
- collect(): brings all rows to driver (dangerous)

---

## 18) When collect() is dangerous?
**Answer:**
When dataset is big → driver OOM (out of memory).

---

## 19) How to get number of partitions?
**Answer:**
```python
df.rdd.getNumPartitions()
```

---

## 20) How to change shuffle partitions?
**Answer:**
```python
spark.conf.set("spark.sql.shuffle.partitions", "50")
```

---

## ⭐ Quick Revision
- DataFrame = distributed table
- withColumn modifies/creates
- filter/where same
- collect is risky
- cache improves reuse

---

✅ Next file: `03_read_write_formats_questions.md`
