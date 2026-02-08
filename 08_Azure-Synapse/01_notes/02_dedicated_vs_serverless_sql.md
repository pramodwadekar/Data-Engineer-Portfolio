# 02 - Dedicated SQL Pool vs Serverless SQL Pool

## Serverless SQL pool
### What it is
- Pay-per-query
- No provisioning
- Query files directly in ADLS (Parquet/CSV/JSON)

### Best for
- ad-hoc exploration
- data lake querying
- quick BI over Parquet

### Key features
- OPENROWSET
- External tables
- CETAS (Create External Table As Select)

### Limitations
- not ideal for heavy concurrent DW workloads
- some T-SQL limitations

---

## Dedicated SQL pool
### What it is
- Provisioned MPP data warehouse
- You choose DWU (compute units)
- Data stored inside Synapse (managed storage)

### Best for
- enterprise DW
- high concurrency reporting
- consistent performance

### Key features
- Distribution (hash/round-robin/replicated)
- Columnstore indexes
- Materialized views
- Workload management

---

## Interview answer
> Use Serverless for lake exploration and Dedicated for curated DW with predictable performance.

---
