-- Query parquet file directly
SELECT TOP 100 *
FROM OPENROWSET(
  BULK 'https://<storage>.dfs.core.windows.net/raw/orders/*.parquet',
  FORMAT='PARQUET'
) AS rows;
