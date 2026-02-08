# 01 — Data Model (Star Schema)

## Dimensions
- dim_date (replicated)
- dim_customer (replicated)
- dim_product (replicated)
- dim_store (replicated)

## Fact
- fact_sales (hash distributed + columnstore)
Grain: 1 row per order item.

## Marts
- mart_monthly_sales
- mart_store_performance
