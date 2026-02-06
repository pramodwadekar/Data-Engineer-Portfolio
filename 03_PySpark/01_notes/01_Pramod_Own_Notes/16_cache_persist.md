# 16 - Caching & Persistence (PySpark)

This note covers:
- cache()
- persist()
- unpersist()
- when to use caching
- memory vs disk

Caching is one of the most important performance techniques in Spark.

---

## 1) Why Cache/Persist is Needed?
Spark uses **lazy evaluation**.

So every time you run an action like:
- count()
- show()
- collect()
- write()

Spark recomputes the full DAG again.

Caching helps to:
✅ avoid recomputation  
✅ speed up pipelines  
✅ reduce cluster cost  

---

## 2) cache()

### 2.1 What is cache()?
`cache()` stores DataFrame in memory (and disk if needed).

Internally it uses:

```python
persist(StorageLevel.MEMORY_AND_DISK)
```

---

### 2.2 Example

```python
df_cached = df.cache()

df_cached.count()   # triggers caching
df_cached.show()    # fast (no recompute)
```

⚠️ Note:
Cache happens only after an action is executed.

---

## 3) persist()

### 3.1 What is persist()?
`persist()` is used to store DataFrame with a specific storage level.

```python
from pyspark import StorageLevel

df_persisted = df.persist(StorageLevel.MEMORY_ONLY)
```

---

### 3.2 Common Persist Levels

```python
from pyspark import StorageLevel

StorageLevel.MEMORY_ONLY
StorageLevel.MEMORY_AND_DISK
StorageLevel.DISK_ONLY
StorageLevel.MEMORY_ONLY_SER
StorageLevel.MEMORY_AND_DISK_SER
```

---

## 4) unpersist()

### 4.1 Why unpersist?
If you don’t unpersist:
- memory remains occupied
- future jobs can fail due to memory pressure

---

### 4.2 Example

```python
df_cached.unpersist()
```

---

## 5) When to Use Caching (Real DE Work)

Use cache/persist when:
✅ DataFrame is reused multiple times  
✅ same transformations are used in multiple actions  
✅ multiple joins use same intermediate table  
✅ iterative ML algorithms (rare in DE)  

---

### 5.1 Example Use Case

```python
df_clean = df.filter(col("salary").isNotNull())

df_clean.cache()

df_clean.count()
df_clean.groupBy("dept").count().show()
df_clean.groupBy("dept").avg("salary").show()
```

Without caching:
- df_clean will be recomputed multiple times.

---

## 6) When NOT to Use Caching
Avoid caching when:
❌ DataFrame is used only once  
❌ DataFrame is extremely large and cannot fit memory  
❌ You are writing directly after transformation (single action)  

---

## 7) Memory vs Disk (Important)

### 7.1 MEMORY_ONLY
- fastest
- fails if not enough memory (recompute happens)

### 7.2 MEMORY_AND_DISK
- stores in memory
- if memory not enough → spills to disk

### 7.3 DISK_ONLY
- slow
- but safe for huge datasets

---

## 8) cache() vs persist()

| Feature | cache() | persist() |
|--------|---------|-----------|
| Storage level | fixed | configurable |
| Default | MEMORY_AND_DISK | depends on input |
| Best use | quick caching | fine tuning |

---

## 9) Best Practices

✅ Cache only if reused  
✅ Always unpersist after use  
✅ Prefer MEMORY_AND_DISK for large data  
✅ Monitor storage in Spark UI  
✅ Don’t cache huge raw tables unnecessarily  

---

## 10) Summary (Quick Notes)

- cache() stores DataFrame for reuse.
- persist() stores with specific storage level.
- unpersist() removes cached DataFrame.
- caching improves performance by avoiding recomputation.
- choose memory vs disk based on dataset size.

---

✅ Next File: `17_spark_sql.md`
