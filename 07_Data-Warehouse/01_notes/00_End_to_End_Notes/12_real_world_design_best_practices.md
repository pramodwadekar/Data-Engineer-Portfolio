# 12 — Real-World Warehouse Design + Best Practices (Very Important)

## 1) Start with business requirements
Before designing tables, ask:
- What KPIs?
- What reports?
- What grain is needed?
- What is refresh frequency?

---

## 2) Always define the grain first
Wrong grain causes:
- double counting
- incorrect aggregates
- wrong joins

---

## 3) Build conformed dimensions
DimDate, DimCustomer, DimProduct should be shared.

---

## 4) Use SCD correctly
- Type 1 for corrections
- Type 2 for history

---

## 5) Keep facts narrow
Do not store many text columns in fact.

---

## 6) Avoid too many marts
Too many marts create maintenance overhead.

---

## 7) Incremental load strategy
Use:
- CDC
- watermark
- merge
- partition-based loads

---

## 8) Documentation
Document:
- table purpose
- grain
- KPI definitions

---

## 9) Testing
Always test:
- duplicates
- referential integrity
- row counts
- reconciliation totals

---

## 10) Monitoring
Monitor:
- pipeline duration
- failures
- cost
- SLA

---

## 11) Interview questions
- How do you design a DWH?
- How do you ensure data quality?
- How do you optimize warehouse queries?
