# 04 — Loading Data into Dedicated SQL Pool (COPY INTO vs PolyBase)

## Why loading is different in Synapse
Dedicated SQL pool is MPP.
To load fast:
- stage data in ADLS
- use parallel load methods

---

## COPY INTO
### What it is
A modern bulk load command.

### Benefits
- Simple syntax
- Works well for Parquet/CSV
- Supports credentials via Managed Identity

Example:
```sql
COPY INTO dbo.sales
FROM 'https://<storage>.dfs.core.windows.net/curated/sales/'
WITH (
  FILE_TYPE = 'PARQUET'
);
```

---

## PolyBase
### What it is
Older but still used.

Steps:
1. Create external data source
2. Create file format
3. Create external table
4. Load into internal table using CTAS/INSERT

---

## COPY INTO vs PolyBase
| Feature | COPY INTO | PolyBase |
|---|---|---|
| Simplicity | Easy | More objects |
| Speed | High | More setup |
| Use | Preferred | Legacy |

---

## Interview points
- Always stage files in ADLS
- Use Parquet for best performance
- Use large files (not many small files)
