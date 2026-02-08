# 08 — Late Arriving Dimension (Real-world)

## Scenario
An order arrives for a customer not yet loaded in DimCustomer.

This happens in real pipelines.

---

## Strategy 1: Insert 'Unknown' record
Create an Unknown customer row:
```sql
INSERT INTO dim_customer (customer_id, full_name, phone, city, state, start_date, end_date, is_current)
VALUES (-1, 'Unknown', 'NA', 'NA', 'NA', CURRENT_DATE, '9999-12-31', 1);
```

Then in fact load:
- map missing customer_id to -1

---

## Strategy 2: Early-arriving dimension
Insert placeholder customer row when fact arrives:
```sql
INSERT INTO dim_customer (customer_id, full_name, phone, city, state, start_date, end_date, is_current)
VALUES (999, 'TBD', 'TBD', 'TBD', 'TBD', CURRENT_DATE, '9999-12-31', 1);
```

Later update it when real customer arrives.

---

## Key learning
Late arriving dimensions are common.
You must handle them for stable fact loads.
