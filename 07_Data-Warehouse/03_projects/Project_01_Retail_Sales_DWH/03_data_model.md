# 03 — Data Model (Star Schema)

## Dimensions
- dim_date
- dim_customer (SCD2)
- dim_product (SCD2)
- dim_store

## Fact
- fact_sales
  - Grain: 1 row per (order_id, product_id)

## Key points
- Facts store surrogate keys
- Dimensions store descriptive attributes
- SCD2 stores history
