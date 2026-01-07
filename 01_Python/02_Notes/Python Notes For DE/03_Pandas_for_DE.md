# Pandas for Data Engineering

## 1. What is Pandas?
Pandas is a Python library used for data manipulation and analysis.
In Data Engineering, pandas is mainly used for **small to medium data processing,
data validation, and preprocessing before big data frameworks like Spark**.

---

## 2. Why Pandas is Used in Data Engineering
Pandas is used in Data Engineering because:

- Simple and expressive API
- Fast for small and medium datasets
- Excellent for data validation and quality checks
- Useful for prototyping ETL logic
- Easy integration with CSV, JSON, and Parquet files

Pandas helps Data Engineers **quickly inspect and transform data**
before moving to large-scale processing.

---

## 3. Where Pandas is Used in Real DE Projects
Pandas is commonly used for:

- Reading raw data files
- Data cleansing and preprocessing
- Validating schema and data quality
- Aggregations on small datasets
- Creating intermediate datasets
- Testing transformation logic locally

**Example:**
df = pd.read_csv("raw/sales.csv")

## 4. Common Pandas Operations for Data Engineering
**a) Reading and Writing Data**

pd.read_csv("data.csv")
pd.read_json("data.json")
pd.read_parquet("data.parquet")

**Writing data:**

df.to_csv("output.csv", index=False)
df.to_parquet("output.parquet")

**b) Filtering Data**

Used to select required records.

df[df["amount"] > 1000]

**c) Handling Missing Values**

Data Engineers must handle nulls explicitly.

df.dropna()
df.fillna(0)

**d) Aggregations (GroupBy)**

Very common in analytics pipelines.

df.groupby("category")["amount"].sum()

**e) Joins and Merges**

Used to combine datasets.

pd.merge(df1, df2, on="id", how="inner")

**5. Data Validation Using Pandas**

Pandas is often used to validate incoming data.

**Examples:**

df.isnull().sum()
df.dtypes
df.shape


**Validation ensures:**

- Schema consistency

- No unexpected nulls

- Correct data types

**6. Performance Considerations**

**Pandas is:**

- Memory bound

- Single-machine based

- Not suitable for big data

**Example of risky usage:**

pd.read_csv("very_large_file.csv")  # may cause memory issues


**7. Pandas vs PySpark (DE Perspective)**
   
| Aspect    | Pandas                    | PySpark              |
| --------- | ------------------------- | -------------------- |
| Data size | Small / Medium            | Large / Big Data     |
| Execution | Single machine            | Distributed          |
| Speed     | Fast locally              | Scales horizontally  |
| Usage     | Validation, preprocessing | Production pipelines |

**Rule of thumb:**

If data does not fit in memory → use Spark

**8. Best Practices for Using Pandas in DE**

- Use pandas only for small datasets

- Validate data early in the pipeline

- Avoid complex loops

- Prefer vectorized operations

- Move to Spark when data grows

**9. Common Mistakes**

- Processing big data in pandas

- Ignoring memory usage

- Chaining too many operations

- Skipping data validation

**10. Interview Perspective**

**Interviewers expect Data Engineers to:**

- Know when to use pandas

- Explain pandas vs Spark

- Demonstrate data validation logic

- Understand performance limitations

**Typical interview question:**

❓ Why is pandas not suitable for big data?
✅ Pandas runs on a single machine and is memory-bound.

**Key Takeaway**

Pandas is a support tool in Data Engineering.
It is excellent for validation and small-scale processing,
but production pipelines rely on Spark for scalability.



