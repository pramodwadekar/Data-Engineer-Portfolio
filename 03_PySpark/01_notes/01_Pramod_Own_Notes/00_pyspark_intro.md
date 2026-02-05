# 00 - PySpark Introduction (Apache Spark Basics)

## 1) What is Apache Spark?
**Apache Spark** is an **open-source distributed data processing framework** used to process **large-scale data** efficiently.

It is designed for:
- **Big Data processing**
- **Fast batch processing**
- **Streaming**
- **Machine Learning**
- **SQL analytics**
- **ETL pipelines**

Spark works by distributing the data and computation across multiple machines (cluster) and processing it in parallel.

---

## 2) Why Spark for Data Engineering?
In Data Engineering, we deal with:
- Huge datasets (GBs → TBs → PBs)
- ETL pipelines
- Data cleaning and transformation
- Joining multiple large datasets
- Writing output into Data Lake / Data Warehouse

Spark is widely used because it:
✅ Handles big data easily  
✅ Runs transformations fast using parallel processing  
✅ Works with many file formats (CSV, JSON, Parquet, Delta)  
✅ Integrates with cloud platforms (Azure, AWS, GCP)  
✅ Is the backbone of Databricks  

---

## 3) Why Spark Over Pandas?
Pandas is very powerful but it is **not suitable for big data**.

### Pandas limitations:
- Runs on **single machine**
- Uses **single CPU / limited parallelism**
- Data must fit into **RAM**
- Slow for huge joins and aggregations

### Spark advantages:
- Runs on **cluster**
- Distributed computation
- Handles data that is bigger than RAM
- Optimized execution engine (Catalyst + Tungsten)

---

## 4) Spark vs Pandas (Comparison Table)

| Feature | Pandas | Spark |
|--------|--------|-------|
| Execution | Single machine | Distributed cluster |
| Data size | MB to few GB | GB to PB |
| Speed for big data | Slow | Fast |
| Memory | Needs RAM | Distributed memory |
| Parallelism | Limited | Massive |
| Fault tolerance | No | Yes |
| Best use | Small datasets, analysis | Big data ETL, pipelines |

---

## 5) Spark Components (Driver, Executor, Cluster Manager)

### 5.1 Driver
The **Driver** is the main program that:
- Runs your Spark code
- Creates SparkSession
- Builds execution plan (DAG)
- Sends tasks to executors
- Collects results

👉 Think of Driver as the **brain**.

---

### 5.2 Executor
Executors are the worker processes that:
- Run the tasks assigned by Driver
- Process data partitions
- Perform transformations
- Store cached data

👉 Think of Executors as **workers**.

---

### 5.3 Cluster Manager
Cluster Manager is responsible for:
- Allocating resources (CPU, RAM)
- Managing the cluster
- Launching executors

Spark supports:
- Standalone
- YARN
- Mesos
- Kubernetes

---

## 6) Spark vs Hadoop
Apache Hadoop is also a Big Data framework, but Spark is much faster and more flexible.

### Hadoop (MapReduce)
- Disk-based processing
- Slower
- Mainly batch processing
- MapReduce programming model

### Spark
- In-memory processing
- Faster (especially iterative workloads)
- Supports batch + streaming + ML + SQL
- More developer-friendly

---

## 7) Spark Architecture (High Level)
Spark works using a distributed architecture.

### Flow:
1. You write Spark code using PySpark
2. Driver creates an execution plan (DAG)
3. Driver requests resources from Cluster Manager
4. Cluster Manager starts executors
5. Executors run tasks on partitions
6. Results are returned or written to storage

---

## 8) Spark in Data Engineering (Real Use Cases)

### 8.1 ETL Pipelines
Spark is used to:
- Read raw data from Data Lake
- Clean and transform data
- Join datasets
- Write clean data into curated zone

Example:
- Bronze → Silver → Gold (Delta Lake architecture)

---

### 8.2 Data Lake Processing
Spark can process:
- Parquet
- Delta
- ORC
- JSON
- CSV

It is the most common engine for Data Lake processing.

---

### 8.3 Incremental Loads
Spark + Delta Lake supports:
- MERGE INTO (Upserts)
- CDC pipelines
- Slowly Changing Dimensions (SCD)

---

### 8.4 Big Joins + Aggregations
Spark is heavily used for:
- Joining huge datasets
- GroupBy aggregations
- Window functions (latest record, top N per group)

---

### 8.5 Streaming Pipelines
Spark Structured Streaming is used for:
- Real-time data pipelines
- Kafka → Spark → Delta/Warehouse
- Near real-time dashboards

---

## 9) Summary (Quick Notes)
- Spark is built for big data processing.
- Pandas is best for small data; Spark is best for large data.
- Spark uses Driver + Executors + Cluster Manager.
- Spark is faster than Hadoop MapReduce.
- Spark is widely used in Data Engineering pipelines.

---

