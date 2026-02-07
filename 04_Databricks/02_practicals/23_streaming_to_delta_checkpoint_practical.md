# 23 - Streaming to Delta + Checkpoint Practical (Databricks)

🎯 Goal: Learn streaming write fundamentals with checkpointing.

---

## ✅ What you will learn
- writeStream options
- checkpointLocation importance
- output modes
- how exactly-once is achieved

---

## 1) Create Streaming Source (File Stream)
```python
source_path = "dbfs:/tmp/stream_source/"
dbutils.fs.mkdirs(source_path)

dbutils.fs.put(source_path + "batch1.csv", "id,amount
1,100
2,200
", True)
```

---

## 2) Read Stream
```python
df = (spark.readStream
      .option("header", "true")
      .schema("id INT, amount INT")
      .csv(source_path))
```

---

## 3) Write Stream to Delta
```python
sink_path = "dbfs:/tmp/delta/stream_sales"
checkpoint_path = "dbfs:/tmp/checkpoints/stream_sales"

query = (df.writeStream
         .format("delta")
         .option("checkpointLocation", checkpoint_path)
         .outputMode("append")
         .start(sink_path))
```

Wait then stop:
```python
query.stop()
```

---

## 4) Add New Batch File
```python
dbutils.fs.put(source_path + "batch2.csv", "id,amount
3,300
4,400
", True)
```

Restart the stream again.
It will ingest only new data because checkpoint tracks progress.

---

## 5) Validate Delta Table
```python
spark.read.format("delta").load(sink_path).show()
```

---

## 6) Interview Talking Points
- checkpointLocation stores progress + offsets
- without checkpoint, duplicates happen
- streaming write to delta supports exactly-once

---

## 7) Output
After this practical:
✅ you understand checkpointing  
✅ you can explain streaming exactly-once  

---

✅ Next: `24_availableNow_trigger_practical.md`
