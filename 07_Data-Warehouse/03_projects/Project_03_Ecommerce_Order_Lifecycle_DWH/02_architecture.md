# 02 — Architecture

E-commerce OLTP (orders, payments, shipments, returns)
   |
   v
Staging tables (stg_orders, stg_payments, stg_shipments, stg_returns, stg_order_items)
   |
   v
Core DWH
- dim_customer (SCD2)
- dim_product
- dim_delivery_partner
- dim_date
- fact_order_items (transaction)
- fact_order_lifecycle (accumulating snapshot)
   |
   v
Process Marts
- mart_sla_delivery
- mart_partner_performance
- mart_funnel_metrics
