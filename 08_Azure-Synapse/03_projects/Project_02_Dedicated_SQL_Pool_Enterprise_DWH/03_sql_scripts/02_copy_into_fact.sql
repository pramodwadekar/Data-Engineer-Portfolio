-- COPY INTO load
COPY INTO dwh.fact_sales
FROM 'https://<storage>.dfs.core.windows.net/curated/fact_sales/'
WITH (
  FILE_TYPE = 'PARQUET',
  MAXERRORS = 0
);
