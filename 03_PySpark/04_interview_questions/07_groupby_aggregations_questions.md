# 07 - GroupBy & Aggregations Interview Questions (PySpark)

This file covers groupBy, aggregations, and advanced aggregation patterns.

---

## 1) What is groupBy in Spark?
**Answer:**
groupBy groups rows by key(s) and applies aggregation functions.

Example:
```python
df.groupBy("dept").count()
```

---

## 2) Common aggregation functions
**Answer:**
- count
- sum
- avg
- min
- max
- countDistinct
- approx_count_distinct

---

## 3) Difference between count and countDistinct
**Answer:**
- count = counts all rows
- countDistinct = counts unique values

```python
from pyspark.sql.functions import countDistinct
df.groupBy("dept").agg(countDistinct("emp_id").alias("unique_emp"))
```

---

## 4) What is agg()?
**Answer:**
agg() allows multiple aggregations.

```python
from pyspark.sql.functions import sum, avg
df.groupBy("dept").agg(
    sum("salary").alias("total_salary"),
    avg("salary").alias("avg_salary")
)
```

---

## 5) How to do HAVING clause in Spark?
**Answer:**
Spark DataFrame does not have direct having.
We do:
- groupBy + agg
- then filter

Example:
```python
df.groupBy("dept").count().filter(col("count") > 10)
```

---

## 6) What is shuffle in groupBy?
**Answer:**
groupBy triggers shuffle because records with same key must come together.

---

## 7) How to optimize groupBy?
**Answer:**
- reduce shuffle partitions
- use AQE
- pre-filter data
- avoid grouping on high-cardinality columns
- use approx_count_distinct when possible

---

## 8) What is approx_count_distinct?
**Answer:**
It gives approximate distinct count using HyperLogLog++ algorithm.
Much faster for large data.

---

## 9) What is rollup()?
**Answer:**
rollup creates subtotals + grand total.

```python
df.rollup("dept").sum("salary")
```

---

## 10) What is cube()?
**Answer:**
cube creates all combinations of subtotals.

```python
df.cube("dept","city").sum("salary")
```

---

## 11) What is pivot()?
**Answer:**
pivot converts row values into columns.

Example:
```python
df.groupBy("dept").pivot("gender").avg("salary")
```

---

## 12) What is groupByKey in Spark?
**Answer:**
RDD concept. Not recommended.
DataFrame groupBy is optimized.

---

## 13) How to handle null keys in groupBy?
**Answer:**
Null is treated as a group itself.

If you want to avoid:
```python
df.filter(col("dept").isNotNull()).groupBy("dept").count()
```

---

## 14) Real Interview Scenario
**Question:**
You need daily sales summary per store. What will you do?

**Answer:**
- parse date
- groupBy(store_id, sale_date)
- agg(sum, count, avg)
- write to gold delta partitioned by sale_date

---

## 15) Why aggregation can be slow?
**Answer:**
Because of:
- shuffle
- skew keys
- too many shuffle partitions
- large state in memory

---

## ⭐ Quick Revision
- groupBy triggers shuffle
- having = filter after aggregation
- pivot/rollup/cube are advanced
- approx_count_distinct is faster

---

✅ Next: `08_window_functions_questions.md`
