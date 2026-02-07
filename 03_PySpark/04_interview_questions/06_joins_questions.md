# 06 - Joins Interview Questions (PySpark)

This file covers **joins** from basic to advanced, including real interview scenarios.

---

## 1) What are join types in Spark?
**Answer:**
Spark supports:
- inner
- left (left_outer)
- right (right_outer)
- full (full_outer)
- left_semi
- left_anti
- cross join

---

## 2) Inner Join
**Answer:**
Returns only matching rows from both tables.

```python
df1.join(df2, "id", "inner")
```

---

## 3) Left Join
**Answer:**
Returns all rows from left table + matching rows from right.

```python
df1.join(df2, "id", "left")
```

---

## 4) Right Join
**Answer:**
Returns all rows from right table + matching rows from left.

```python
df1.join(df2, "id", "right")
```

---

## 5) Full Outer Join
**Answer:**
Returns all rows from both tables.
Non-matching columns become null.

```python
df1.join(df2, "id", "full")
```

---

## 6) Left Semi Join (Important)
**Answer:**
Returns rows from left table where match exists in right.
But it returns only left columns.

Use-case:
- filter left table using right table keys

```python
df1.join(df2, "id", "left_semi")
```

---

## 7) Left Anti Join (Very Important)
**Answer:**
Returns rows from left table where match does NOT exist in right.

Use-case:
- find new records
- incremental load
- find missing keys

```python
df1.join(df2, "id", "left_anti")
```

---

## 8) Cross Join
**Answer:**
Cartesian product (very expensive).

```python
df1.crossJoin(df2)
```

---

## 9) Join on multiple columns
**Answer:**
```python
cond = (df1.id == df2.id) & (df1.dept == df2.dept)
df1.join(df2, cond, "inner")
```

---

## 10) Handling duplicate column names after join
**Answer:**
Problem:
- both tables have same column name like `name`, `created_at`

Solution:
1) rename before join
2) select required columns after join
3) use alias

Example:
```python
a = df1.alias("a")
b = df2.alias("b")

joined = a.join(b, col("a.id")==col("b.id"), "inner")     .select(
        col("a.id"),
        col("a.name").alias("emp_name"),
        col("b.name").alias("dept_name")
    )
```

---

## 11) What is broadcast join?
**Answer:**
Spark broadcasts a small table to all executors so shuffle is avoided.

---

## 12) When to use broadcast join?
**Answer:**
When one table is small (few MBs).

Example:
```python
from pyspark.sql.functions import broadcast
df_big.join(broadcast(df_small), "id", "inner")
```

---

## 13) Why broadcast join is faster?
**Answer:**
Because:
- avoids shuffle
- avoids sorting
- avoids network transfer of big table

---

## 14) What is spark.sql.autoBroadcastJoinThreshold?
**Answer:**
Spark config that controls auto broadcast size.

Default often ~10MB.

---

## 15) What is shuffle join?
**Answer:**
When both tables are big → Spark shuffles both tables by join keys.

---

## 16) Join optimization best practices
**Answer:**
- filter data before join
- select only needed columns before join
- broadcast small table
- avoid skew keys
- repartition by join key for big-big joins

---

## 17) Common join interview trick question
**Question:**
Why left join produces more rows than left table?

**Answer:**
Because right table has duplicates for join key (one-to-many).

---

## 18) How to fix join duplication issue?
**Answer:**
- deduplicate right table before join
- aggregate right table before join
- use window function to pick latest row

---

## 19) What is sort-merge join?
**Answer:**
Spark sorts both datasets on join key and merges them.
Used for large datasets.

---

## 20) Real DE Scenario Question
**Question:**
You have 1 TB fact table and 50 MB dimension table. How will you join?

**Best Answer:**
- broadcast dimension table
- select required columns
- filter fact table early
- check explain plan

---

## ⭐ Quick Revision
- left_anti = new records
- left_semi = exists filter
- broadcast avoids shuffle
- duplicates in join keys cause row explosion

---

✅ Next: `07_groupby_aggregations_questions.md`
