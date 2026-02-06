# 24 - Structured Streaming (PySpark) (Optional but Powerful)

This note covers:
- readStream
- writeStream
- checkpointing
- trigger
- output modes
- streaming + delta
- kafka basics (if needed)

Structured Streaming is used in real-time pipelines.

---

## 1) What is Structured Streaming?
Structured Streaming is Spark’s streaming engine.

It allows processing data in:
- near real-time
- micro-batches (default)
- continuous mode (rare)

Spark streaming is based on the same DataFrame API.

---

## 2) readStream (Streaming Read)

### 2.1 Syntax

```python
stream_df = spark.readStream     .format("json")     .load("/mnt/stream/input")
```

---

### 2.2 Example: Read streaming JSON

```python
stream_df = spark.readStream     .format("json")     .option("maxFilesPerTrigger", 1)     .load("/mnt/stream/input")

stream_df.printSchema()
```

---

## 3) writeStream (Streaming Write)

### 3.1 Basic Write

```python
query = stream_df.writeStream     .format("console")     .outputMode("append")     .start()

query.awaitTermination()
```

---

## 4) Output Modes

Structured streaming supports:

### 4.1 append
- writes only new rows
- most common

### 4.2 complete
- writes full aggregated result every time
- used for aggregations

### 4.3 update
- writes only changed rows
- used for aggregations

---

## 5) Checkpointing (Must)

### 5.1 What is checkpoint?
Checkpoint stores:
- offsets
- progress
- state

So Spark can recover if job fails.

---

### 5.2 Example

```python
query = stream_df.writeStream     .format("delta")     .outputMode("append")     .option("checkpointLocation", "/mnt/checkpoints/employees")     .start("/mnt/delta/employees_stream")
```

---

## 6) Trigger (Batch Interval)

Trigger defines how often micro-batch runs.

### 6.1 Processing time trigger

```python
query = stream_df.writeStream     .trigger(processingTime="10 seconds")     .format("console")     .start()
```

---

### 6.2 Available triggers
- processingTime = "10 seconds"
- once = True (run one batch and stop)
- availableNow = True (Databricks, process all and stop)

---

## 7) Streaming + Delta (Most Common in Databricks)

Delta is best for streaming because:
- ACID transactions
- exactly-once semantics
- schema enforcement

Example:

```python
query = stream_df.writeStream     .format("delta")     .outputMode("append")     .option("checkpointLocation", "/mnt/checkpoints/sales")     .start("/mnt/bronze/sales_stream")
```

---

## 8) Kafka Basics (If Needed)

Kafka is a messaging system used for streaming data.

### 8.1 Read from Kafka

```python
kafka_df = spark.readStream     .format("kafka")     .option("kafka.bootstrap.servers", "localhost:9092")     .option("subscribe", "sales_topic")     .load()
```

Kafka output schema:
- key (binary)
- value (binary)
- topic
- partition
- offset
- timestamp

---

### 8.2 Convert Kafka value to string

```python
from pyspark.sql.functions import col

json_df = kafka_df.selectExpr("CAST(value AS STRING) as value")
```

---

## 9) Best Practices (Production Level)

✅ Always use checkpointing  
✅ Use Delta for streaming sinks  
✅ Keep schema stable  
✅ Monitor streaming query progress  
✅ Handle late data using watermarking (advanced)  
✅ Avoid heavy joins in streaming unless required  

---

## 10) Summary (Quick Notes)

- readStream reads streaming data.
- writeStream writes streaming output.
- checkpointing is mandatory for fault tolerance.
- output modes: append, update, complete.
- trigger controls micro-batch frequency.
- Delta is best sink for streaming pipelines.
- Kafka is common streaming source.

---

✅ Next File: `25_interview_notes.md`
