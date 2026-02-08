# 11 — Data Quality Checks (Warehouse Testing)

## Goal
Implement DQ checks like real companies.

---

## Check 1: Duplicate keys in dimensions
```sql
SELECT customer_id, COUNT(*)
FROM dim_customer
GROUP BY customer_id
HAVING COUNT(*) > 1;
```

If SCD2 enabled, duplicates are expected but:
- only 1 row should be is_current = 1

```sql
SELECT customer_id, COUNT(*)
FROM dim_customer
WHERE is_current = 1
GROUP BY customer_id
HAVING COUNT(*) > 1;
```

---

## Check 2: Null surrogate keys in fact
```sql
SELECT COUNT(*)
FROM fact_sales
WHERE customer_sk IS NULL OR product_sk IS NULL OR store_sk IS NULL;
```

Expected = 0

---

## Check 3: Referential integrity
```sql
SELECT COUNT(*)
FROM fact_sales f
LEFT JOIN dim_customer c ON f.customer_sk = c.customer_sk
WHERE c.customer_sk IS NULL;
```

Expected = 0

---

## Check 4: Negative amounts
```sql
SELECT *
FROM fact_sales
WHERE net_amount < 0 OR gross_amount < 0;
```

Expected = 0

---

## Check 5: Reconciliation check
Compare total sales between staging and warehouse.

```sql
SELECT SUM(quantity*unit_price - discount) AS stg_total
FROM stg_order_items;

SELECT SUM(net_amount) AS dwh_total
FROM fact_sales;
```

---

## Key learning
DQ checks are mandatory in production.
