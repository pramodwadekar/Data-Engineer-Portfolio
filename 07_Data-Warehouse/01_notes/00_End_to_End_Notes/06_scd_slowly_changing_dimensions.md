# 06 — Slowly Changing Dimensions (SCD) Type 0/1/2/3/4/6 (FULL)

This is one of the MOST important topics for Data Engineer interviews.

---

## 1) What is SCD?
Slowly Changing Dimension = how you handle changes in dimension attributes over time.

Example:
Customer changes:
- city
- phone number
- marital status
- segment

---

## 2) SCD Type 0 (No change)
- Never update dimension
- Keep original value forever

Use when:
- Birth date
- Customer original signup source

---

## 3) SCD Type 1 (Overwrite)
- Update existing record
- No history stored

Example:
Customer phone number correction.

Pros:
✅ Simple  
Cons:
❌ No historical reporting  

---

## 4) SCD Type 2 (Full history)
- Insert a new row when attribute changes
- Maintain start_date, end_date, is_current

Columns:
- customer_sk (surrogate key)
- customer_id (natural key)
- city
- start_date
- end_date
- is_current

Pros:
✅ Full history  
Cons:
❌ Table grows  

---

## 5) SCD Type 3 (Limited history)
- Store current + previous value in same row

Columns:
- current_city
- previous_city

Pros:
✅ Easy  
Cons:
❌ Only 1 level of history  

---

## 6) SCD Type 4 (History table)
- Current table stores latest
- Separate history table stores all changes

Pros:
✅ Clean current table  
Cons:
❌ Two-table logic  

---

## 7) SCD Type 6 (Hybrid 1+2+3)
Combines:
- Type 1 overwrite for some columns
- Type 2 for history
- Type 3 for previous value

Used in enterprise DWH.

---

## 8) How to implement SCD Type 2 (standard logic)
1. Identify changed records (by natural key)
2. Compare attributes
3. Expire old record:
   - end_date = yesterday
   - is_current = 0
4. Insert new record:
   - start_date = today
   - end_date = 9999-12-31
   - is_current = 1

---

## 9) SCD in Spark / Delta (Real-world)
Delta Lake supports MERGE which makes SCD easy.

You usually:
- Load staging data
- Use MERGE into dimension table

---

## 10) Interview questions
- Explain SCD Type 1 vs Type 2
- When to use Type 3?
- Why surrogate key in SCD2?
- How to handle late arriving dimensions?
