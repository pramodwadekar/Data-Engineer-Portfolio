# Practical 04 — Serverless SQL: CETAS (Gold Layer)

## Goal
Materialize curated parquet in ADLS.

```sql
CREATE SCHEMA gold;
GO

CREATE EXTERNAL TABLE gold.monthly_sales
WITH (
  LOCATION='gold/monthly_sales/',
  DATA_SOURCE=adls_src,
  FILE_FORMAT=parquet_format
)
AS
SELECT
  YEAR(order_date) AS sales_year,
  MONTH(order_date) AS sales_month,
  SUM(amount) AS total_sales
FROM dbo.ext_orders
GROUP BY YEAR(order_date), MONTH(order_date);
```

## Interview point
CETAS reduces repeated scans and improves performance.
