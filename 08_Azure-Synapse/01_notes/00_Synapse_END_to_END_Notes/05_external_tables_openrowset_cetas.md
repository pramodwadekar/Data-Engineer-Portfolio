# 05 — Serverless SQL: External Tables, OPENROWSET, CETAS (Very Important)

## OPENROWSET
Query files directly:
```sql
SELECT TOP 100 *
FROM OPENROWSET(
  BULK 'https://<storage>.dfs.core.windows.net/raw/orders/*.parquet',
  FORMAT='PARQUET'
) AS rows;
```

### Use cases
- exploration
- quick validation
- no metadata needed

---

## External Table (Serverless)
Creates metadata on top of files.

Steps:
1. Create database
2. Create external data source
3. Create external file format
4. Create external table

---

## CETAS
Create External Table As Select.
Used to:
- create curated external datasets
- materialize query results in ADLS

Example:
```sql
CREATE EXTERNAL TABLE gold.monthly_sales
WITH (
  LOCATION='gold/monthly_sales/',
  DATA_SOURCE=my_adls,
  FILE_FORMAT=parquet_format
)
AS
SELECT year(order_date), month(order_date), SUM(amount)
FROM ext.sales
GROUP BY year(order_date), month(order_date);
```

---

## Interview points
- CETAS improves performance by writing optimized parquet
- Serverless cost = TB scanned → optimize file layout
