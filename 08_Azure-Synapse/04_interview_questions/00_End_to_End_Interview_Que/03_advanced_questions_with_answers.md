# 03 — Advanced Synapse Interview Questions (With Answers)

## Dedicated SQL Pool Advanced
### 1) How do you choose distribution key?
**Answer:**
- High cardinality
- Even distribution
- Used in joins
- Avoid skew

### 2) What is replicated table limitation?
**Answer:** Works only for small tables. Replication increases storage and refresh overhead.

### 3) What is workload management?
**Answer:** Controlling concurrency and resource allocation using workload groups and resource classes.

### 4) How do you handle high concurrency dashboards?
**Answer:**
- Proper distribution
- Use materialized views / aggregated marts
- Scale DWU
- Workload management

### 5) What is result set caching?
**Answer:** Dedicated pool can reuse results of identical queries to improve performance (when enabled).

---

## Serverless SQL Advanced
### 6) What is the best file format for serverless?
**Answer:** Parquet (columnar, compressed).

### 7) What is the biggest performance killer in serverless?
**Answer:** Too many small files and scanning CSV repeatedly.

### 8) Why CETAS is powerful?
**Answer:** It writes optimized parquet results to ADLS, reducing future scans.

---

## Spark Advanced
### 9) Delta Lake benefits?
**Answer:**
- ACID transactions
- Schema enforcement
- Time travel
- MERGE support
- Efficient incremental processing

### 10) Synapse Spark vs Databricks?
**Answer:** Databricks is more mature and feature-rich. Synapse Spark is good for integrated Azure analytics.

---

## Security + Networking
### 11) Managed VNet in Synapse?
**Answer:** A secured network boundary where Synapse runs in a managed virtual network.

### 12) Private endpoints?
**Answer:** Private network access to ADLS/KeyVault/SQL without public internet.

### 13) Data exfiltration protection?
**Answer:** Prevents data from being accessed from unauthorized networks.

---

## Monitoring
### 14) How do you troubleshoot slow queries?
**Answer:**
- Check data movement
- Check skew
- Check missing statistics
- Check distribution mismatch
- Check partitions

### 15) How do you debug pipeline failures?
**Answer:**
- Check activity output
- Check linked service authentication
- Check permissions
- Check integration runtime

---

## Cost Optimization
### 16) How to reduce dedicated pool cost?
**Answer:**
- Pause when idle
- Scale down for dev
- Reserved capacity for prod

### 17) How to reduce serverless cost?
**Answer:**
- Parquet + partitions
- Avoid SELECT *
- CETAS curated layer
