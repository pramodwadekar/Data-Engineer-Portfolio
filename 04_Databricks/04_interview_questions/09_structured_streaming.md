# 09 - Structured Streaming (Interview Questions)

## 1) What is Structured Streaming?
Spark’s high-level streaming API using DataFrames.

---

## 2) Spark streaming output modes
- append
- update
- complete

---

## 3) What is checkpointing?
Checkpoint stores streaming progress and state.
It ensures:
- exactly-once processing
- recovery after failure

---

## 4) What is trigger?
Controls when micro-batches run.
- processingTime
- once
- availableNow

---

## 5) Streaming + Delta
Delta is the best sink for streaming:
- supports ACID
- supports upserts (with foreachBatch)

---

## 6) Watermarking
Used to handle late data.

---

## 7) Stateful operations
- aggregations
- windowed operations

---

## 8) foreachBatch
Allows batch logic on streaming micro-batches.

---

## 9) Interview scenario
**Q:** How do you handle duplicates in streaming?  
**A:** Use watermark + dropDuplicates on event keys.

---

## 10) Common mistakes
- not using checkpoint
- using complete mode unnecessarily
- state store growing forever

---

## 11) Best practices
- use availableNow for file-based streaming
- separate bronze and silver streaming steps
