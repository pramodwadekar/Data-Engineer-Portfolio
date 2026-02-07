# 28 - Spark UI Debugging Practical (Databricks)

🎯 Goal: Learn how to debug performance issues using Spark UI in Databricks.

This is a **must** for interviews.

---

## ✅ What you will learn
- Where Spark UI is in Databricks
- Jobs / Stages / Tasks understanding
- Shuffle identification
- Skew detection
- Spill detection
- How to improve performance

---

## 1) Create a Heavy Job (Shuffle Example)

```python
from pyspark.sql.functions import col, rand

df = (spark.range(1, 2_000_000)
      .withColumn("key", (col("id") % 1000).cast("int"))
      .withColumn("amount", (rand() * 1000).cast("double")))

# Wide transformation (shuffle)
agg = df.groupBy("key").sum("amount")

agg.count()
```

---

## 2) Open Spark UI
After running above:

Go to:
- Notebook run output
- Click **Spark UI**

OR
- Compute → cluster → Spark UI

---

## 3) Check Jobs Tab
Observe:
- job runtime
- number of stages

---

## 4) Check Stages Tab
Look for:
- shuffle read/write size
- task time distribution

---

## 5) Detect Shuffle
You will see:
- Shuffle Read
- Shuffle Write

This confirms wide transformation.

---

## 6) Detect Skew
In Stages:
- check tasks
- if few tasks take much longer → skew

---

## 7) Detect Spill
Look for:
- Memory Spill
- Disk Spill

Spills indicate insufficient memory or huge shuffle.

---

## 8) Fix Patterns (Try these)

### Reduce shuffle partitions
```python
spark.conf.set("spark.sql.shuffle.partitions", "50")
```

### Enable AQE
```python
spark.conf.set("spark.sql.adaptive.enabled", "true")
```

### Broadcast small tables in joins
```python
from pyspark.sql.functions import broadcast
```

---

## 9) Interview Talking Points
- Spark UI is primary tool for debugging
- shuffle and skew are main bottlenecks
- spills indicate memory pressure
- AQE helps optimize automatically

---

## 10) Output
After this practical:
✅ you can navigate Spark UI  
✅ you can identify shuffle, skew, spills  
✅ you can explain performance debugging  

---

✅ Next: `29_job_run_logs_debugging_practical.md`
