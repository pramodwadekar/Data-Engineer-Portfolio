# 04 — Build Steps (End-to-End)

## Step 1: Create staging tables
- stg_customers
- stg_products
- stg_stores
- stg_orders
- stg_order_items

## Step 2: Create dimension tables
- dim_date
- dim_customer (SCD2)
- dim_product (SCD2)
- dim_store

## Step 3: Create fact table
- fact_sales

## Step 4: Load strategy
- Initial full load
- Incremental load using watermark
- Merge/upsert for dimensions

## Step 5: Data quality checks
- Null checks
- Referential integrity
- Duplicate current rows

## Step 6: Create marts
- mart_monthly_sales
- mart_store_performance
