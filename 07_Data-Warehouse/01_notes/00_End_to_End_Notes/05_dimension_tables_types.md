# 05 — Dimension Tables (Types + Design Patterns)

## 1) What is a Dimension Table?
Dimension tables store descriptive attributes about business entities.

Examples:
- Customer
- Product
- Date
- Store
- Employee

---

## 2) Common dimension patterns

### a) Conformed Dimension
Shared across marts for consistency.

### b) Role-Playing Dimension
Same dimension used multiple times in fact table.

### c) Junk Dimension
Combines many low-cardinality flags into one dimension.
Example:
- is_promo
- is_gift
- is_returned

### d) Mini Dimension
Used when dimension has rapidly changing attributes.
Example:
Customer:
- age_band
- income_band
- credit_score_band

### e) Outrigger Dimension
A dimension referencing another dimension.
Example:
DimCustomer references DimGeography.

(Use carefully; can cause snowflaking.)

### f) Bridge Table
Used for many-to-many relationships.
Example:
Customer ↔ Multiple Segments

---

## 3) Surrogate Keys vs Natural Keys
### Natural Key
Comes from source system.
Example:
customer_id from CRM

### Surrogate Key
Generated in warehouse.
Example:
customer_sk (identity/int)

#### Why surrogate keys?
- Stable even if source changes
- Supports SCD Type 2 history
- Avoids multi-source collisions

---

## 4) Date Dimension (Must have)
A Date dimension includes:
- date_sk
- full_date
- day
- month
- quarter
- year
- week
- is_weekend
- fiscal_month
- fiscal_year

---

## 5) Best practices
- Keep dimensions descriptive
- Avoid too many NULLs
- Keep naming consistent
- Maintain conformed dimensions

---

## 6) Interview questions
- What is junk dimension?
- What is mini dimension?
- Why surrogate key?
- What is bridge table?
