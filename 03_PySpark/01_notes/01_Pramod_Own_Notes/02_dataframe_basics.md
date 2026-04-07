# 02 - DataFrame Basics (PySpark)

This note covers the most important fundamentals of **PySpark DataFrames**:
- What is a DataFrame and why it is used
- How to create DataFrames from different sources
- Basic inspection functions
- Selecting and creating columns
- Dropping and renaming columns
- Using alias()

---

## 1) What is a DataFrame?
A **DataFrame** in Spark is a **distributed table-like data structure** with:
- Rows and columns (like SQL table)
- A fixed schema (column names + data types)
- Data stored in partitions across executors

You can think of Spark DataFrame as:
- **SQL Table**
- **Pandas DataFrame (but distributed)**

---

## 2) Why DataFrame is Used in Spark?
Spark DataFrames are the most used API in Data Engineering because:

✅ **Distributed processing**
- DataFrame works on cluster and can process huge datasets.

✅ **Optimized execution**
- Spark uses **Catalyst Optimizer** + **Tungsten Engine** to optimize queries automatically.

✅ **Easy SQL integration**
- You can run SQL queries directly on DataFrames.

✅ **Supports structured + semi-structured data**
- Works with JSON, nested schema, Parquet, Delta.

✅ **Industry standard**
- Most real projects use DataFrame API, not RDD.

---

## 3) Creating DataFrames in PySpark

To create DataFrames, you need SparkSession:

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("DataFrameBasics").getOrCreate()
```

---

### 3.1 Create DataFrame from List (List of Tuples)

```python
data = [
    (1, "Pramod", 24),
    (2, "Akash", 25),
    (3, "Rahul", 23)
]

columns = ["id", "name", "age"]

df = spark.createDataFrame(data, columns)
df.show()
```

---

### 3.2 Create DataFrame from List of Dictionaries

```python
data = [
    {"id": 1, "name": "Pramod", "age": 24},
    {"id": 2, "name": "Akash", "age": 25},
    {"id": 3, "name": "Rahul", "age": 23}
]

df = spark.createDataFrame(data)
df.show()
```

---

### 3.3 Create DataFrame from RDD

RDD is older API, but still useful to know for interviews.

```python
rdd = spark.sparkContext.parallelize([
    (1, "A", 1000),
    (2, "B", 2000),
    (3, "C", 3000)
])

df = spark.createDataFrame(rdd, ["id", "name", "salary"])
df.show()
```

---

### 3.4 Create DataFrame from File (CSV Example)

```python
df = spark.read.option("header", "true").option("inferSchema", "true").csv("data/employees.csv")
df.show()
```

Common formats Spark can read:
- CSV
- JSON
- Parquet
- ORC
- Delta (Databricks)

---

## 4) Basic DataFrame Inspection Functions

### 4.1 show()
Used to display rows.

```python
df.show()
df.show(5)
df.show(truncate=False)
```

---

### 4.2 printSchema()
Shows schema (column names + datatypes).

```python
df.printSchema()
```

Example output:
```
root
 |-- id: integer (nullable = true)
 |-- name: string (nullable = true)
 |-- age: integer (nullable = true)
```

---

### 4.3 describe()
Gives basic statistics for numeric columns.

```python
df.describe().show()
```

It shows:
- count
- mean
- stddev
- min
- max

---

## 5) Selecting Columns (select)

### 5.1 Select Single Column

```python
df.select("name").show()
```

---

### 5.2 Select Multiple Columns

```python
df.select("id", "name").show()
```

---

### 5.3 Select using col()
`col()` is preferred for complex expressions.

```python
from pyspark.sql.functions import col

df.select(col("id"), col("name")).show()
```

---

## 6) Creating / Modifying Columns (withColumn)

### 6.1 Create New Column

```python
from pyspark.sql.functions import col, lit

df2 = df.withColumn("country", lit("India"))
df2.show()
```

---

### 6.2 Modify Existing Column

```python
df2 = df.withColumn("age", col("age") + 1)
df2.show()
```

---

## 7) Drop Columns (drop)

### 7.1 Drop Single Column

```python
df2 = df.drop("age")
df2.show()
```

---

### 7.2 Drop Multiple Columns

```python
df2 = df.drop("age", "name")
df2.show()
```

---

## 8) alias() in PySpark

`alias()` is mainly used in:
- selecting columns with new names
- joins (to avoid confusion)
- SQL queries

---

### 8.1 alias() for DataFrame

```python
df_emp = df.alias("emp")
df_emp.select("emp.name").show()
```

---

### 8.2 alias() for Columns

```python
from pyspark.sql.functions import col

df.select(col("name").alias("employee_name")).show()
```

---

## 9) Rename Columns

### 9.1 Rename a Single Column (withColumnRenamed)

```python
df2 = df.withColumnRenamed("name", "employee_name")
df2.show()
```

---

### 9.2 Rename Multiple Columns (Best Method)

```python
df2 = df.withColumnRenamed("name", "employee_name").withColumnRenamed("age", "employee_age")
df2.show()
```

---

### 9.3 Rename All Columns (Using toDF)

```python
df2 = df.toDF("emp_id", "emp_name", "emp_age")
df2.show()
```

---

## 10) Summary (Quick Notes)

- Spark DataFrame is a distributed table with schema.
- DataFrames are optimized and faster than RDD.
- You can create DataFrames from list, dict, RDD, and files.
- Important functions:
  - show()
  - printSchema()
  - describe()
  - select()
  - withColumn()
  - drop()
  - alias()
  - withColumnRenamed()

---


