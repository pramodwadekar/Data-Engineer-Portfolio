# 02 — Data Model

## Dimensions
- dim_date
- dim_customer (SCD2)
- dim_delivery_partner
- dim_location

## Facts
### fact_order_lifecycle (Accumulating Snapshot)
Grain:
- 1 row per order_id

Columns:
- order_created_date_sk
- payment_date_sk
- packed_date_sk
- shipped_date_sk
- delivered_date_sk
- returned_date_sk
- total_amount
- order_status

### fact_order_items (Transaction)
Grain:
- 1 row per order_id + product_id
