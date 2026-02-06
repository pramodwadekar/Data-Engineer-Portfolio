# 18 - RDD Basics (PySpark) (Only Interview)

This note covers RDD (Resilient Distributed Dataset):
- what is RDD
- transformations vs actions
- map, flatMap, reduceByKey
- when RDD is used (rare)
- why RDD is avoided now

RDD is an older Spark API.
In real Data Engineering, DataFrames are preferred.

But RDD is still asked in interviews.

---

## 1) What is RDD?
RDD = **Resilient Distributed Dataset**

It is the lowest-level distributed data structure in Spark.

RDD is:
- immutable
- distributed across partitions
- fault-tolerant (lineage based recovery)

---

## 2) Why RDD was Important?
RDD was Spark’s first core API.

It was used for:
- distributed computation
- custom transformations
- big data processing before DataFrames became mature

---

## 3) Why RDD is Avoided Now?
RDD is avoided because:

❌ No Catalyst optimizer  
❌ No Tungsten optimizations  
❌ Slower than DataFrame  
❌ No automatic query optimization  
❌ Harder to write and maintain  

DataFrames are:
✅ faster  
✅ easier  
✅ optimized  
✅ SQL friendly  

---

## 4) Transformations vs Actions (Core Concept)

### 4.1 Transformations
Transformations are lazy operations.
They create a new RDD but do not execute immediately.

Examples:
- map()
- flatMap()
- filter()
- distinct()
- reduceByKey()

---

### 4.2 Actions
Actions trigger execution.
They return result or write output.

Examples:
- collect()
- count()
- first()
- take()
- saveAsTextFile()

---

## 5) Creating RDD in PySpark

### 5.1 Create RDD from List

```python
rdd = spark.sparkContext.parallelize([1, 2, 3, 4, 5])
```

---

### 5.2 Create RDD from Text File

```python
rdd = spark.sparkContext.textFile("data/sample.txt")
```

---

## 6) map()

`map()` applies function to each element.

Example: multiply each number by 10

```python
rdd = spark.sparkContext.parallelize([1, 2, 3])

rdd2 = rdd.map(lambda x: x * 10)

print(rdd2.collect())
```

Output:
```
[10, 20, 30]
```

---

## 7) flatMap()

`flatMap()` is used when:
- one input produces multiple outputs

Example: split words

```python
rdd = spark.sparkContext.parallelize(["hello world", "spark pyspark"])

rdd2 = rdd.flatMap(lambda x: x.split(" "))

print(rdd2.collect())
```

Output:
```
['hello', 'world', 'spark', 'pyspark']
```

---

## 8) reduceByKey() (Most Important in RDD)

Used for key-value pair aggregations.

Example: word count

```python
rdd = spark.sparkContext.parallelize(["spark", "spark", "pyspark"])

word_pairs = rdd.map(lambda x: (x, 1))

word_count = word_pairs.reduceByKey(lambda a, b: a + b)

print(word_count.collect())
```

Output:
```
[('spark', 2), ('pyspark', 1)]
```

---

## 9) When RDD is Used (Rare)
RDD is still used when:
- you need very low-level control
- you are working with unstructured data
- you are doing complex custom logic not possible in DataFrames
- legacy Spark code exists

But in modern DE:
- DataFrame API is preferred.

---

## 10) Summary (Quick Notes)

- RDD is Spark’s older distributed dataset API.
- Transformations are lazy, actions trigger execution.
- map() transforms each element.
- flatMap() returns multiple outputs.
- reduceByKey() aggregates key-value pairs.
- RDD is slower and not optimized compared to DataFrames.
- DataFrames are the standard in production.

---

✅ Next File: `19_transformations_actions.md`
