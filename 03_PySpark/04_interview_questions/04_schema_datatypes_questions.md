# 04 - Schema & DataTypes Interview Questions (PySpark)

This file covers schema and datatype interview questions.

---

## 1) What is schema in Spark?
**Answer:**
Schema defines:
- column names
- data types
- nullability

---

## 2) What is StructType and StructField?
**Answer:**
- StructType = full schema
- StructField = one column definition

Example:
```python
from pyspark.sql.types import StructType, StructField, IntegerType, StringType

schema = StructType([
    StructField("id", IntegerType(), True),
    StructField("name", StringType(), True)
])
```

---

## 3) Why schema is important in production?
**Answer:**
Because it ensures:
- correct datatypes
- stable pipelines
- faster reads
- prevents corrupt data

---

## 4) InferSchema vs Manual Schema
**Answer:**
### InferSchema
- easier
- slower
- can be wrong

### Manual schema
- faster
- accurate
- best for production

---

## 5) Common DataTypes in Spark
**Answer:**
- StringType
- IntegerType
- LongType
- DoubleType
- BooleanType
- DateType
- TimestampType

---

## 6) What is casting?
**Answer:**
Changing datatype.

Example:
```python
df = df.withColumn("salary", col("salary").cast("int"))
```

---

## 7) Difference between DateType and TimestampType
**Answer:**
- DateType stores only date
- TimestampType stores date + time

---

## 8) What is nullability?
**Answer:**
It indicates whether column can contain null values.

StructField("id", IntegerType(), False) means id cannot be null.

---

## 9) How to handle corrupt records?
**Answer:**
Use:
- PERMISSIVE mode + corrupt record column
- quarantine pattern

Example:
```python
df = spark.read.option("mode","PERMISSIVE")     .option("columnNameOfCorruptRecord","_corrupt_record")     .json("/path/")
```

---

## 10) What is schema evolution?
**Answer:**
When new columns appear in source data.
Delta Lake supports schema evolution.

Example:
```python
df.write.format("delta").option("mergeSchema","true").mode("append").save(path)
```

---

## 11) How to enforce schema in Delta?
**Answer:**
Delta by default enforces schema.

If mismatch occurs, it fails (good).

---

## 12) What is schema drift?
**Answer:**
Schema changes unexpectedly over time.

Solution:
- schema enforcement
- schema evolution carefully

---

## ⭐ Quick Revision
- StructType defines schema
- manual schema = best
- casting fixes types
- Date vs Timestamp is common question

---

✅ Next file: `05_nulls_duplicates_bad_data.md`
