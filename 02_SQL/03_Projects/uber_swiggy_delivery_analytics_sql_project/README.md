# 🚚 Uber/Swiggy Delivery Analytics + SLA Monitoring (SQL)

## Project Overview
This is an advanced Data Engineering SQL project based on **food delivery / logistics domain**.

This project is designed like real-world analytics pipelines where companies monitor:
- Delivery SLA performance
- Late delivery rate
- Driver performance
- Restaurant performance
- City and zone-wise delivery trends

It includes:
- Raw ➝ Staging ➝ DWH layers
- Data cleaning (real bad data)
- Fact & dimension modeling
- SLA logic (late deliveries)
- KPI queries
- Databricks SQL (Delta) version

---

## Dataset
`sample_data/`
- customers.csv
- drivers.csv
- restaurants.csv
- orders.csv

⚠️ This dataset intentionally contains bad data:
- duplicates
- null values
- invalid statuses
- negative distance
- missing ETA

---

## Warehouse Model
### Dimensions
- dim_customer
- dim_driver
- dim_restaurant
- dim_date

### Facts
- fact_orders
- fact_sla

---

## SLA Logic
A delivery is considered **LATE** if:

`actual_delivery_ts > estimated_delivery_ts`

---

## Databricks SQL Version
Inside `databricks_sql/` folder.
