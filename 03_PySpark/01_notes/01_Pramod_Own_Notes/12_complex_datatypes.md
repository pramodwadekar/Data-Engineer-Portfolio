# 12 - Complex Data Types (Array, Map, Struct) (PySpark)

This note covers complex/nested datatypes in PySpark:
- ArrayType
- MapType
- StructType (nested)
- explode(), explode_outer()
- posexplode()
- getItem()
- JSON flattening techniques
- nested JSON flattening

Complex data types are very common in:
- JSON APIs
- Event logs
- Kafka streaming data
- Semi-structured data lakes

---

## 1) Setup

```python
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, explode, explode_outer, posexplode
from pyspark.sql.types import StructType, StructField, StringType, IntegerType, ArrayType, MapType

spark = SparkSession.builder.appName("ComplexDataTypes").getOrCreate()
```

---

## 2) ArrayType

### 2.1 Create DataFrame with Array Column

```python
data = [
    (1, "Pramod", ["Java", "Python", "SQL"]),
    (2, "Akash",  ["SQL", "Excel"]),
    (3, "Rahul",  None)
]

df = spark.createDataFrame(data, ["id", "name", "skills"])
df.show(truncate=False)
df.printSchema()
```

Schema will show:
- skills: array<string>

---

### 2.2 Access Array Element using getItem()

```python
df.select(
    col("name"),
    col("skills").getItem(0).alias("first_skill")
).show(truncate=False)
```

---

### 2.3 Check Array Contains Value

```python
from pyspark.sql.functions import array_contains

df.select(
    col("name"),
    array_contains(col("skills"), "Python").alias("knows_python")
).show(truncate=False)
```

---

## 3) explode() and explode_outer()

### 3.1 explode()
Converts array into multiple rows.

```python
df_exploded = df.select("id", "name", explode(col("skills")).alias("skill"))
df_exploded.show(truncate=False)
```

⚠️ explode() removes rows where array is null.

---

### 3.2 explode_outer()
Keeps rows even if array is null.

```python
df_exploded_outer = df.select("id", "name", explode_outer(col("skills")).alias("skill"))
df_exploded_outer.show(truncate=False)
```

---

## 4) posexplode()

`posexplode()` returns:
- position (index)
- value

```python
df_pos = df.select("id", "name", posexplode(col("skills")).alias("pos", "skill"))
df_pos.show(truncate=False)
```

---

## 5) MapType

### 5.1 Create MapType DataFrame

```python
data = [
    (1, {"city": "Dhule", "state": "Maharashtra"}),
    (2, {"city": "Pune", "state": "Maharashtra"}),
    (3, None)
]

df_map = spark.createDataFrame(data, ["id", "address_map"])
df_map.show(truncate=False)
df_map.printSchema()
```

Schema will show:
- address_map: map<string,string>

---

### 5.2 Access Map Values using getItem()

```python
df_map.select(
    col("id"),
    col("address_map").getItem("city").alias("city"),
    col("address_map").getItem("state").alias("state")
).show(truncate=False)
```

---

## 6) StructType (Nested)

Struct is like an object inside a column.

---

### 6.1 Create DataFrame with Struct Column

```python
data = [
    (1, ("Dhule", "Maharashtra")),
    (2, ("Pune", "Maharashtra")),
    (3, None)
]

df_struct = spark.createDataFrame(data, ["id", "location"])
df_struct.show(truncate=False)
df_struct.printSchema()
```

---

### 6.2 Access Struct Fields

```python
df_struct.select(
    col("id"),
    col("location._1").alias("city"),
    col("location._2").alias("state")
).show(truncate=False)
```

---

## 7) Nested JSON Flattening Techniques (Most Important)

In real projects, data comes as nested JSON.

Example JSON structure:
```json
{
  "id": 1,
  "name": "Pramod",
  "address": {
    "city": "Dhule",
    "state": "Maharashtra"
  },
  "skills": ["Java", "Python"]
}
```

---

### 7.1 Read Nested JSON

```python
df_json = spark.read.option("multiline", "true").json("data/nested.json")
df_json.printSchema()
df_json.show(truncate=False)
```

---

### 7.2 Flatten Struct Columns (Select Nested Fields)

```python
df_flat = df_json.select(
    col("id"),
    col("name"),
    col("address.city").alias("city"),
    col("address.state").alias("state"),
    col("skills")
)

df_flat.show(truncate=False)
```

---

### 7.3 Flatten Arrays (explode skills)

```python
df_skills = df_flat.select(
    col("id"),
    col("name"),
    col("city"),
    explode_outer(col("skills")).alias("skill")
)

df_skills.show(truncate=False)
```

---

## 8) Real Data Engineering Use Cases

### 8.1 JSON API ingestion
- Read JSON
- Flatten nested struct
- Explode arrays
- Store in Parquet/Delta

---

### 8.2 Event Logs (Kafka)
Events often contain:
- nested fields
- arrays of attributes
- map-style properties

Spark is used to normalize them into a relational format.

---

## 9) Best Practices

✅ Flatten nested JSON as early as possible  
✅ Use explode_outer() for safe flattening  
✅ Use getItem() for arrays/maps  
✅ Avoid UDF for nested parsing  
✅ Keep schema stable for production pipelines  

---

## 10) Summary (Quick Notes)

- ArrayType stores list values.
- MapType stores key-value pairs.
- StructType stores nested object.
- `explode()` converts array → rows (drops null arrays).
- `explode_outer()` keeps null arrays.
- `posexplode()` gives position + value.
- `getItem()` extracts array element or map value.
- Nested JSON flattening is done using select + explode.

---

✅ Next File: `13_udf_vs_builtin.md`
