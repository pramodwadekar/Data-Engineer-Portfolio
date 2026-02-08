# 07 - Loading Data: COPY INTO vs PolyBase

## COPY INTO
Modern loading method.

- reads from ADLS
- supports parquet/csv
- fast

```sql
COPY INTO dbo.stage_sales
FROM 'https://<storage>.dfs.core.windows.net/raw/sales/'
WITH (
  FILE_TYPE = 'PARQUET'
);
```

## PolyBase
Older but still used.

## Interview
Prefer COPY INTO for new implementations.

---
