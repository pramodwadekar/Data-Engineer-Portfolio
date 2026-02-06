# 14 - Repartition, Coalesce, Partitioning (PySpark)

This note covers:
- What is partition?
- repartition()
- coalesce()
- shuffle meaning
- shuffle partitions
- partitionBy while writing
- best practices

Partitioning is one of the most important topics for:
✅ performance  
✅ cost optimization  
✅ real Data Engineering work  
✅ interviews  

---

## 1) What is a Partition in Spark?
A partition is a **chunk of data** inside a DataFrame.

Spark stores DataFrame data as multiple partitions.

Example:
- 1 TB data is split into many partitions
- each executor processes some partitions in parallel

More partitions = more parallelism  
But too many partitions = overhead

---

## 2) Why Partitioning Matters?
Partitioning impacts:
- performance of joins
- performance of groupBy
- shuffle cost
- file size and number of output files
- cluster resource usage

---

## 3) Check Number of Partitions

```python
df.rdd.getNumPartitions()
```

---

## 4) repartition()

### 4.1 What is repartition()?
`repartition()` increases or decreases partitions.

⚠️ It always causes a **full shuffle**.

---

### 4.2 Example: Increase partitions

```python
df2 = df.repartition(10)
print(df2.rdd.getNumPartitions())
```

---

### 4.3 Example: Repartition by column
Used to distribute data by key (very common before join).

```python
df3 = df.repartition(10, "dept")
```

This helps for:
- joins on dept
- aggregations by dept

---

## 5) coalesce()

### 5.1 What is coalesce()?
`coalesce()` reduces number of partitions without full shuffle.

It is used when:
- you want fewer output files
- you want to reduce partitions after filtering

---

### 5.2 Example: Reduce partitions

```python
df2 = df.coalesce(2)
print(df2.rdd.getNumPartitions())
```

---

### 5.3 coalesce() vs repartition()

| Feature | repartition() | coalesce() |
|--------|---------------|------------|
| Can increase partitions | Yes | No |
| Can decrease partitions | Yes | Yes |
| Shuffle | Always | Usually no |
| Performance | Slower | Faster |
| Best use | balancing, join | reduce files |

---

## 6) What is Shuffle?
Shuffle means:
- Spark moves data between executors

Shuffle happens in:
- groupBy
- join
- distinct
- orderBy

Shuffle is expensive because:
- network transfer
- disk spill
- memory usage

---

## 7) Shuffle Partitions (spark.sql.shuffle.partitions)

Default value = 200

```python
spark.conf.get("spark.sql.shuffle.partitions")
```

Change it:

```python
spark.conf.set("spark.sql.shuffle.partitions", "50")
```

Best practice:
- Small dataset: 10–50
- Large dataset: depends on cluster size

---

## 8) partitionBy while Writing (Most Used in DE)

Partitioning output improves query performance.

Example: write Parquet partitioned by dept

```python
df.write     .mode("overwrite")     .partitionBy("dept")     .parquet("output/employees_partitioned")
```

Folder structure:

```
employees_partitioned/
  dept=IT/
  dept=HR/
  dept=Finance/
```

---

## 9) Real Use Case Example

### 9.1 After big join, reduce partitions for output

```python
df_final = df_joined.coalesce(4)

df_final.write     .mode("overwrite")     .parquet("output/final_table")
```

This prevents:
- too many small files

---

## 10) Best Practices (Production Level)

✅ Use `repartition(col)` before heavy joins/aggregations  
✅ Use `coalesce()` before writing output to reduce small files  
✅ Avoid too many partitions (overhead)  
✅ Avoid too few partitions (low parallelism)  
✅ Tune `spark.sql.shuffle.partitions`  
✅ Partition output tables by common filter columns (date, region, dept)  
✅ Prefer partitionBy on low-cardinality columns  
⚠️ Don’t partition by high-cardinality columns (like user_id)  

---

## 11) Summary (Quick Notes)

- Partition = chunk of data processed in parallel.
- `repartition()` always shuffles and can increase/decrease partitions.
- `coalesce()` reduces partitions with less shuffle.
- Shuffle is expensive and happens in join/groupBy/sort.
- `spark.sql.shuffle.partitions` controls shuffle partitions.
- `partitionBy()` while writing creates folder partitions.
- Proper partitioning improves performance and reduces cost.

---

✅ Next File: `15_performance_tuning.md`
