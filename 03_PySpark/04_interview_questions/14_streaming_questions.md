# 14 - Structured Streaming Interview Questions (PySpark)

This file covers structured streaming questions for DE interviews.

---

## 1) What is Structured Streaming?
**Answer:**
Structured Streaming is Spark’s streaming engine that treats streaming data as an unbounded table.

---

## 2) readStream vs read
**Answer:**
- read = batch
- readStream = streaming

---

## 3) writeStream vs write
**Answer:**
- write = batch output
- writeStream = streaming output

---

## 4) What is a checkpoint in streaming?
**Answer:**
Checkpoint stores streaming progress and state so the job can restart safely.

Without checkpoint:
- duplicates
- data loss
- cannot recover

---

## 5) Output modes in streaming
**Answer:**
- append
- update
- complete

---

## 6) Triggers in streaming
**Answer:**
Triggers control micro-batch frequency.

Example:
```python
.writeStream.trigger(processingTime="10 seconds")
```

Databricks also supports:
- availableNow

---

## 7) What is watermark?
**Answer:**
Watermark handles late arriving data.
It defines how long Spark waits for late events.

Example:
```python
df.withWatermark("event_time", "10 minutes")
```

---

## 8) What is state in streaming?
**Answer:**
State is memory used to maintain aggregation results across micro-batches.

Example:
- window aggregation
- sessionization

---

## 9) Why streaming jobs fail?
**Answer:**
- no checkpoint
- schema changes
- state store memory issues
- late events without watermark
- output sink issues

---

## 10) Streaming + Delta Lake
**Answer:**
Delta is a great sink for streaming because it supports:
- exactly once semantics
- ACID
- scalable writes

---

## 11) What is foreachBatch?
**Answer:**
Allows custom logic per micro-batch.
Very common in real projects.

---

## 12) What is Auto Loader?
**Answer:**
Databricks feature to incrementally ingest files from cloud storage.

Uses:
- cloudFiles format
- schema inference + evolution
- checkpointing

---

## 13) Kafka in Spark streaming
**Answer:**
Spark can read Kafka topics using:
- bootstrap servers
- subscribe topics

---

## 14) Interview Scenario
**Question:**
You need near real-time sales dashboard. What pipeline?

**Answer:**
Kafka → Spark Structured Streaming → Delta → Gold KPI tables.

---

## ⭐ Quick Revision
- checkpoint is mandatory
- watermark handles late events
- foreachBatch is powerful
- Delta is best sink

---

✅ Next: `15_real_world_scenarios_answers.md`
