-- Load gold delta exported as parquet into SQL pool
COPY INTO serving.monthly_sales
FROM 'https://<storage>.dfs.core.windows.net/gold/monthly_sales_parquet/'
WITH (
  FILE_TYPE='PARQUET'
);
