# Project 03: Databricks SQL Dashboard (Marketing Analytics)

## 📌 Overview
This project is designed for Databricks interviews where they ask:
- Databricks SQL
- SQL Warehouses
- Dashboards
- Alerts
- Refresh schedules
- Gold layer analytics tables

---

## 🎯 Why this project is different?
Most candidates show only ETL.

This project shows:
- SQL warehouse usage
- BI-style reporting
- dashboard creation mindset
- alerting + monitoring

---

## 🧱 Dataset
- `campaigns.csv`
- `marketing_events.csv`

---

## 🧪 What you will build
### Delta tables
- silver_campaigns
- silver_marketing_events
- gold_campaign_kpis
- gold_daily_revenue

### Dashboard
- Revenue by channel
- Conversion rate
- Top campaigns
- City performance

### Alerts
- Daily revenue below threshold
- Conversion rate drop

---

## ▶️ Run Steps
1. Upload CSVs to:
   - `dbfs:/FileStore/sql_dashboard/raw/`
2. Run notebook:
   - `01_load_silver_tables`
3. Run SQL scripts in `/sql/`
4. Create SQL dashboard in Databricks SQL UI

---

## 💬 Interview Explanation
“I created Databricks SQL gold KPI tables, built a dashboard on SQL Warehouse, and configured refresh + alerts for marketing analytics.”

