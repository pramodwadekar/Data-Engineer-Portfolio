# 01 - PySpark Core Concepts (Interview Questions)

This file contains **PySpark core interview questions** from **Basic → Advanced**.

Use this for:
- Data Engineer interviews
- Databricks Data Engineer interviews
- PySpark Developer interviews

---

## 1) What is Apache Spark?
**Answer:**
Apache Spark is a distributed computing engine used for large-scale data processing.
It supports:
- batch processing
- streaming
- SQL
- ML workloads

Spark is fast because it uses:
- in-memory processing
- optimized execution engine

---

## 2) Why Spark is used in Data Engineering?
**Answer:**
Because Spark can process:
- huge datasets (TB/PB)
- distributed across multiple nodes
- faster than Hadoop MapReduce

Spark is used for:
- ETL pipelines
- data transformations
- aggregations
- joins
- streaming pipelines

---

## 3) Spark vs Hadoop MapReduce
**Answer:**
| Spark | Hadoop MapReduce |
|------|-------------------|
| In-memory | Disk-based |
| Faster | Slower |
| Supports SQL/Streaming/ML | Only batch |
| Easy APIs | Harder |

---

## 4) What are Spark components?
**Answer:**
- **Driver**: runs main program, creates SparkContext, schedules jobs
- **Executor**: runs tasks, stores cache
- **Cluster Manager**: allocates resources (YARN/K8s/Standalone/Databricks)

---

## 5) What is SparkSession?
**Answer:**
SparkSession is the entry point for Spark SQL and DataFrames.

Example:
```python
from pyspark.sql import SparkSession
spark = SparkSession.builder.appName("DE").getOrCreate()
```

---

## 6) What is SparkContext?
**Answer:**
SparkContext is the lower-level entry point used mainly for RDDs.

In modern Spark:
- SparkSession internally manages SparkContext.

---

## 7) What is RDD?
**Answer:**
RDD = Resilient Distributed Dataset  
It is Spark’s original distributed data structure.

Features:
- immutable
- distributed
- fault-tolerant (lineage)

---

## 8) RDD vs DataFrame
**Answer:**
| RDD | DataFrame |
|-----|----------|
| low-level | high-level |
| no optimizer | uses Catalyst optimizer |
| slower | faster |
| more code | less code |
| mostly for interviews | used in real projects |

---

## 9) DataFrame vs Dataset
**Answer:**
- Dataset is mainly used in Scala/Java (type-safe)
- PySpark does not have Dataset like Scala.

---

## 10) What is lazy evaluation?
**Answer:**
Spark does not execute transformations immediately.
It builds a logical plan (DAG) and runs only when an **action** is called.

Example:
```python
df2 = df.filter("salary > 50000")  # no execution yet
df2.count()  # execution happens here
```

---

## 11) What is DAG in Spark?
**Answer:**
DAG = Directed Acyclic Graph  
Spark builds DAG of transformations and breaks it into:
- Jobs
- Stages
- Tasks

---

## 12) What is a Job, Stage, Task?
**Answer:**
- **Job**: created when action is called
- **Stage**: group of tasks separated by shuffle boundaries
- **Task**: smallest unit of work, runs on executor

---

## 13) What is shuffle?
**Answer:**
Shuffle is data movement across executors/nodes.

Shuffle happens in:
- groupBy
- join
- distinct
- orderBy

Shuffle is expensive because it:
- writes to disk
- transfers over network

---

## 14) Narrow vs Wide transformations
**Answer:**
### Narrow
- data does not move across partitions
- faster

Examples:
- select
- filter
- withColumn

### Wide
- data moves across partitions (shuffle)
- slower

Examples:
- groupBy
- join
- distinct

---

## 15) What is partition in Spark?
**Answer:**
Partition is a chunk of data.

Spark processes partitions in parallel.

---

## 16) How Spark achieves fault tolerance?
**Answer:**
Spark uses **lineage**.
If a partition is lost, Spark recomputes it from transformations.

---

## 17) What is Catalyst Optimizer?
**Answer:**
Catalyst is Spark SQL optimizer that:
- optimizes logical plan
- applies rule-based optimizations
- chooses best execution plan

---

## 18) What is Tungsten?
**Answer:**
Tungsten is Spark execution engine improvement that focuses on:
- memory management
- CPU efficiency
- code generation

---

## 19) What is AQE?
**Answer:**
AQE = Adaptive Query Execution  
Spark optimizes query during runtime:
- adjusts shuffle partitions
- handles skew joins
- changes join strategy

---

## 20) Interview Tip (How to Answer)
When asked Spark questions, always mention:
- distributed processing
- partitions
- shuffle
- driver/executor
- Catalyst + Tungsten

---

## ⭐ Quick Revision (One-Liners)
- Spark is distributed engine for big data.
- SparkSession is entry point.
- DataFrame is optimized with Catalyst.
- Shuffle is expensive.
- Wide transformations cause shuffle.
- Actions trigger execution.

---

✅ Next file: `02_dataframe_api_questions.md`
