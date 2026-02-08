# Practical 02 — Serverless SQL: OPENROWSET

## Goal
Query parquet/csv directly from ADLS.

## Query parquet
```sql
SELECT TOP 100 *
FROM OPENROWSET(
  BULK 'https://<storage>.dfs.core.windows.net/raw/orders/*.parquet',
  FORMAT='PARQUET'
) AS rows;
```

## Cost optimization
- Avoid `SELECT *`
- Use Parquet
- Partition folders by date

## Interview point
Serverless = pay per TB scanned.
