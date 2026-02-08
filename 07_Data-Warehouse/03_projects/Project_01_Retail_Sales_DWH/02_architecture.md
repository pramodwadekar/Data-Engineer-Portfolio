# 02 — Architecture

## High level flow
Sources (OLTP / CSV)
   |
   v
Staging tables (stg_*)
   |
   v
DWH Core (dim_* + fact_sales)
   |
   v
Data Mart (mart_monthly_sales, mart_top_products)
   |
   v
BI Tool (Power BI / Tableau)

## Layers
- Staging: raw extracts
- Core: conformed dimensions + facts
- Mart: aggregated tables for dashboards
