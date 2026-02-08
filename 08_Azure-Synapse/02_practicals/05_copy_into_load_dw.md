# 05 - COPY INTO Load into Dedicated (Practical)

## Goal
Load data from ADLS into dedicated pool using COPY INTO.

```sql
COPY INTO dbo.stage_events
FROM 'https://<storage>.dfs.core.windows.net/raw/events/'
WITH ( FILE_TYPE='PARQUET' );
```

Then CTAS into final table.

---
