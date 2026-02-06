# 01 - SparkSession Basics (PySpark Practical)

This practical covers:
- Creating SparkSession
- Checking Spark version
- SparkContext basics
- Running a simple DataFrame
- Stopping Spark session

---

## 1) Create SparkSession

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder     .appName("SparkSessionBasics")     .master("local[*]")     .getOrCreate()
```

---

## 2) Check Spark Version

```python
spark.version
```

---

## 3) Check SparkContext

```python
sc = spark.sparkContext
sc
```

---

## 4) Create a Simple DataFrame

```python
data = [
    (1, "Pramod", "IT", 50000),
    (2, "Akash", "HR", 60000),
    (3, "Rahul", "IT", 45000),
    (4, "Neha", "Finance", 70000)
]

df = spark.createDataFrame(data, ["id", "name", "dept", "salary"])
df.show()
```

---

## 5) Check DataFrame Schema

```python
df.printSchema()
```

---

## 6) Basic Action (count)

```python
df.count()
```

---

## 7) Stop SparkSession (Important for Local)

```python
spark.stop()
```

---

## ✅ Output Expectation

You should see:
- Spark version
- DataFrame displayed using show()
- Schema displayed using printSchema()

---

## ⭐ Real DE Note
In Databricks:
- SparkSession is already available as `spark`
- You do not need `.master("local[*]")`

---

