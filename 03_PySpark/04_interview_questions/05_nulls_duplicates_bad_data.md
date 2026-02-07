# 05 - Nulls, Duplicates & Bad Data (Interview Questions)

This file covers real Data Engineering cleaning questions.

---

## 1) How to handle nulls in PySpark?
**Answer:**
Common methods:
- dropna()
- fillna()
- replace()
- isNull/isNotNull
- coalesce/nvl

---

## 2) dropna() vs fillna()
**Answer:**
- dropna(): removes rows with nulls
- fillna(): replaces nulls with default value

Example:
```python
df.dropna()
df.fillna({"salary": 0, "dept": "UNKNOWN"})
```

---

## 3) What is replace() used for?
**Answer:**
To replace values (including nulls) in columns.

```python
df.replace("NA", None)
```

---

## 4) How to check null values?
**Answer:**
```python
df.filter(col("salary").isNull())
df.filter(col("salary").isNotNull())
```

---

## 5) What is coalesce()?
**Answer:**
coalesce() returns first non-null value.

```python
from pyspark.sql.functions import coalesce, lit
df.withColumn("dept", coalesce(col("dept"), lit("UNKNOWN")))
```

---

## 6) What is nvl()?
**Answer:**
Spark SQL function similar to coalesce.

```python
spark.sql("select nvl(dept,'UNKNOWN') from table")
```

---

## 7) How to remove duplicates in PySpark?
**Answer:**
- dropDuplicates()
- dropDuplicates(["col1","col2"])

---

## 8) dropDuplicates() vs window dedup
**Answer:**
dropDuplicates keeps random row.

For latest record:
use window functions.

Example:
```python
from pyspark.sql.window import Window
from pyspark.sql.functions import row_number, desc

w = Window.partitionBy("id").orderBy(desc("updated_at"))
df2 = df.withColumn("rn", row_number().over(w)).filter(col("rn")==1).drop("rn")
```

---

## 9) What is bad data / corrupt data?
**Answer:**
Bad data means:
- wrong datatype
- malformed JSON
- missing required fields
- invalid values

---

## 10) How Spark handles corrupt records?
**Answer:**
Using:
- PERMISSIVE mode
- _corrupt_record column

---

## 11) What is quarantine table?
**Answer:**
A separate Delta table/path where bad records are stored for:
- debugging
- reprocessing
- audit

---

## 12) In production, should we drop bad records?
**Answer:**
❌ No (never silently)

✅ Best practice:
- write bad records to quarantine
- continue pipeline with good data

---

## 13) How to validate data quality?
**Answer:**
- null checks
- duplicate checks
- referential integrity
- row count validation

---

## 14) Real Interview Scenario
**Question:**
You receive daily file with duplicates and nulls. How will you process?

**Answer:**
1) Read with schema  
2) Quarantine corrupt rows  
3) Fill/drop nulls based on business  
4) Deduplicate using window latest record  
5) MERGE into Delta target  

---

## ⭐ Quick Revision
- fillna replaces nulls
- dropna removes rows
- window dedup for latest record
- quarantine pattern is best

---

✅ Next: `06_joins_questions.md`
