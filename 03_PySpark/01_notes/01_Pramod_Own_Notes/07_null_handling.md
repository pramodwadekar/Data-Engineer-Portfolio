# 07 - Null Handling (PySpark)

This note covers how to handle missing values (nulls) in PySpark:
- dropna()
- fillna()
- replace()
- isNull(), isNotNull()
- coalesce(), nvl()

Null handling is one of the most common tasks in real Data Engineering pipelines.

---

## 1) What is NULL in Spark?
NULL means:
- missing value
- unknown value
- not available

Null can exist in:
- string columns
- numeric columns
- date/timestamp columns

---

## 2) Setup

```python
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, coalesce

spark = SparkSession.builder.appName("NullHandling").getOrCreate()
```

Sample DataFrame:

```python
data = [
    (1, "Pramod", "IT", 50000),
    (2, None, "HR", 60000),
    (3, "Rahul", None, None),
    (4, None, None, 45000),
    (5, "Neha", "Finance", 70000),
]

cols = ["id", "name", "dept", "salary"]

df = spark.createDataFrame(data, cols)
df.show()
```

---

## 3) isNull() and isNotNull()

### 3.1 Filter rows where a column is NULL

```python
df.filter(col("name").isNull()).show()
```

---

### 3.2 Filter rows where a column is NOT NULL

```python
df.filter(col("salary").isNotNull()).show()
```

---

### 3.3 Filter rows where multiple columns are NULL

```python
df.filter(col("name").isNull() & col("dept").isNull()).show()
```

---

## 4) dropna()

`dropna()` removes rows containing null values.

---

### 4.1 Drop rows if ANY column has null (default)

```python
df.dropna().show()
```

---

### 4.2 Drop rows if ALL columns are null

```python
df.dropna(how="all").show()
```

---

### 4.3 Drop rows if specific columns have null

Example: drop rows if name or dept is null

```python
df.dropna(subset=["name", "dept"]).show()
```

---

## 5) fillna()

`fillna()` replaces null values with a default value.

---

### 5.1 Fill null for one column

```python
df.fillna({"dept": "UNKNOWN"}).show()
```

---

### 5.2 Fill null for multiple columns

```python
df.fillna({
    "name": "NO_NAME",
    "dept": "UNKNOWN"
}).show()
```

---

### 5.3 Fill null for numeric column

```python
df.fillna({"salary": 0}).show()
```

---

### 5.4 Fill null for all string columns (single value)

```python
df.fillna("UNKNOWN").show()
```

⚠️ Note:
- This will fill only compatible columns (mostly strings).
- Numeric columns will not be filled with a string.

---

## 6) replace()

`replace()` is used to replace values (not only nulls).

---

### 6.1 Replace a value in one column

Example: Replace dept = "IT" with "TECH"

```python
df.replace("IT", "TECH", subset=["dept"]).show()
```

---

### 6.2 Replace multiple values

```python
df.replace(
    {"IT": "TECH", "HR": "HUMAN_RESOURCE"},
    subset=["dept"]
).show()
```

---

### 6.3 Replace null using replace (not recommended)
Technically possible, but `fillna()` is better.

---

## 7) coalesce() (Most Used in DE)

`coalesce()` returns the first non-null value from given columns.

---

### 7.1 Example: Use name if available else use default value

```python
from pyspark.sql.functions import lit, coalesce

df2 = df.withColumn(
    "name_final",
    coalesce(col("name"), lit("NO_NAME"))
)

df2.show()
```

---

### 7.2 Example: Take first available value from multiple columns

```python
data2 = [
    (1, None, "Pramod"),
    (2, "Akash", None),
    (3, None, None)
]

df_alt = spark.createDataFrame(data2, ["id", "name1", "name2"])

df_alt.withColumn(
    "final_name",
    coalesce(col("name1"), col("name2"), lit("UNKNOWN"))
).show()
```

---

## 8) nvl() (SQL Style)

`nvl(col, value)` is like:
- if col is null → replace with value

Spark provides it via SQL functions.

Example:

```python
from pyspark.sql.functions import expr

df2 = df.withColumn("dept_final", expr("nvl(dept, 'UNKNOWN')"))
df2.show()
```

---

## 9) Real Data Engineering Examples

### 9.1 Replace null salary with 0

```python
df.fillna({"salary": 0}).show()
```

---

### 9.2 Keep only valid records (name and dept must not be null)

```python
df_valid = df.dropna(subset=["name", "dept"])
df_valid.show()
```

---

### 9.3 Create a cleaned column using coalesce

```python
from pyspark.sql.functions import lit, coalesce, trim, upper

df_clean = df.withColumn(
    "name_clean",
    upper(trim(coalesce(col("name"), lit("NO_NAME"))))
)

df_clean.show()
```

---

## 10) Best Practices

✅ Use `dropna(subset=...)` for important columns  
✅ Use `fillna()` for default values  
✅ Use `coalesce()` when multiple columns can contain the value  
✅ Avoid using UDF for null handling  
✅ Always check null counts in critical columns  

---

## 11) Summary (Quick Notes)

- `isNull()` and `isNotNull()` are used to filter nulls.
- `dropna()` removes rows containing null values.
- `fillna()` replaces nulls with default values.
- `replace()` replaces specific values in columns.
- `coalesce()` returns the first non-null value.
- `nvl()` is SQL style null replacement.

---

✅ Next File: `08_groupby_aggregations.md`



