# 04 - Serverless SQL: OPENROWSET, External Tables, CETAS

## OPENROWSET
Query files directly:

```sql
SELECT TOP 10 *
FROM OPENROWSET(
    BULK 'https://<storage>.dfs.core.windows.net/raw/sales/*.parquet',
    FORMAT='PARQUET'
) AS rows;
```

## External tables
Create metadata for files:

```sql
CREATE EXTERNAL DATA SOURCE ds_raw
WITH ( LOCATION = 'https://<storage>.dfs.core.windows.net/raw' );

CREATE EXTERNAL FILE FORMAT ff_parquet
WITH ( FORMAT_TYPE = PARQUET );

CREATE EXTERNAL TABLE ext_sales
(
  order_id INT,
  amount FLOAT
)
WITH (
  LOCATION = '/sales/',
  DATA_SOURCE = ds_raw,
  FILE_FORMAT = ff_parquet
);
```

## CETAS
Create a new parquet dataset from query output:

```sql
CREATE EXTERNAL TABLE curated_sales
WITH (
  LOCATION='/curated/sales/',
  DATA_SOURCE=ds_raw,
  FILE_FORMAT=ff_parquet
)
AS
SELECT customer_id, SUM(amount) total_amount
FROM ext_sales
GROUP BY customer_id;
```

---
