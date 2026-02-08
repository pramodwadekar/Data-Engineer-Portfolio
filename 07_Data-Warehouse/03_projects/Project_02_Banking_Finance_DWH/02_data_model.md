# 02 — Data Model

## Dimensions
- dim_date
- dim_customer (SCD2)
- dim_account (SCD2)
- dim_branch

## Facts
### fact_account_balance_snapshot (Periodic Snapshot)
Grain:
- 1 row per account per day

Measures:
- balance_amount (semi-additive)
- credit_limit
- available_balance

### fact_transactions (Transaction fact)
Grain:
- 1 row per transaction_id
