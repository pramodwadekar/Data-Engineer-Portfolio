# 08 - Window Functions Interview Questions (PySpark)

Window functions are **must** for Data Engineer interviews.

---

## 1) What are window functions?
**Answer:**
Window functions perform calculations across a set of rows related to the current row,
without collapsing rows like groupBy.

---

## 2) When do we use window functions?
**Answer:**
- deduplication (latest record)
- top N per group
- running totals
- lag/lead comparisons
- sessionization (advanced)

---

## 3) What is Window specification?
**Answer:**
Window is defined using:
- partitionBy
- orderBy

Example:
```python
from pyspark.sql.window import Window
w = Window.partitionBy("dept").orderBy(col("salary").desc())
```

---

## 4) row_number()
**Answer:**
Gives unique sequential number per partition.

Use-case:
- dedup latest record

```python
from pyspark.sql.functions import row_number
df.withColumn("rn", row_number().over(w))
```

---

## 5) rank() vs dense_rank()
**Answer:**
- rank(): gaps in ranking
- dense_rank(): no gaps

Example:
Salaries: 100, 90, 90, 80
- rank: 1,2,2,4
- dense_rank: 1,2,2,3

---

## 6) lag() and lead()
**Answer:**
Used to compare current row with previous/next row.

Example:
```python
from pyspark.sql.functions import lag, lead
w = Window.partitionBy("id").orderBy("date")
df.withColumn("prev_salary", lag("salary").over(w))
```

---

## 7) Running sum (cumulative sum)
**Answer:**
```python
from pyspark.sql.functions import sum
w = Window.partitionBy("id").orderBy("date").rowsBetween(Window.unboundedPreceding, Window.currentRow)
df.withColumn("running_total", sum("amount").over(w))
```

---

## 8) Top N per group
**Answer:**
```python
w = Window.partitionBy("dept").orderBy(col("salary").desc())
df2 = df.withColumn("rn", row_number().over(w)).filter(col("rn") <= 3)
```

---

## 9) Latest record per key (Dedup)
**Answer:**
```python
w = Window.partitionBy("emp_id").orderBy(col("updated_at").desc())
df_latest = df.withColumn("rn", row_number().over(w)).filter(col("rn")==1).drop("rn")
```

---

## 10) What is window frame?
**Answer:**
Defines which rows are included in calculation.

Types:
- rowsBetween
- rangeBetween

---

## 11) rowsBetween vs rangeBetween
**Answer:**
- rowsBetween = based on row positions
- rangeBetween = based on values in orderBy column

---

## 12) Does window cause shuffle?
**Answer:**
Yes, window functions often cause shuffle because partitionBy groups data.

---

## 13) How to optimize window functions?
**Answer:**
- reduce dataset before window
- partitionBy on correct key
- avoid huge partitions (skew)
- use AQE
- use repartition(key) before window if needed

---

## 14) Interview Scenario
**Question:**
You have customer transactions. Need latest transaction per customer.

**Answer:**
Use row_number over partitionBy(customer_id) orderBy(txn_time desc).

---

## ⭐ Quick Revision
- window keeps row count same
- row_number for dedup
- rank/dense_rank for top N
- lag/lead for comparisons
- window triggers shuffle

---

✅ Next: `09_partitioning_bucketing_questions.md`
