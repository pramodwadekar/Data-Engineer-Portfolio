# Practical 03 — Serverless SQL: External Tables

## Goal
Create reusable metadata on top of lake files.

```sql
CREATE DATABASE lake_db;
GO

CREATE EXTERNAL DATA SOURCE adls_src
WITH ( LOCATION = 'https://<storage>.dfs.core.windows.net/' );

CREATE EXTERNAL FILE FORMAT parquet_format
WITH ( FORMAT_TYPE = PARQUET );

CREATE EXTERNAL TABLE dbo.ext_orders (
  order_id INT,
  customer_id INT,
  order_date DATE,
  amount DECIMAL(18,2)
)
WITH (
  LOCATION = 'raw/orders/',
  DATA_SOURCE = adls_src,
  FILE_FORMAT = parquet_format
);
```

## Interview point
External tables help BI and reusability.
