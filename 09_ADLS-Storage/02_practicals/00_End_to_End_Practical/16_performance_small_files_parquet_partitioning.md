# Practical 16 — Performance: Small Files + Parquet + Partitions

## Goal
Understand how storage layout impacts performance.

## Steps
1. Upload many small CSV files (simulate)
2. Query in Synapse serverless:
   - slow and expensive
3. Convert to parquet using Spark
4. Partition folders by date
5. Query again:
   - faster and cheaper

## Interview point
File format + partitions = performance + cost.
