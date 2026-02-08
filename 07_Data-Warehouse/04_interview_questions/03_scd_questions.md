# 03 - SCD (Slowly Changing Dimensions) Questions (Interview Q&A)

## 1) What is SCD?
How we manage dimension attribute changes over time.

## 2) SCD Type 1?
Overwrite old value, no history.

## 3) SCD Type 2?
Insert new row with new surrogate key, keep history.
Columns:
- effective_start_date
- effective_end_date
- is_current

## 4) Why SCD2 is important?
Business often needs historical reporting.
Example:
Sales by customer city at the time of purchase.

## 5) SCD Type 3?
Store current + previous values in same row (limited history).

---
