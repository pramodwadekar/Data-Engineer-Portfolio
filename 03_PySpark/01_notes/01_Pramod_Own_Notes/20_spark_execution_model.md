# 20 - Spark Execution Model (PySpark)

This note covers Spark execution model:
- DAG
- Job, Stage, Task
- Narrow vs Wide transformations
- Shuffle meaning
- DAG scheduling
- Shuffle boundaries

This is a very important topic for:
✅ interviews  
✅ performance tuning  
✅ understanding Spark UI  

---

## 1) DAG (Directed Acyclic Graph)

Spark builds a DAG for every Spark job.

DAG shows:
- transformations sequence
- dependencies between operations
- shuffle boundaries

Spark uses DAG scheduler to optimize execution.

---

## 2) Spark Execution Flow (High Level)

1. You write DataFrame code
2. Spark creates logical plan
3. Catalyst optimizer optimizes plan
4. Spark creates physical plan
5. DAG scheduler breaks into stages
6. Task scheduler sends tasks to executors
7. Executors run tasks on partitions

---

## 3) Job, Stage, Task

### 3.1 Job
A **Job** is created when an action is called.

Example actions:
- show()
- count()
- write()

Each action triggers one job.

---

### 3.2 Stage
A **Stage** is a set of tasks that can run without shuffle.

Spark divides job into stages based on shuffle boundaries.

---

### 3.3 Task
A **Task** is the smallest unit of execution.

- Each task works on one partition.
- Tasks run in parallel across executors.

---

## 4) Narrow vs Wide Transformations

### 4.1 Narrow Transformations
Narrow transformation means:
- each output partition depends on only one input partition
- no shuffle needed

Examples:
- select()
- filter()
- withColumn()
- map() (RDD)
- union()

Narrow transformations are fast.

---

### 4.2 Wide Transformations
Wide transformation means:
- output partition depends on multiple input partitions
- shuffle is required

Examples:
- groupBy()
- join()
- distinct()
- orderBy()
- repartition()

Wide transformations are expensive.

---

## 5) Shuffle Meaning

Shuffle is data movement between executors.

Shuffle happens when:
- Spark needs to regroup data
- Spark needs to sort/group/join by key

Shuffle is expensive because:
- network transfer
- disk spill
- memory usage

---

## 6) Shuffle Boundaries (Stage Boundaries)

Stage boundaries occur when shuffle happens.

Example:

```python
df2 = df.filter(col("salary") > 50000)         .groupBy("dept")         .count()
```

- filter() = narrow (no shuffle)
- groupBy() = wide (shuffle happens)

So Spark creates:
- Stage 1: filter
- Stage 2: groupBy + aggregation

---

## 7) DAG Scheduling

Spark uses:
- DAG Scheduler
- Task Scheduler

### 7.1 DAG Scheduler
- breaks job into stages
- identifies shuffle boundaries
- builds stage dependency graph

### 7.2 Task Scheduler
- sends tasks to executors
- manages task retries and failures

---

## 8) Example Execution (Job → Stage → Task)

If a DataFrame has 8 partitions:
- Stage 1 will have 8 tasks
- Stage 2 will also have tasks based on shuffle partitions

Example:
- spark.sql.shuffle.partitions = 50
Then shuffle stage will create 50 tasks.

---

## 9) Spark UI (Important)
Spark UI helps you see:
- Jobs
- Stages
- Tasks
- Shuffle read/write
- Storage (cache)

In Databricks, Spark UI is available in:
- Cluster → Spark UI
- Notebook job runs

---

## 10) Summary (Quick Notes)

- DAG represents transformation plan.
- Job is created by an action.
- Stage is created by shuffle boundaries.
- Task is created per partition.
- Narrow transformations do not shuffle.
- Wide transformations cause shuffle.
- Shuffle is expensive and should be optimized.
- DAG scheduler and task scheduler manage execution.

---

✅ Next File: `21_data_skew.md`
