# 02 - Dimensional Modeling (Star vs Snowflake)

## What is Dimensional Modeling?
A modeling technique optimized for analytics.

Instead of highly normalized OLTP design, DW uses:
- **Facts** (measurements)
- **Dimensions** (context)

---

## Star Schema
### Structure
- One fact table in center
- Multiple dimension tables around it

### Benefits
- fewer joins
- faster queries
- simple for BI tools
- easy to understand

### Example
FactSales:
- date_key
- customer_key
- product_key
- store_key
- sales_amount

DimCustomer:
- customer_key
- name
- city
- segment

---

## Snowflake Schema
Dimensions are further normalized into sub-dimensions.

### Benefits
- less redundancy
- better for very large dimensions

### Drawbacks
- more joins
- slower BI queries
- complex for business users

---

## Which is preferred?
In most DW interviews:
✅ Star schema is preferred (Kimball).

Snowflake is used when:
- dimension is huge
- strong normalization is needed

---

## Interview Questions
- Why star schema is faster?
- When snowflake is useful?
- How to choose grain?

---
