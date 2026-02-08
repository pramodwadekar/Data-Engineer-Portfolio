# 07 — SCD Type 2 Practical (Full History)

## Scenario
Customer changed city from Pune → Bangalore.

We want to keep history for reporting.

---

## Step 1: Update staging record
```sql
UPDATE stg_customers
SET city = 'Bangalore', state = 'KA', updated_ts = CURRENT_TIMESTAMP
WHERE customer_id = 101;
```

---

## Step 2: Detect changed customers
```sql
SELECT
  s.customer_id,
  s.city AS new_city,
  d.city AS old_city
FROM stg_customers s
JOIN dim_customer d
  ON s.customer_id = d.customer_id
WHERE d.is_current = 1
  AND (s.city <> d.city OR s.state <> d.state);
```

---

## Step 3: Expire old record
```sql
UPDATE dim_customer
SET end_date = CURRENT_DATE - INTERVAL '1 day',
    is_current = 0
WHERE customer_id = 101
  AND is_current = 1;
```

---

## Step 4: Insert new current record
```sql
INSERT INTO dim_customer (customer_id, full_name, phone, city, state, start_date, end_date, is_current)
SELECT customer_id, full_name, phone, city, state, CURRENT_DATE, '9999-12-31', 1
FROM stg_customers
WHERE customer_id = 101;
```

---

## Step 5: Validate history
```sql
SELECT * FROM dim_customer
WHERE customer_id = 101
ORDER BY customer_sk;
```

Expected:
- 2 rows
- old row expired
- new row current

---

## Key learning
SCD2 keeps full history.
