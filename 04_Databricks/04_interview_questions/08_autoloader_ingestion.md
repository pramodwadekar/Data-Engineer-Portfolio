# 08 - Auto Loader (Interview Questions)

## 1) What is Auto Loader?
Auto Loader is a Databricks feature for incremental ingestion of files from cloud storage.

---

## 2) Why Auto Loader?
- scalable file discovery
- handles millions of files
- schema inference + evolution
- exactly-once semantics with checkpointing

---

## 3) How Auto Loader works?
It tracks processed files using:
- checkpoint
- schema location

---

## 4) Auto Loader vs spark.read
- spark.read: batch load, no file tracking
- Auto Loader: incremental + scalable

---

## 5) cloudFiles format
Example:
```python
spark.readStream.format("cloudFiles")...
```

---

## 6) Schema location
Stores inferred schema for streaming.

---

## 7) Supported formats
- csv
- json
- parquet
- avro
- text
- binaryFile

---

## 8) Schema evolution
Auto Loader can evolve schema:
- add new columns
- rescue corrupt records

---

## 9) What is _rescued_data?
Column where unexpected fields go.

---

## 10) availableNow trigger
Runs streaming like batch:
- processes new files
- stops automatically

---

## 11) Interview scenario
**Q:** How do you ingest daily files reliably?  
**A:** Auto Loader with checkpoint + availableNow.

---

## 12) Best practices
- always set checkpoint + schema location
- partition output by date
- quarantine bad records
