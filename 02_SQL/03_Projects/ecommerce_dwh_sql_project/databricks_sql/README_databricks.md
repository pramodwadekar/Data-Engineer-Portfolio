# Databricks SQL Version (Spark SQL)

## What is included
- Raw tables (Delta)
- Staging tables (cleaned)
- DWH tables (dim + fact)
- MERGE for incremental load
- KPI queries
- DQ checks

Run order:
1. 01_dbx_raw_schema.sql
2. 02_dbx_cleaning.sql
3. 03_dbx_dim_fact.sql
4. 04_dbx_incremental_merge.sql
5. 05_dbx_kpi_queries.sql
6. 06_dbx_dq_checks.sql
