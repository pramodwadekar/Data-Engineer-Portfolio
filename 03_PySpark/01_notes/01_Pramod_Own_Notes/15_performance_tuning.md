# 15 - Spark Performance Tuning (PySpark) (Very Important)

This note covers the most important Spark performance topics:
- Catalyst Optimizer
- Tungsten Engine
- Shuffle and shuffle optimization
- caching strategies
- Broadcast join
- Cache vs Persist levels
- Adaptive Query Execution (AQE)
- explain(), explain("formatted")

Performance tuning is what separates a beginner from a real Data Engineer.

---

## 1) Why Spark Performance Tuning Matters?
In real projects:
- Data is huge (GB/TB)
- Joins and groupBy are expensive
- Poor tuning increases:
  - runtime
  - cluster cost
  - failures (OOM)
  - shuffle spill to disk

---

## 2) Catalyst Optimizer

### 2.1 What is Catalyst Optimizer?
Catalyst is Spark SQL’s query optimizer.

It automatically optimizes:
- DataFrame API code
- Spark SQL queries

Catalyst creates an optimized execution plan.

---

### 2.2 What Catalyst does
Catalyst performs optimizations like:
- predicate pushdown (filter early)
- column pruning (read only required columns)
- constant folding
- join reordering
- choosing join strategies

---

## 3) Tungsten Engine

### 3.1 What is Tungsten?
Tungsten is Spark’s execution engine focused on:
- memory efficiency
- CPU efficiency
- faster execution

---

### 3.2 Tungsten benefits
- uses off-heap memory
- uses optimized binary format
- generates bytecode for execution (whole-stage codegen)

---

## 4) Shuffle (Most Important Performance Killer)

### 4.1 What is Shuffle?
Shuffle means Spark moves data between executors.

Shuffle happens in:
- join()
- groupBy()
- distinct()
- orderBy()
- repartition()

---

### 4.2 Why shuffle is expensive?
Because it involves:
- network transfer
- disk spill
- serialization/deserialization
- heavy memory usage

---

## 5) Shuffle Optimization

### 5.1 Reduce shuffle partitions
Default shuffle partitions = 200

```python
spark.conf.get("spark.sql.shuffle.partitions")
```

Change:

```python
spark.conf.set("spark.sql.shuffle.partitions", "50")
```

Best practice:
- small data → 10–50
- big data → depends on cluster size

---

### 5.2 Avoid unnecessary wide transformations
Wide transformations cause shuffle:
- groupBy
- join
- distinct
- orderBy

Try to:
- filter early
- select only required columns

---

### 5.3 Use partitioning wisely
Repartition by join key before big join:

```python
df1 = df1.repartition("dept_id")
df2 = df2.repartition("dept_id")
df_join = df1.join(df2, "dept_id")
```

---

## 6) Caching Strategies (High Impact)

Caching is useful when:
- same DataFrame is reused multiple times
- repeated actions are executed

Example:

```python
df.cache()
df.count()
df.show()
```

Without caching:
- Spark recomputes DAG again and again.

---

## 7) Broadcast Join (Very Important)

### 7.1 What is Broadcast Join?
Broadcast join sends small table to all executors.

This avoids shuffle.

---

### 7.2 When to use?
Use when:
- one table is small (dimension table)
- other table is huge (fact table)

Example:

```python
from pyspark.sql.functions import broadcast

df_join = big_df.join(broadcast(small_df), "key", "left")
```

---

## 8) Cache vs Persist Levels

### 8.1 cache()
`cache()` is same as:

```python
persist(StorageLevel.MEMORY_AND_DISK)
```

---

### 8.2 persist()
Persist gives control over storage level.

```python
from pyspark import StorageLevel

df.persist(StorageLevel.MEMORY_ONLY)
```

---

### 8.3 Persist Levels
Common levels:

- `MEMORY_ONLY`
- `MEMORY_AND_DISK`
- `DISK_ONLY`
- `MEMORY_ONLY_SER`
- `MEMORY_AND_DISK_SER`

---

## 9) Adaptive Query Execution (AQE)

### 9.1 What is AQE?
AQE is Spark feature that optimizes query at runtime.

Enable AQE:

```python
spark.conf.set("spark.sql.adaptive.enabled", "true")
```

---

### 9.2 AQE can do:
- optimize join strategies dynamically
- reduce shuffle partitions automatically
- handle skew joins better

---

## 10) explain() and explain("formatted")

### 10.1 explain()
Shows Spark execution plan.

```python
df.explain()
```

---

### 10.2 explain("formatted")
More readable plan.

```python
df.explain("formatted")
```

---

## 11) Real Performance Best Practices (Production)

✅ Filter early (predicate pushdown)  
✅ Select only required columns (column pruning)  
✅ Avoid UDFs when possible  
✅ Broadcast small dimension tables  
✅ Tune shuffle partitions  
✅ Cache reused DataFrames  
✅ Use Parquet/Delta formats  
✅ Avoid too many small files  
✅ Use AQE in Spark 3+  

---

## 12) Summary (Quick Notes)

- Catalyst optimizes Spark SQL/DataFrame queries.
- Tungsten improves memory and CPU performance.
- Shuffle is the biggest cost in Spark.
- Broadcast join avoids shuffle for small tables.
- Cache/Persist improves repeated operations.
- AQE improves performance automatically.
- explain() helps you understand execution plan.

---

✅ Next File: `16_cache_persist.md`
