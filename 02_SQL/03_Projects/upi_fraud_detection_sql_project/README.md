# 💳 UPI Transactions Analytics + Fraud Detection (SQL)

## 📌 Project Overview
This is an advanced SQL Data Engineering project based on the **Payments / UPI domain**.

In this project, raw UPI transaction data is:
- cleaned and validated
- converted into analytics-ready tables (dim + fact)
- analyzed for KPIs
- processed using fraud detection rules (SQL + Window Functions)

This project is designed like a real Data Engineering pipeline:
**Raw ➝ Staging ➝ Data Warehouse ➝ Fraud Alerts ➝ Analytics**

---

## 🎯 Why this project?
Fraud detection and payments analytics is one of the most common real-world use cases in Data Engineering.

This project demonstrates:
✅ Data cleaning and validation  
✅ Dim + Fact modeling  
✅ Window functions for fraud rules  
✅ Data quality checks  
✅ Analytics queries  
✅ PostgreSQL + Databricks SQL versions  

---

## 🗂️ Dataset
`sample_data/`
- `users.csv`
- `merchants.csv`
- `transactions.csv`

⚠️ This dataset intentionally contains bad data:
- negative amounts
- invalid txn_status
- invalid merchant_id
- null timestamps
- duplicates

---

## 🏗️ Tables Created

### 🔹 Raw Layer (Dirty Data)
- `upi_raw.users_raw`
- `upi_raw.merchants_raw`
- `upi_raw.transactions_raw`

### 🔹 Staging Layer (Cleaned Data)
- `upi_stg.users_stg`
- `upi_stg.merchants_stg`
- `upi_stg.transactions_stg`

### 🔹 DWH Layer (Analytics Ready)
- `upi_dwh.dim_user`
- `upi_dwh.dim_merchant`
- `upi_dwh.fact_transactions`
- `upi_dwh.fraud_alerts`

---

## 🚨 Fraud Rules Implemented
1. **HIGH_VALUE_TXN**  
   Transaction amount > ₹50,000

2. **MANY_TXN_2_MIN**  
   5+ successful transactions in last 2 minutes for same user

3. **FAILED_10_MIN**  
   3+ failed transactions in last 10 minutes for same user

4. **DEVICE_MULTI_USER**  
   Same device used by 3+ different users

---

## 📊 KPIs Implemented
- Total transactions
- Success rate
- Daily transaction volume
- Top merchants by revenue
- Fraud alerts count by rule

---

## ⚡ Performance Optimization
Indexes are created on:
- `(user_id, txn_ts)`
- `txn_status`

These help because fraud rules and analytics queries frequently filter by time and user.

---

## ▶️ How to Run (PostgreSQL)
Run SQL files in this order:

1. `01_raw_schema.sql`
2. Load CSV into raw tables
3. `02_data_cleaning.sql`
4. `03_dim_fact_tables.sql`
5. `04_fraud_rules.sql`
6. `05_analytics_queries.sql`
7. `06_data_quality_checks.sql`

---

## 🧠 Databricks SQL Version
Databricks SQL scripts are inside:

`databricks_sql/`

---

## 👨‍💻 Author
**Pramod Wadekar**

