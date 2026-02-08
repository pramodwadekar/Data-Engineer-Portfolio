# 02 - Dimensional Modeling Questions (Interview Q&A)

## 1) Star schema vs Snowflake schema?
- Star: denormalized dims, fewer joins, faster BI
- Snowflake: normalized dims, more joins, less redundancy

## 2) Why star schema is preferred for BI?
Because it reduces joins and simplifies reporting.

## 3) What is grain?
Grain defines what one row represents in a fact table.

Example:
- one row per order_line

## 4) What is a conformed dimension?
A dimension shared across multiple fact tables (DimDate, DimCustomer).

## 5) What is surrogate key?
Warehouse-generated stable key, used instead of natural key.

---
