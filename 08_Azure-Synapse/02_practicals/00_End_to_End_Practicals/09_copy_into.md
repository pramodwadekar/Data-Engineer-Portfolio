# Practical 09 — COPY INTO (Dedicated SQL Pool)

```sql
COPY INTO dwh.fact_sales
FROM 'https://<storage>.dfs.core.windows.net/curated/fact_sales/'
WITH (
  FILE_TYPE = 'PARQUET',
  MAXERRORS = 0
);
```

## Best practices
- Use parquet
- Avoid small files
- Stage first then load

## Interview point
COPY INTO is preferred bulk load.
