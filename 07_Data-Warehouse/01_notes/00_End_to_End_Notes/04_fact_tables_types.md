# 04 — Fact Tables (Transaction, Snapshot, Accumulating Snapshot)

## 1) What is a Fact Table?
A fact table stores:
- Measurable events (facts)
- Foreign keys to dimensions
- Numeric metrics

Example metrics:
- sales_amount
- quantity
- discount
- profit

---

## 2) Transaction Fact Table
### Definition
Stores one row per transaction event.

Examples:
- One row per order item
- One row per payment
- One row per click event

### Pros
✅ Most detailed  
✅ Flexible analytics  

### Cons
❌ Very large table  

---

## 3) Periodic Snapshot Fact Table
### Definition
Stores metrics at regular intervals (daily/weekly/monthly).

Examples:
- Daily store sales
- Monthly revenue per product
- Daily inventory level

### Pros
✅ Easy time series reporting  
✅ Smaller than transaction  

### Cons
❌ Less detail  
❌ Need separate logic for drill-down  

---

## 4) Accumulating Snapshot Fact Table
### Definition
Tracks a process lifecycle.

Example: Order lifecycle
- order_created_date
- packed_date
- shipped_date
- delivered_date

One row per order, updated as process progresses.

### Pros
✅ Great for pipeline/funnel analysis  
✅ Easy SLA tracking  

### Cons
❌ Requires updates (not purely append)  

---

## 5) Factless Fact Table
### Definition
Fact table without numeric measures.
Stores only event occurrences.

Examples:
- Student attendance (present/absent)
- Promotion eligibility

Used for counting events.

---

## 6) Degenerate Dimensions
A dimension stored inside fact table (not separate).

Example:
- invoice_number
- transaction_id

---

## 7) Interview questions
- Types of fact tables?
- What is factless fact?
- What is degenerate dimension?
