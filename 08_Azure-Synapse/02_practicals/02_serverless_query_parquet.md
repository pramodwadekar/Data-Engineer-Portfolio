# 02 - Serverless SQL Query Parquet (Practical)

## Goal
Query parquet in ADLS using OPENROWSET.

### Example
```sql
SELECT TOP 20 *
FROM OPENROWSET(
    BULK 'https://<storage>.dfs.core.windows.net/raw/events/*.parquet',
    FORMAT='PARQUET'
) AS rows;
```

## Best Practices
- Always select required columns
- Partition folders by date for pruning

---
