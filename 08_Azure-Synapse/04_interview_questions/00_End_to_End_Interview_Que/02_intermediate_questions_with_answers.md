# 02 — Intermediate Synapse Interview Questions (With Answers)

## Dedicated SQL Pool (MPP)
### 1) What is MPP?
**Answer:** Massively Parallel Processing where data is distributed across multiple compute nodes for parallel query execution.

### 2) What are distribution types in dedicated SQL pool?
**Answer:**
- HASH
- ROUND_ROBIN
- REPLICATE

### 3) When to use HASH distribution?
**Answer:** For large fact tables, especially when joining frequently on the distribution key.

### 4) When to use REPLICATE?
**Answer:** For small dimension tables to avoid data movement.

### 5) What is data movement?
**Answer:** Shuffling data between nodes during joins/aggregations when distributions don’t align.

### 6) What is data skew?
**Answer:** Uneven distribution of rows across nodes, causing one node to do most work.

### 7) How do you fix skew?
**Answer:**
- Choose better distribution key
- Use ROUND_ROBIN for staging
- Replicate small tables
- Pre-aggregate or redesign joins

---

## Performance
### 8) Why columnstore index is used?
**Answer:** It provides compression and fast scanning for analytics queries.

### 9) Partitioning benefit?
**Answer:** Partition pruning reduces scanned partitions → faster queries.

### 10) Why statistics matter?
**Answer:** Synapse optimizer needs stats for correct execution plans. Missing stats leads to slow queries.

---

## Serverless SQL
### 11) How do you optimize serverless queries?
**Answer:**
- Use Parquet
- Partition folders by date
- Select only required columns
- Avoid many small files
- Use CETAS for curated datasets

---

## Loading
### 12) COPY INTO vs PolyBase?
**Answer:** COPY INTO is simpler and preferred. PolyBase is older and requires external objects.

### 13) Best practice for loading?
**Answer:** Stage data as parquet in ADLS, then bulk load into SQL pool.

---

## Pipelines
### 14) What is watermark incremental load?
**Answer:** Store last processed timestamp and load only rows with updated_ts > last_ts.

### 15) What is idempotency in pipelines?
**Answer:** Rerunning pipeline should not create duplicates.

---

## Spark
### 16) Why Spark + SQL pool together?
**Answer:** Spark handles transformations, SQL pool serves BI dashboards.

---

## Security
### 17) How to secure secrets?
**Answer:** Use Managed Identity and Key Vault.

### 18) How to implement RLS?
**Answer:** Create security predicate function and apply it to tables based on user context.
