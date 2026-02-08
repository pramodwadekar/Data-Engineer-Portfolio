# 10 — MERGE / Upsert Strategy (Modern Warehouses)

## Goal
Implement upsert for dimensions or facts.

---

## Example: MERGE for DimProduct (Type 1)
```sql
MERGE INTO dim_product d
USING stg_products s
ON d.product_id = s.product_id AND d.is_current = 1
WHEN MATCHED AND (
  d.product_name <> s.product_name OR
  d.category <> s.category OR
  d.brand <> s.brand OR
  d.price <> s.price
)
THEN UPDATE SET
  product_name = s.product_name,
  category = s.category,
  brand = s.brand,
  price = s.price
WHEN NOT MATCHED THEN
  INSERT (product_id, product_name, category, brand, price, start_date, end_date, is_current)
  VALUES (s.product_id, s.product_name, s.category, s.brand, s.price, CURRENT_DATE, '9999-12-31', 1);
```

---

## Notes
- MERGE syntax differs slightly across SQL engines.
- In Delta Lake MERGE is most powerful.

---

## Key learning
MERGE simplifies incremental loads.
