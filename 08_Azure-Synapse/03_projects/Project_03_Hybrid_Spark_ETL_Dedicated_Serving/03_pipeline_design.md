# 03 — Pipeline Design (Orchestration)

## Pipeline stages
1. Copy raw data to ADLS raw/
2. Run Spark notebook: Bronze → Silver
3. Run Spark notebook: Silver → Gold
4. Load Gold into Dedicated SQL pool (COPY INTO)
5. Run validation queries
6. Update watermark table

## Incremental approach
- Watermark stored in SQL table
- Only new partitions processed
