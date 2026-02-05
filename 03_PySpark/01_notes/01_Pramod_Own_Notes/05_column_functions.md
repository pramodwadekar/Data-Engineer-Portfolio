📌 Step 5: Column Functions (Most Important)
# 05 - Column Functions (PySpark)

This note covers the most important **PySpark column functions** used in Data Engineering:
- col(), lit()
- when() otherwise()
- concat(), concat_ws()
- substring(), trim(), lower(), upper()
- regexp_replace(), regexp_extract()
- split(), array_contains()

---

## 1) Why Column Functions are Important?
In real DE projects, most transformations are:
- cleaning text
- creating new columns
- applying conditional logic
- extracting values from strings
- splitting arrays
- standardizing data

PySpark column functions are optimized and should be preferred over UDFs.

---

## 2) Setup

```python
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, lit

spark = SparkSession.builder.appName("ColumnFunctions").getOrCreate()
```

Sample DataFrame:

```python
data = [
    (1, "  Pramod Wadekar  ", "IT", "Salary: 50000", "Java,Python,SQL"),
    (2, "Akash  ", "HR", "Salary: 60000", "SQL,Excel"),
    (3, None, "IT", "Salary: 45000", "Python,Spark"),
]

cols = ["id", "name", "dept", "salary_text", "skills"]

df = spark.createDataFrame(data, cols)
df.show(truncate=False)
```

---

## 3) col() and lit()

### 3.1 col()
`col()` is used to reference a column.

```python
from pyspark.sql.functions import col

df.select(col("id"), col("name")).show()
```

---

### 3.2 lit()
`lit()` is used to add a constant value.

```python
from pyspark.sql.functions import lit

df2 = df.withColumn("country", lit("India"))
df2.show(truncate=False)
```

---

## 4) when() and otherwise() (Conditional Column)

Used for IF-ELSE logic.

### 4.1 Basic Example

```python
from pyspark.sql.functions import when, col

df2 = df.withColumn(
    "dept_type",
    when(col("dept") == "IT", "TECH").otherwise("NON_TECH")
)

df2.show(truncate=False)
```

---

### 4.2 Multiple Conditions

```python
df2 = df.withColumn(
    "salary_level",
    when(col("salary_text").contains("60000"), "HIGH")
    .when(col("salary_text").contains("50000"), "MEDIUM")
    .otherwise("LOW")
)

df2.show(truncate=False)
```

---

## 5) concat() and concat_ws()

### 5.1 concat()
Concatenates columns.

```python
from pyspark.sql.functions import concat

df2 = df.withColumn(
    "id_name",
    concat(col("id"), lit("_"), col("name"))
)

df2.show(truncate=False)
```

⚠️ Note:
- `concat()` returns null if any column is null.

---

### 5.2 concat_ws()
Concatenate with separator (best for strings).

```python
from pyspark.sql.functions import concat_ws

df2 = df.withColumn(
    "full_info",
    concat_ws(" | ", col("name"), col("dept"), col("salary_text"))
)

df2.show(truncate=False)
```

✅ `concat_ws()` ignores null values.

---

## 6) substring(), trim(), lower(), upper()

### 6.1 trim()
Removes leading and trailing spaces.

```python
from pyspark.sql.functions import trim

df2 = df.withColumn("name_clean", trim(col("name")))
df2.show(truncate=False)
```

---

### 6.2 lower() and upper()

```python
from pyspark.sql.functions import lower, upper

df2 = df     .withColumn("name_lower", lower(trim(col("name"))))     .withColumn("dept_upper", upper(col("dept")))

df2.show(truncate=False)
```

---

### 6.3 substring()
Extracts substring from a string column.

Syntax:
- substring(column, startPos, length)

```python
from pyspark.sql.functions import substring

df2 = df.withColumn(
    "salary_prefix",
    substring(col("salary_text"), 1, 6)
)

df2.show(truncate=False)
```

---

## 7) regexp_replace() and regexp_extract()

Regex functions are used for:
- cleaning text
- extracting numbers
- removing special characters

---

### 7.1 regexp_replace()
Replace pattern with another string.

Example: remove all non-numeric characters from salary_text

```python
from pyspark.sql.functions import regexp_replace

df2 = df.withColumn(
    "salary_only_numbers",
    regexp_replace(col("salary_text"), "[^0-9]", "")
)

df2.show(truncate=False)
```

---

### 7.2 regexp_extract()
Extract matching pattern.

Example: extract salary number

```python
from pyspark.sql.functions import regexp_extract

df2 = df.withColumn(
    "salary_value",
    regexp_extract(col("salary_text"), "([0-9]+)", 1)
)

df2.show(truncate=False)
```

Meaning:
- `([0-9]+)` = capture group for digits
- `1` = first group

---

## 8) split() and array_contains()

### 8.1 split()
Splits a string into an array.

```python
from pyspark.sql.functions import split

df2 = df.withColumn("skills_array", split(col("skills"), ","))
df2.show(truncate=False)
df2.printSchema()
```

Output schema:
- skills_array: array<string>

---

### 8.2 array_contains()
Checks if an array contains a value.

```python
from pyspark.sql.functions import array_contains

df2 = df2.withColumn(
    "knows_python",
    array_contains(col("skills_array"), "Python")
)

df2.show(truncate=False)
```

---

## 9) Real Data Engineering Examples

### 9.1 Clean Names + Standardize

```python
from pyspark.sql.functions import trim, upper

df_clean = df.withColumn("name_clean", upper(trim(col("name"))))
df_clean.show(truncate=False)
```

---

### 9.2 Extract Salary as Integer

```python
from pyspark.sql.functions import regexp_replace, col

df_salary = df.withColumn(
    "salary_int",
    regexp_replace(col("salary_text"), "[^0-9]", "").cast("int")
)

df_salary.show(truncate=False)
df_salary.printSchema()
```

---

### 9.3 Categorize Salary using when()

```python
from pyspark.sql.functions import when, col

df_final = df_salary.withColumn(
    "salary_category",
    when(col("salary_int") >= 60000, "HIGH")
    .when(col("salary_int") >= 50000, "MEDIUM")
    .otherwise("LOW")
)

df_final.show(truncate=False)
```

---

## 10) Best Practices

✅ Prefer built-in functions over UDFs  
✅ Always trim and standardize string columns  
✅ Use regex for cleaning raw data  
✅ Use split() for multi-value columns  
✅ Use array_contains() for skill/flag columns  

---

## 11) Summary (Quick Notes)

- `col()` is used to reference a column.
- `lit()` is used to add constant values.
- `when() otherwise()` is used for IF-ELSE logic.
- `concat()` and `concat_ws()` join strings.
- `trim()`, `lower()`, `upper()` clean text.
- `regexp_replace()` cleans using regex.
- `regexp_extract()` extracts pattern using regex.
- `split()` converts string → array.
- `array_contains()` checks array values.

---


