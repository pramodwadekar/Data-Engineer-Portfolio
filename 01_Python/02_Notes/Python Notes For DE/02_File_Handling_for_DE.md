# File Handling for Data Engineering

## 1. What is File Handling?
File handling refers to the process of reading, writing, and managing data
stored in files such as CSV, JSON, and Parquet, which are commonly used
as source and target formats in Data Engineering pipelines.

---

## 2. Why File Handling is Important in Data Engineering
In real-world Data Engineering projects:

- Most data arrives as files
- Upstream systems export data in file formats
- Data lakes store data as files
- Pipelines start and end with file operations

File handling is often the **first step** and **last step** of a data pipeline.

---

## 3. Where File Handling is Used in Real DE Projects
File handling is used in:

- Ingesting data from external systems
- Reading raw data into pipelines
- Writing transformed data to data lakes
- Archiving historical data
- Exchanging data between systems
- Backup and recovery workflows

Example:
```python
df = pd.read_csv("raw/customers.csv")

---

## 4. Common File Types Used in Data Engineering

## a) CSV (Comma-Separated Values)
- Structured, row-based format
- Easy to read and write
- Human-readable

**Use cases:**
- Small to medium datasets
- Data exports from databases
- Temporary data exchange

**Limitations:**
- No schema enforcement
- Larger file size
- Not optimized for analytics

   Structured, row-based text format.

   Read CSV:
   pd.read_csv("data/sales.csv")
   Write CSV:
   df.to_csv("output/sales_clean.csv", index=False)
---

### b) JSON (JavaScript Object Notation)
- Semi-structured format
- Supports nested data
- Key-value based

**Use cases:**
- API responses
- Event data
- Configuration files

**Challenges:**
- Nested structures increase complexity
- Larger file size compared to Parquet

b) JSON (JavaScript Object Notation)
   Semi-structured, key-value based format.

   Read JSON:
   import json
   data = json.load(open("data/events.json"))

   Using pandas:
   pd.read_json("data/events.json")

---

### c) Parquet
- Columnar file format
- Compressed and optimized
- Designed for analytics workloads

**Use cases:**
- Data lakes
- Big data processing
- Spark and cloud platforms

**Advantages:**
- Faster query performance
- Reduced storage cost
- Schema support

---
   Columnar, compressed, analytics-optimized format.

   Read Parquet:
   pd.read_parquet("data/sales.parquet")

   Write Parquet:
   df.to_parquet("output/sales.parquet")


## 5. Reading Files in Python (DE Perspective)

   Common methods:
   pd.read_csv("file.csv")
   pd.read_json("file.json")
   pd.read_parquet("file.parquet")

   Always validate data after reading:
   df.head()

## 6. Writing Files in Python

   Typical write operations:
   df.to_csv("output.csv", index=False)
   df.to_parquet("output.parquet")


## 5. Reading Files in Python (DE Perspective)

Common approaches:

- CSV: `pandas.read_csv()`
- JSON: `json.load()` or `pandas.read_json()`
- Parquet: `pandas.read_parquet()`

Data Engineers must always:
- Validate schema
- Handle missing files
- Check data quality

---

## 6. Writing Files in Python

Typical methods:
- `DataFrame.to_csv()`
- `DataFrame.to_parquet()`

Best practice:
- Avoid overwriting critical files
- Use versioned or timestamped outputs
- Store outputs in standardized locations

Typical write operations:
  df.to_csv("output.csv", index=False)
  df.to_parquet("output.parquet")


---

## 7. Best Practices for File Handling in DE
- Never assume file structure
- Handle file-not-found scenarios
- Avoid loading very large files into memory
- Validate data after reading
- Prefer Parquet over CSV for analytics
- Use Spark for large-scale file processing

Example (basic file existence check):
  import os
  os.path.exists("data/input.csv")


---

## 8. Common Mistakes
- Reading huge files using pandas
- Ignoring corrupt or partial files
- Hardcoding file paths
- Not validating input data
- Using CSV for large analytical workloads

Example of what not to do:
  pd.read_csv("very_large_file.csv")  # may crash memory


---

## 9. How File Handling Fits in a DE Pipeline

Raw Files (CSV / JSON)
↓
Python File Handling (validation, cleanup)
↓
Spark / Databricks Processing
↓
Parquet Output in Data Lake


Python handles **initial file interaction**,  
Spark handles **distributed processing**.

---

## 10. Interview Perspective
Interviewers expect Data Engineers to:

- Understand different file formats
- Explain when to use CSV vs Parquet
- Know limitations of Python file handling
- Explain how to handle missing or corrupt files

Typical interview question:

❓ *Why is Parquet preferred over CSV in Data Engineering?*  
✅ Parquet is columnar, compressed, and optimized for analytics workloads.

---

## Key Takeaway
File handling is a **core responsibility** of a Data Engineer.
Understanding file formats, limitations, and best practices
is essential for building reliable data pipelines.

