# 05 - Copy SQL Table to ADLS as Parquet (Practical)

## Goal
Copy SQL table data into ADLS as Parquet for analytics.

---

## Scenario
Source: Azure SQL table `dbo.orders`  
Target: ADLS `bronze/orders/` as parquet

---

## Steps

### 1) Create pipeline
Name: `pl_copy_sql_to_adls_parquet`

---

### 2) Copy activity source
Source dataset: Azure SQL  
Query:
```sql
SELECT * FROM dbo.orders;
```

---

### 3) Sink dataset
ADLS parquet dataset

Sink path:
```text
@concat('bronze/orders/run_date=', pipeline().parameters.run_date, '/')
```

---

### 4) Performance
- Enable parallel copy
- Use DIU default first

---

## Interview Points
- Parquet is columnar, better for Spark
- This is typical bronze ingestion
