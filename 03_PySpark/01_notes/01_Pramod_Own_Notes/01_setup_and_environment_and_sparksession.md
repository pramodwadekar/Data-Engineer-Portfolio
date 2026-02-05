
# 01 - Setup and Environment (PySpark)

This note covers how to install PySpark, create a SparkSession, understand Spark execution modes, and learn basic Spark configurations.

---

## 1) Install PySpark

### 1.1 Install using pip (Local Machine)

```bash
pip install pyspark
```

To check installation:

```bash
python -c "import pyspark; print(pyspark.__version__)"
```

---

### 1.2 Install Java (Mandatory for Local Spark)

Spark runs on JVM, so Java is required.

Check Java:

```bash
java -version
```

Recommended:
- Java 8 or Java 11 (most stable for Spark)

---

### 1.3 Install in Databricks (No Installation Needed)

In Databricks:
- Spark is already installed
- Cluster provides SparkSession automatically
- You just start coding

---

## 2) Creating SparkSession

### 2.1 SparkSession (Most Important Object)

SparkSession is the entry point for Spark SQL and DataFrame API.

Example:

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("PySparkSetup") \
    .getOrCreate()
```

---

### 2.2 Verify SparkSession

```python
spark
```

Check Spark version:

```python
spark.version
```

---

### 2.3 Stop SparkSession (Local)

When running locally, stop Spark after work:

```python
spark.stop()
```

---

## 3) Local Mode vs Cluster Mode

Spark can run in different modes depending on where the executors run.

---

### 3.1 Local Mode

In local mode:
- Spark runs on your laptop/PC
- Driver and executors run on the same machine
- Used for learning, small datasets, testing

Example:

```python
spark = SparkSession.builder \
    .master("local[*]") \
    .appName("LocalMode") \
    .getOrCreate()
```

`local[*]` means:
- Use all CPU cores available on your machine

---

### 3.2 Cluster Mode

In cluster mode:
- Spark runs on multiple machines (nodes)
- Data and computation are distributed
- Used in real company projects

Cluster managers:
- YARN
- Kubernetes
- Standalone Spark
- Databricks managed cluster

---

## 4) Databricks vs Local PySpark

### 4.1 Local PySpark

✅ Best for:
- Learning basics
- Running small examples
- Interview practice

❌ Limitations:
- No real cluster
- Limited memory/CPU
- No Delta Lake optimization features by default
- Hard to simulate real enterprise pipeline

---

### 4.2 Databricks

✅ Best for:
- Real Data Engineering pipelines
- Delta Lake
- Production-grade ETL
- Big datasets
- Collaboration (notebooks)
- Job scheduling + workflow orchestration

Databricks provides:
- Spark cluster
- Delta Lake
- Unity Catalog (governance)
- Job scheduler
- Auto scaling

---

## 5) Basic Spark Configurations (Must Know)

Spark configs control memory, performance, and partitioning.

---

### 5.1 Executor Memory

Executors run the tasks, so memory is critical.

Example:

```python
spark = SparkSession.builder \
    .appName("SparkConfig") \
    .config("spark.executor.memory", "4g") \
    .getOrCreate()
```

Meaning:
- Each executor gets 4 GB memory

---

### 5.2 Executor Cores

```python
spark = SparkSession.builder \
    .appName("SparkConfig") \
    .config("spark.executor.cores", "2") \
    .getOrCreate()
```

Meaning:
- Each executor uses 2 CPU cores

---

### 5.3 Driver Memory

Driver runs your main program.

```python
spark = SparkSession.builder \
    .appName("SparkConfig") \
    .config("spark.driver.memory", "2g") \
    .getOrCreate()
```

Meaning:
- Driver gets 2 GB memory

---

### 5.4 Shuffle Partitions (Very Important)

Default shuffle partitions = 200

When you do:
- groupBy()
- join()
- distinct()

Spark creates shuffle partitions.

Config:

```python
spark.conf.set("spark.sql.shuffle.partitions", "50")
```

Why important?
- Too many partitions → overhead, slow
- Too few partitions → low parallelism, slow

Best practice:
- For small data: reduce partitions (like 10–50)
- For large data: keep higher partitions

---

### 5.5 Adaptive Query Execution (AQE)

AQE improves performance automatically.

```python
spark.conf.set("spark.sql.adaptive.enabled", "true")
```

AQE can:
- Reduce shuffle partitions automatically
- Handle skew joins better
- Optimize join strategies

---

### 5.6 Broadcast Join Threshold

Spark can broadcast small tables automatically.

```python
spark.conf.set("spark.sql.autoBroadcastJoinThreshold", 10485760)
```

10485760 bytes = 10 MB

---

## 6) Recommended Setup for Learning

For learning (local):
- Use `local[*]`
- Keep shuffle partitions low
- Use small sample datasets

Example:

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .master("local[*]") \
    .appName("LearningPySpark") \
    .config("spark.sql.shuffle.partitions", "8") \
    .getOrCreate()
```

---

## 7) Summary (Quick Notes)

- PySpark requires Java for local setup.
- SparkSession is the entry point for DataFrames and SQL.
- Local mode is for learning, cluster mode is for production.
- Databricks is best for real DE work.

Important configs:
- spark.executor.memory
- spark.executor.cores
- spark.sql.shuffle.partitions
- spark.sql.adaptive.enabled
