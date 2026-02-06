# 21 - Handling Data Skew (PySpark)

This note covers:
- what is skew
- symptoms
- salting technique
- broadcast join
- repartition by key
- AQE (Adaptive Query Execution) skew join
- AQE skew join handling

Handling skew is an advanced Spark topic and very common in real Data Engineering projects.

---

## 1) What is Data Skew?
Data skew happens when:
- some keys have a huge amount of data
- other keys have very little data

Example:
- 80% of transactions belong to customer_id = 1
- remaining 20% distributed across other customers

During join/groupBy, Spark distributes data by key.
If one key is too heavy, one partition becomes huge.

Result:
- one task becomes very slow
- whole job waits for that task (straggler)

---

## 2) Symptoms of Data Skew

Common symptoms:

### 2.1 One stage takes too long
In Spark UI:
- one stage runs for a long time

---

### 2.2 One task runs extremely slow
In Spark UI tasks:
- most tasks finish fast
- 1–2 tasks take very long time

---

### 2.3 Shuffle spill to disk
You may see:
- high shuffle read/write
- spill (memory to disk)

---

### 2.4 Executor OOM errors
Because skewed partition is too large:
- executor memory runs out
- job fails

---

## 3) Why Skew Happens?
Skew happens due to:
- highly repeated join keys
- uneven distribution
- bad partition strategy
- dirty data (null keys, default keys)

Common skew columns:
- customer_id
- user_id
- country (sometimes)
- status (very low cardinality)

---

## 4) Broadcast Join (Best Solution if possible)

### 4.1 When broadcast helps?
If one table is small:
- dimension table
- lookup table

Broadcast avoids shuffle.

Example:

```python
from pyspark.sql.functions import broadcast

df_join = big_df.join(broadcast(small_df), "key", "left")
```

---

### 4.2 Benefit
- no shuffle
- no skew problem for join

---

## 5) Repartition by Key

If you know join/groupBy key:

```python
df2 = df.repartition("customer_id")
```

This can help sometimes but:

⚠️ If key itself is skewed, repartition won’t fix skew.

---

## 6) Salting Technique (Most Important)

### 6.1 What is Salting?
Salting means:
- adding random value to skewed key
- so heavy key gets split into multiple keys

This distributes load across partitions.

---

### 6.2 Salting Example (Concept)

Suppose skewed key = dept_id

Add salt column:

```python
from pyspark.sql.functions import col, rand, floor

df_salted = df.withColumn("salt", floor(rand() * 10))
```

Now create salted key:

```python
from pyspark.sql.functions import concat_ws

df_salted = df_salted.withColumn(
    "salted_key",
    concat_ws("_", col("dept_id"), col("salt"))
)
```

---

### 6.3 Salting for Join (Real Use)
If big_df is skewed on key, and small_df is not huge:

1) Add salt to big_df  
2) Expand small_df with all salt values  
3) Join on salted key  

This spreads skewed records.

---

## 7) AQE Skew Join (Spark 3+)

### 7.1 What is AQE?
AQE = Adaptive Query Execution

Spark adjusts plan at runtime.

Enable AQE:

```python
spark.conf.set("spark.sql.adaptive.enabled", "true")
```

---

### 7.2 AQE Skew Join Handling
Spark can automatically detect skewed partitions and split them.

Enable skew join:

```python
spark.conf.set("spark.sql.adaptive.skewJoin.enabled", "true")
```

---

### 7.3 What AQE does
- detects skewed shuffle partitions
- splits large partitions into smaller ones
- reduces straggler tasks

---

## 8) Real Data Engineering Best Practices for Skew

✅ Always check skew in Spark UI  
✅ Broadcast small dimension tables  
✅ Avoid joining on low-cardinality columns  
✅ Use salting for highly skewed keys  
✅ Enable AQE in Spark 3+  
✅ Use correct shuffle partitions  
✅ Filter null keys before join/groupBy  

---

## 9) Summary (Quick Notes)

- Data skew = uneven distribution of keys.
- Symptoms: slow tasks, stragglers, spill, OOM.
- Broadcast join avoids shuffle and skew.
- Salting splits heavy keys into multiple keys.
- AQE skew join automatically handles skew partitions.
- Spark UI is best tool to detect skew.

---

✅ Next File: `22_delta_lake.md`
