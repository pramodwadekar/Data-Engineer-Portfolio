# 12 — Cost Optimization (Very Important)

## Dedicated SQL Pool
- Pay for provisioned DWU
- Pause when not used
- Scale down for dev

## Serverless SQL
- Pay per TB scanned
- Use Parquet
- Partition by date
- Avoid SELECT *
- Use CETAS to create curated datasets

## Spark Pools
- Use auto-pause
- Use autoscale
