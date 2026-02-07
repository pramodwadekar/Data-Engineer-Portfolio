# 11 - Execution Plan, DAG, Job/Stage/Task (Interview Questions)

This file covers Spark execution internals (very important for senior interviews).

---

## 1) What happens when you run df.show()?
**Answer:**
- `show()` is an **action**
- Spark builds a DAG from transformations
- Spark creates a Job → Stages → Tasks
- Executors run tasks and return results to driver

---

## 2) What is an Execution Plan in Spark?
**Answer:**
Execution plan is how Spark will execute your query.

Spark has:
- Logical Plan (unoptimized)
- Optimized Logical Plan (Catalyst optimized)
- Physical Plan (actual execution)

---

## 3) How to view execution plan?
**Answer:**
```python
df.explain()
df.explain("formatted")
```

---

## 4) What is a DAG?
**Answer:**
DAG = Directed Acyclic Graph  
It represents the sequence of transformations.

Spark converts DAG into stages and tasks.

---

## 5) What is a Spark Job?
**Answer:**
A Job is triggered by an action.

Actions:
- count
- collect
- show
- write
- take

---

## 6) What is a Spark Stage?
**Answer:**
A stage is a set of tasks that can be executed without shuffle.

Stages are separated by shuffle boundaries.

---

## 7) What is a Spark Task?
**Answer:**
Task is the smallest unit of work.
It processes one partition.

---

## 8) Narrow vs Wide transformation (execution view)
**Answer:**
- Narrow transformations stay in same stage
- Wide transformations create shuffle → new stage

---

## 9) What are shuffle boundaries?
**Answer:**
Operations that cause shuffle:
- groupBy
- join (big-big)
- distinct
- orderBy
- repartition

---

## 10) How many tasks are created in a stage?
**Answer:**
Number of tasks = number of partitions in that stage.

---

## 11) What is Spark UI and why used?
**Answer:**
Spark UI shows:
- Jobs, Stages, Tasks
- shuffle read/write
- skew
- executor memory usage
- SQL execution details

---

## 12) What is query plan: BroadcastHashJoin vs SortMergeJoin?
**Answer:**
- BroadcastHashJoin: small table broadcasted (fast)
- SortMergeJoin: both tables sorted and shuffled (slow)

---

## 13) What is WholeStageCodegen?
**Answer:**
Spark generates optimized JVM bytecode for execution.
It improves performance.

---

## 14) What is predicate pushdown?
**Answer:**
Filter conditions are pushed down to storage layer.
Parquet/Delta supports it.

Example:
Only required row groups are read.

---

## 15) What is partition pruning?
**Answer:**
Spark reads only required partitions if filtering on partition column.

---

## 16) What is file pruning?
**Answer:**
Spark skips files based on min/max stats (Delta + Parquet).

---

## 17) What is spill and how to detect?
**Answer:**
Spill happens when memory is insufficient and Spark writes intermediate data to disk.

Detect using:
- Spark UI
- metrics (spill size)

---

## 18) What is shuffle read/write?
**Answer:**
- shuffle write: data written during shuffle
- shuffle read: data read from shuffle partitions

Large shuffle = slow job.

---

## 19) Real Interview Scenario
**Question:**
Your Spark job has 10 stages. Why?

**Answer:**
Because your transformations include multiple shuffle operations.
Each shuffle creates a stage boundary.

---

## 20) Best answer pattern
When asked about Spark internals, always mention:
- partitions
- shuffle boundaries
- job/stage/task
- explain plan
- Spark UI

---

## ⭐ Quick Revision
- actions create jobs
- shuffle creates stages
- tasks = partitions
- explain() shows physical plan

---

✅ Next: `12_delta_lake_questions.md`
