# 11 - Watermark Incremental Load from SQL (Practical)

## Goal
Build incremental load using watermark column.

---

## Scenario
SQL table: `dbo.orders`
Columns:
- order_id
- updated_at

Control table: `dbo.watermark_control`
Columns:
- table_name
- last_watermark

---

## Steps
1. Lookup watermark:
```sql
SELECT last_watermark
FROM dbo.watermark_control
WHERE table_name='orders';
```

2. Copy query:
```text
@concat(
'SELECT * FROM dbo.orders WHERE updated_at > ''',
activity('LookupWatermark').output.firstRow.last_watermark,
''''
)
```

3. After copy:
Stored procedure to update watermark

---

## Interview Points
- most asked ADF topic
- must mention idempotency and overlap buffer
