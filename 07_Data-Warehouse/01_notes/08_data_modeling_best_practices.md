# 08 - Data Modeling Best Practices

## 1) Use consistent naming
- dim_customer
- fact_sales

## 2) Define grain clearly
Write it in table comment.

## 3) Use surrogate keys for dimensions
Especially SCD2.

## 4) Use date dimension
Avoid direct timestamps everywhere.

## 5) Avoid storing text attributes in fact
Keep fact narrow.

## 6) Handle late arriving dimensions
When fact arrives before dimension.

## 7) Handle unknown members
Use -1 key row (Unknown customer).

---

## Interview Tip
These best practices make you sound experienced.

---
