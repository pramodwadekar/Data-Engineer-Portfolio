# 04 - Schema and Data Types (PySpark)

This note covers how schema and datatypes work in PySpark:
- inferSchema vs manual schema
- StructType and StructField
- common datatypes (StringType, IntegerType, TimestampType, etc.)
- casting
- null handling and nullability
- timestamp vs date
- handling corrupt records

---

## 1) Why Schema is Important in Data Engineering?
Schema means:
- Column names
- Column data types
- Nullability (nullable or not)

In real Data Engineering pipelines, schema is important because:
- Wrong schema causes wrong transformations
- Bad schema can break joins and aggregations
- Schema ensures data quality
- Production pipelines must be stable and repeatable

---

## 2) inferSchema vs Manual Schema

### 2.1 inferSchema (Easy but not recommended for production)
Spark automatically detects datatypes from the data.

Example:

```python
df = spark.read.option("header", "true").option("inferSchema", "true").csv("data/employees.csv")
df.printSchema()
```

✅ Pros:
- Easy for learning
- Quick for exploration

❌ Cons:
- Slower (Spark scans data to guess types)
- Can infer wrong types
- Not stable if input data changes

---

### 2.2 Manual Schema (Recommended for production)
You define schema explicitly using `StructType`.

Example:

```python
from pyspark.sql.types import StructType, StructField, IntegerType, StringType

schema = StructType([
    StructField("id", IntegerType(), True),
    StructField("name", StringType(), True),
    StructField("department", StringType(), True)
])

df = spark.read.option("header", "true").schema(schema).csv("data/employees.csv")

df.printSchema()
```

✅ Pros:
- Faster reads
- Correct types always
- Stable for production
- Prevents unexpected data issues

---

## 3) StructType and StructField

### 3.1 StructType
`StructType` represents the full schema (all columns).

### 3.2 StructField
`StructField` represents a single column:
- name
- datatype
- nullable

Example:

```python
from pyspark.sql.types import StructType, StructField, IntegerType, StringType

schema = StructType([
    StructField("id", IntegerType(), nullable=False),
    StructField("name", StringType(), nullable=True),
    StructField("age", IntegerType(), nullable=True)
])
```

---

## 4) Common Data Types in PySpark

### 4.1 StringType
```python
from pyspark.sql.types import StringType
```

Used for:
- names
- addresses
- codes
- JSON string columns

---

### 4.2 IntegerType
```python
from pyspark.sql.types import IntegerType
```

Used for:
- IDs
- age
- counts

---

### 4.3 LongType
```python
from pyspark.sql.types import LongType
```

Used for:
- big numbers
- transaction IDs

---

### 4.4 DoubleType
```python
from pyspark.sql.types import DoubleType
```

Used for:
- salary
- price
- floating values

---

### 4.5 BooleanType
```python
from pyspark.sql.types import BooleanType
```

Used for:
- flags
- true/false columns

---

### 4.6 DateType
```python
from pyspark.sql.types import DateType
```

Stores only date:
- yyyy-MM-dd

---

### 4.7 TimestampType
```python
from pyspark.sql.types import TimestampType
```

Stores date + time:
- yyyy-MM-dd HH:mm:ss

---

## 5) Casting in PySpark

Casting is used to convert datatypes.

### 5.1 Cast a column to Integer

```python
from pyspark.sql.functions import col

df2 = df.withColumn("age", col("age").cast("int"))
df2.printSchema()
```

---

### 5.2 Cast to Timestamp

```python
from pyspark.sql.functions import to_timestamp

df2 = df.withColumn("created_ts", to_timestamp(col("created_ts")))
```

---

### 5.3 Cast to Date

```python
from pyspark.sql.functions import to_date

df2 = df.withColumn("created_date", to_date(col("created_date")))
```

---

## 6) Null Handling in Schema

### 6.1 What is Null?
Null means missing or unknown value.

In Spark, null is supported in all datatypes.

---

### 6.2 Checking Nulls

```python
from pyspark.sql.functions import col

df.filter(col("name").isNull()).show()
df.filter(col("name").isNotNull()).show()
```

---

### 6.3 Filling Nulls

```python
df.fillna({"department": "UNKNOWN"}).show()
```

---

### 6.4 Dropping Nulls

```python
df.dropna().show()
```

---

## 7) Nullability (nullable = True/False)

In schema, each column has nullability.

Example:

```python
from pyspark.sql.types import StructType, StructField, IntegerType, StringType

schema = StructType([
    StructField("id", IntegerType(), nullable=False),
    StructField("name", StringType(), nullable=True)
])
```

Meaning:
- `id` cannot be null
- `name` can be null

⚠️ Important:
Even if you set `nullable=False`, Spark may still allow null values from raw sources.
So nullability is mainly for schema definition and clarity, not strict enforcement.

---

## 8) Timestamp vs Date (Very Important)

### 8.1 DateType
- Stores only date
- Example: `2026-02-05`
- Useful for daily partitioning

---

### 8.2 TimestampType
- Stores date + time
- Example: `2026-02-05 10:30:00`
- Useful for events, logs, transactions

---

### 8.3 When to Use What?
Use **DateType** when:
- You only need day-level granularity
- Partitioning by date

Use **TimestampType** when:
- You need time information
- Event tracking, logs, streaming

---

## 9) Handling Corrupt Records (CSV/JSON)

When reading raw data, some records may be corrupt due to:
- wrong delimiter
- missing columns
- invalid datatype
- broken JSON structure

Spark provides options to handle corrupt records.

---

### 9.1 Handle corrupt records in CSV

```python
df = spark.read     .option("header", "true")     .option("mode", "PERMISSIVE")     .option("columnNameOfCorruptRecord", "_corrupt_record")     .csv("data/employees.csv")
```

Modes:
- **PERMISSIVE** (default): puts corrupt data into `_corrupt_record`
- **DROPMALFORMED**: drops bad rows
- **FAILFAST**: fails immediately

---

### 9.2 Handle corrupt records in JSON

```python
df = spark.read.option("mode", "PERMISSIVE").option("columnNameOfCorruptRecord", "_corrupt_record").json("data/employees.json")
```

---

### 9.3 Filter Corrupt Records

```python
from pyspark.sql.functions import col

bad_df = df.filter(col("_corrupt_record").isNotNull())
good_df = df.filter(col("_corrupt_record").isNull())
```

---

## 10) Best Practices (Production Level)

✅ Use manual schema for stable pipelines  
✅ Use correct DateType/TimestampType  
✅ Always cast columns before joins/aggregations  
✅ Handle corrupt records (don’t fail pipeline)  
✅ Keep schema in one place (schema file / constants)  

---

## 11) Summary (Quick Notes)

- inferSchema is easy but not stable for production.
- Manual schema using StructType is recommended.
- StructField defines name, datatype, and nullable.
- Casting is common in raw → clean pipelines.
- DateType stores only date, TimestampType stores date + time.
- Corrupt records can be handled using PERMISSIVE mode.

---
