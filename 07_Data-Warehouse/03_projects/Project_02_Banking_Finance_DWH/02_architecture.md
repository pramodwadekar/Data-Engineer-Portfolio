# 02 — Architecture

## High level
Core Banking OLTP
   |
   v
Staging (stg_customers, stg_accounts, stg_branches, stg_transactions, stg_daily_balances)
   |
   v
Core DWH
- dim_customer (SCD2)
- dim_account (SCD2)
- dim_branch
- dim_date
- fact_transactions (transaction fact)
- fact_account_balance_snapshot (daily snapshot)
   |
   v
Finance Marts
- mart_daily_deposits
- mart_branch_growth
- mart_customer_avg_balance
   |
   v
BI Reports / Audit

## Why snapshot?
Balance is a semi-additive measure across time.
So we store daily snapshot to enable trend reporting.
