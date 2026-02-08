# 06 — SCD Type 1 Practical (Overwrite)

## Scenario
Customer phone number was wrong in source, corrected later.

We want latest value only (no history).

---

## Step 1: Update staging record
```sql
UPDATE stg_customers
SET phone = '8888000011', updated_ts = CURRENT_TIMESTAMP
WHERE customer_id = 101;
```

---

## Step 2: Apply SCD Type 1 update in DimCustomer
```sql
UPDATE dim_customer
SET phone = (SELECT phone FROM stg_customers WHERE customer_id = dim_customer.customer_id)
WHERE customer_id = 101 AND is_current = 1;
```

---

## Step 3: Validate
```sql
SELECT * FROM dim_customer WHERE customer_id = 101;
```

Expected:
- Only 1 row for customer_id=101
- phone updated

---

## Key learning
Type 1 overwrites, no history.
