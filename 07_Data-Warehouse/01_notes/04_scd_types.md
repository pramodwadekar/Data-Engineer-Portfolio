# 04 - Slowly Changing Dimensions (SCD) Types

## What is SCD?
Dimensions change over time (customer city, product category).

SCD defines how to store changes.

---

## SCD Type 0 (No change)
Ignore changes.

---

## SCD Type 1 (Overwrite)
Update old value.
No history.

Used when:
- typo correction
- history not required

---

## SCD Type 2 (Full history) ⭐ Most important
Create new row with:
- new surrogate key
- effective_start_date
- effective_end_date
- is_current flag

Used when:
- customer address history
- product category changes

---

## SCD Type 3 (Limited history)
Store current + previous value in same row.

---

## SCD Type 4
Current table + history table.

---

## SCD Type 6 (Hybrid)
Combination of 1+2+3.

---

## Interview must know
- SCD2 implementation logic
- surrogate keys
- current record filter

---
