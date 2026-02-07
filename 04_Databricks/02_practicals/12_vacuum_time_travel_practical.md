# 12 - VACUUM + Time Travel Practical (Databricks Delta)

🎯 Goal: Learn Delta time travel + cleanup using VACUUM.

---

## ✅ What you will learn
- Time travel (query old versions)
- Delta history
- VACUUM cleanup
- Retention safety

---

## 1) Create Delta Table
```python
from pyspark.sql.functions import current_timestamp

path = "dbfs:/tmp/delta/time_travel_demo"

df = spark.createDataFrame([(1,"A"),(2,"B")], ["id","name"])           .withColumn("created_at", current_timestamp())

(df.write.format("delta").mode("overwrite").save(path))
```

Register:
```sql
%sql
CREATE TABLE IF NOT EXISTS time_travel_demo
USING DELTA
LOCATION 'dbfs:/tmp/delta/time_travel_demo';
```

---

## 2) Update Table (Create New Version)
```sql
%sql
UPDATE time_travel_demo SET name='Z' WHERE id=1;
```

---

## 3) Check History
```sql
%sql
DESCRIBE HISTORY time_travel_demo;
```

---

## 4) Time Travel by Version
```sql
%sql
SELECT * FROM time_travel_demo VERSION AS OF 0;
```

---

## 5) Time Travel by Timestamp
```sql
%sql
SELECT * FROM time_travel_demo TIMESTAMP AS OF '2026-01-01T00:00:00.000+00:00';
```

(Use timestamp from DESCRIBE HISTORY)

---

## 6) VACUUM (Cleanup Old Files)

```sql
%sql
VACUUM time_travel_demo;
```

---

## 7) Retention Safety (Important)
By default, Delta keeps old files for 7 days.

This protects from accidental data loss.

---

## 8) Dangerous VACUUM (Do NOT in Production)
```sql
%sql
-- DO NOT run in production
VACUUM time_travel_demo RETAIN 0 HOURS;
```

---

## 9) Interview Talking Points
- Time travel allows rollback/debugging
- VACUUM removes old files to save storage
- Retention prevents accidental deletion

---

## 10) Output
After this practical:
✅ you can use time travel  
✅ you can run VACUUM safely  
✅ you understand retention  

---

✅ Next: `13_create_job_single_task_practical.md`
