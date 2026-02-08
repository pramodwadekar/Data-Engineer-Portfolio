# 03 — Dimensional Modeling (Star Schema & Snowflake Schema)

## 1) What is Dimensional Modeling?
Dimensional modeling is a design technique for analytics databases where:
- Facts = measurable events
- Dimensions = descriptive context

It is optimized for:
- Fast aggregations
- BI queries
- Business-friendly reporting

---

## 2) Star Schema
### Structure
- 1 Fact table in center
- Many dimension tables around it
- Dimensions are usually denormalized

### Example
FactSales connects to:
- DimCustomer
- DimProduct
- DimDate
- DimStore

### Pros
✅ Simple  
✅ Best query performance  
✅ Easy for BI tools  

### Cons
❌ Dimension tables can become wide  

---

## 3) Snowflake Schema
### Structure
- Fact table in center
- Dimensions are normalized into sub-dimensions

Example:
DimProduct → DimBrand → DimCategory

### Pros
✅ Less redundancy  
✅ Cleaner dimension structure  

### Cons
❌ More joins = slower queries  
❌ Harder for BI users  

---

## 4) When to use Star vs Snowflake
### Use Star when:
- Performance is important
- BI tools are primary consumers
- You want simplicity

### Use Snowflake when:
- Dimensions are very large
- Redundancy is too high
- You need normalized hierarchy

---

## 5) Grain (Most important concept)
### Definition
**Grain** = what one row in the fact table represents.

Example:
- 1 row per order item
- 1 row per daily store sales
- 1 row per monthly customer balance

If grain is wrong → entire warehouse becomes wrong.

---

## 6) Fact table measures
Two types:
### Additive
- Can be summed across all dimensions
Example: sales_amount

### Semi-additive
- Can be summed across some dimensions but not time
Example: account_balance

### Non-additive
- Cannot be summed
Example: ratios, percentages

---

## 7) Dimension table attributes
Examples:
- Customer name, age, city
- Product category, brand
- Store region

---

## 8) Conformed Dimensions
A conformed dimension is shared across multiple marts.

Example:
DimDate used by:
- Sales mart
- Inventory mart
- Finance mart

This ensures consistency.

---

## 9) Role-Playing Dimensions
Same dimension used in different roles.

Example:
DimDate used as:
- order_date
- ship_date
- delivery_date

---

## 10) Interview questions
- What is grain?
- Star vs snowflake?
- What is conformed dimension?
- What is role-playing dimension?
