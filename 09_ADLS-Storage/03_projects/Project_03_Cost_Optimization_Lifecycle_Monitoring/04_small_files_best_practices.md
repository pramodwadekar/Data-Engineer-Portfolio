# Small Files Best Practices

Small files cause:
- slow Spark reads
- slow serverless SQL scans
- high transaction cost

Fix:
- compact using Spark
- write parquet with larger file sizes
- partition correctly
