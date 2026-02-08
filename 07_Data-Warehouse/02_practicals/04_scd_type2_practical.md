# 04 - SCD Type 2 Implementation (Practical)

## Goal
Implement SCD2 for DimCustomer.

## Columns
- customer_sk (surrogate key)
- customer_id (natural key)
- name, city
- effective_start_date
- effective_end_date
- is_current

## Pseudo SQL Logic
1. Find changed customers
2. Expire old row (is_current=0, end_date=today)
3. Insert new row (is_current=1)

---
