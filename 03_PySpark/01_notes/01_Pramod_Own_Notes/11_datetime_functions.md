# 11 - Date & Time Functions (PySpark)

This note covers the most important date and timestamp functions used in PySpark:
- current_date, current_timestamp
- date_add, date_sub
- datediff
- months_between
- to_date, to_timestamp
- year, month, dayofmonth
- trunc

Date/time transformations are extremely common in Data Engineering:
- partitioning
- incremental loads
- reporting
- time-based aggregations

---

## 1) Setup

```python
from pyspark.sql import SparkSession
from pyspark.sql.functions import (
    col, current_date, current_timestamp,
    to_date, to_timestamp, date_add, date_sub,
    datediff, months_between,
    year, month, dayofmonth, trunc
)

spark = SparkSession.builder.appName("DateTimeFunctions").getOrCreate()
```

Sample DataFrame:

```python
data = [
    (1, "Pramod", "2026-01-01", "2026-01-01 10:30:00"),
    (2, "Akash",  "2026-01-05", "2026-01-05 18:45:10"),
    (3, "Rahul",  "2026-02-01", "2026-02-01 09:00:00")
]

cols = ["id", "name", "join_date_str", "event_ts_str"]

df = spark.createDataFrame(data, cols)
df.show(truncate=False)
```

---

## 2) current_date() and current_timestamp()

### 2.1 current_date()
Returns today’s date.

```python
df.select(current_date().alias("today_date")).show()
```

---

### 2.2 current_timestamp()
Returns current timestamp.

```python
df.select(current_timestamp().alias("now_ts")).show(truncate=False)
```

---

## 3) to_date() and to_timestamp()

Raw data usually comes as string. We must convert it.

---

### 3.1 to_date()
Converts string to date.

```python
df2 = df.withColumn("join_date", to_date(col("join_date_str")))
df2.show()
df2.printSchema()
```

---

### 3.2 to_timestamp()
Converts string to timestamp.

```python
df3 = df2.withColumn("event_ts", to_timestamp(col("event_ts_str")))
df3.show(truncate=False)
df3.printSchema()
```

---

### 3.3 Custom date format
If your date is not in yyyy-MM-dd format:

```python
df_custom = spark.createDataFrame([(1, "05/02/2026")], ["id", "date_str"])

df_custom.withColumn("dt", to_date(col("date_str"), "dd/MM/yyyy")).show()
```

---

## 4) date_add() and date_sub()

Used to add or subtract days from a date.

---

### 4.1 date_add()
Add days:

```python
df3.select(
    col("join_date"),
    date_add(col("join_date"), 7).alias("join_date_plus_7")
).show()
```

---

### 4.2 date_sub()
Subtract days:

```python
df3.select(
    col("join_date"),
    date_sub(col("join_date"), 7).alias("join_date_minus_7")
).show()
```

---

## 5) datediff()

Returns number of days between two dates.

Example: days between today and join_date

```python
df3.select(
    col("join_date"),
    datediff(current_date(), col("join_date")).alias("days_since_join")
).show()
```

---

## 6) months_between()

Returns number of months between two dates.

```python
df3.select(
    col("join_date"),
    months_between(current_date(), col("join_date")).alias("months_since_join")
).show()
```

---

## 7) year(), month(), dayofmonth()

Used to extract parts of date.

```python
df3.select(
    col("join_date"),
    year(col("join_date")).alias("join_year"),
    month(col("join_date")).alias("join_month"),
    dayofmonth(col("join_date")).alias("join_day")
).show()
```

---

## 8) trunc()

`trunc(date, format)` truncates a date to a specific level.

Common formats:
- "year"
- "month"

Example: truncate join_date to month start

```python
df3.select(
    col("join_date"),
    trunc(col("join_date"), "month").alias("month_start")
).show()
```

---

## 9) Real Data Engineering Use Cases

### 9.1 Create partition columns (year, month, day)

```python
df_part = df3     .withColumn("year", year(col("join_date")))     .withColumn("month", month(col("join_date")))     .withColumn("day", dayofmonth(col("join_date")))

df_part.show()
```

---

### 9.2 Filter last 7 days data

```python
df_last7 = df3.filter(col("join_date") >= date_sub(current_date(), 7))
df_last7.show()
```

---

### 9.3 Calculate age of record in days

```python
df_age = df3.withColumn(
    "record_age_days",
    datediff(current_date(), col("join_date"))
)
df_age.show()
```

---

## 10) Best Practices

✅ Always convert string → date/timestamp early  
✅ Use date functions instead of string operations  
✅ For partitioning, use year/month/day columns  
✅ Always check timezone when working with timestamps  
✅ Use trunc() for month-level grouping  

---

## 11) Summary (Quick Notes)

- `current_date()` returns today’s date.
- `current_timestamp()` returns current timestamp.
- `to_date()` converts string → date.
- `to_timestamp()` converts string → timestamp.
- `date_add()` adds days, `date_sub()` subtracts days.
- `datediff()` returns difference in days.
- `months_between()` returns difference in months.
- `year()`, `month()`, `dayofmonth()` extract date parts.
- `trunc()` truncates date to year/month.

---

✅ Next File: `12_complex_datatypes.md`



