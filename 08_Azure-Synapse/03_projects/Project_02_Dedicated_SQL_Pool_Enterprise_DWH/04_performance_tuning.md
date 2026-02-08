# 04 — Performance Tuning Checklist

## Distribution
- Facts: HASH(order_id) or HASH(customer_sk)
- Small dims: REPLICATE

## Indexing
- Facts: CLUSTERED COLUMNSTORE
- Staging: HEAP

## Partitioning
- Partition large facts by date

## Statistics
- Create stats on join + filter columns

## Avoid
- Too many small files in COPY INTO
- Skewed distribution keys
