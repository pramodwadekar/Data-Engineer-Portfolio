# 13 - UDF vs Built-in Functions (PySpark)

This note covers:
- What is UDF
- Normal UDF
- When NOT to use UDF
- Performance impact
- pandas_udf basics
- Alternatives (built-in functions)
- Examples

UDF is an important topic in interviews and also in real projects (mainly to avoid it).

---

## 1) What is a UDF?
UDF = **User Defined Function**

A UDF is a custom function that you write to apply logic on Spark DataFrame columns.

Spark provides many built-in functions, but sometimes we need custom logic.

---

## 2) Why UDF is NOT Recommended (Most Important)
Even though UDF is easy, it is generally slower because:

❌ Spark cannot optimize UDF logic using Catalyst Optimizer  
❌ UDF breaks Spark’s query optimization  
❌ UDF increases serialization/deserialization overhead  
❌ UDF runs row-by-row (slower than vectorized functions)  

So in Data Engineering:
✅ Prefer built-in functions  
⚠️ Use UDF only when necessary  

---

## 3) Normal UDF in PySpark

### 3.1 Setup

```python
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, udf
from pyspark.sql.types import StringType

spark = SparkSession.builder.appName("UDFExample").getOrCreate()
```

Sample DataFrame:

```python
data = [
    (1, "pramod"),
    (2, "akash"),
    (3, None)
]

df = spark.createDataFrame(data, ["id", "name"])
df.show()
```

---

### 3.2 Create a Python Function

```python
def make_upper(name):
    if name is None:
        return "UNKNOWN"
    return name.upper()
```

---

### 3.3 Register as UDF

```python
upper_udf = udf(make_upper, StringType())
```

---

### 3.4 Apply UDF

```python
df2 = df.withColumn("name_upper", upper_udf(col("name")))
df2.show()
```

---

## 4) When NOT to Use UDF (Must Know)

Do NOT use UDF when:
- logic can be done using built-in functions
- you are working with huge datasets
- performance is critical
- you want Spark to optimize query plan

Examples where you should avoid UDF:
- trimming strings
- regex extraction
- date conversion
- if-else logic
- splitting arrays

---

## 5) Performance Impact of UDF
UDF performance issues happen because:

### 5.1 Catalyst cannot optimize
Spark cannot understand what your Python function is doing.

### 5.2 Python execution overhead
Spark is JVM-based, but UDF runs in Python worker process.

So data must move between:
- JVM ↔ Python

This creates overhead.

---

## 6) Alternatives to UDF (Built-in Functions)

### 6.1 Instead of UDF for upper()
Use built-in:

```python
from pyspark.sql.functions import upper, coalesce, lit

df2 = df.withColumn(
    "name_upper",
    upper(coalesce(col("name"), lit("UNKNOWN")))
)
df2.show()
```

This is:
✅ faster  
✅ optimized  
✅ production recommended  

---

### 6.2 Instead of UDF for IF-ELSE
Use when/otherwise:

```python
from pyspark.sql.functions import when

df3 = df.withColumn(
    "status",
    when(col("name").isNull(), "MISSING").otherwise("PRESENT")
)

df3.show()
```

---

## 7) pandas_udf (Vectorized UDF) Basics

### 7.1 What is pandas_udf?
`pandas_udf` is a faster UDF type.

It works using:
- Apache Arrow
- vectorized operations
- batch processing instead of row-by-row

So it is faster than normal UDF.

---

### 7.2 Example pandas_udf

```python
import pandas as pd
from pyspark.sql.functions import pandas_udf
from pyspark.sql.types import StringType

@pandas_udf(StringType())
def upper_pandas(s: pd.Series) -> pd.Series:
    return s.fillna("UNKNOWN").str.upper()

df4 = df.withColumn("name_upper", upper_pandas(col("name")))
df4.show()
```

---

## 8) When to Use UDF (Real Cases)

Use UDF only when:
- complex business logic is not possible using built-in functions
- you need external library logic (rare)
- you need custom encryption/hash logic (sometimes)
- you need custom parsing of special formats

---

## 9) Best Practices

✅ Always try built-in functions first  
✅ If you must use UDF, prefer pandas_udf  
✅ Keep UDF logic simple  
✅ Avoid UDF inside join/groupBy heavy pipelines  
✅ Measure performance for big datasets  

---

## 10) Summary (Quick Notes)

- UDF = user defined function.
- Normal UDF runs row-by-row and is slow.
- UDF breaks Spark optimizer.
- Built-in functions are always faster.
- pandas_udf is faster than normal UDF.
- Use UDF only when absolutely required.

---

✅ Next File: `14_partitioning.md`
