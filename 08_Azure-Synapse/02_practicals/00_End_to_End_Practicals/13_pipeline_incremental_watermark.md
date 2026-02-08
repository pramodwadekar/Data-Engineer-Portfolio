# Practical 13 — Pipeline Incremental Load (Watermark)

## Step 1: Watermark table
```sql
CREATE TABLE etl.watermark (
  pipeline_name VARCHAR(100),
  last_ts DATETIME
);
INSERT INTO etl.watermark VALUES ('orders_incremental','1900-01-01');
```

## Step 2: Pipeline
- Lookup last_ts
- Copy with filter: updated_ts > last_ts
- Update watermark after success

## Interview point
Most common real-world incremental pattern.
