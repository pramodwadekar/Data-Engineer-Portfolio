# 11 - OPTIMIZE + ZORDER Practical (Databricks Delta)

🎯 Goal: Solve the **small files problem** and speed up queries using OPTIMIZE + ZORDER.

---

## ✅ What you will learn
- Why small files are bad
- OPTIMIZE compaction
- ZORDER for data skipping
- When to use ZORDER
- How to validate improvement

---

## 1) Create a Sample Delta Table with Many Small Files

```python
from pyspark.sql.functions import col, rand

base_path = "dbfs:/tmp/delta/sales_small_files"

df = (spark.range(1, 50001)
      .withColumn("customer_id", (col("id") % 500).cast("int"))
      .withColumn("amount", (rand() * 1000).cast("double"))
      .withColumn("city_id", (col("id") % 50).cast("int")))

# Write with many partitions to create small files
(df.repartition(200)
 .write.format("delta")
 .mode("overwrite")
 .save(base_path))
```

Register table:
```sql
%sql
CREATE TABLE IF NOT EXISTS sales_small_files
USING DELTA
LOCATION 'dbfs:/tmp/delta/sales_small_files';
```

---

## 2) Check Table Details

```sql
%sql
DESCRIBE DETAIL sales_small_files;
```

---

## 3) Run a Filter Query (Before Optimization)

```sql
%sql
SELECT * FROM sales_small_files
WHERE customer_id = 25;
```

---

## 4) Run OPTIMIZE (Compaction)

```sql
%sql
OPTIMIZE sales_small_files;
```

---

## 5) Run OPTIMIZE with ZORDER

ZORDER works best on columns frequently used in filters.

```sql
%sql
OPTIMIZE sales_small_files
ZORDER BY (customer_id);
```

---

## 6) Validate History

```sql
%sql
DESCRIBE HISTORY sales_small_files;
```

---

## 7) When to use ZORDER (Important)
Use ZORDER when:
- table is large
- you filter frequently on a column
- partitions alone are not enough

Do NOT use ZORDER on:
- very high cardinality columns unnecessarily
- small tables

---

## 8) Interview Talking Points
- OPTIMIZE compacts small files
- ZORDER improves data skipping
- Improves query speed and reduces IO

---

## 9) Output
After this practical:
✅ you can fix small file problem  
✅ you know how OPTIMIZE + ZORDER works  
✅ you can explain it in interview  

---

✅ Next: `12_vacuum_time_travel_practical.md`
