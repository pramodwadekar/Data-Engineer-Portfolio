# Retail Sales DW - 2 Minute Interview Explanation

1) I start by defining grain: **one row per order line**.
2) I choose a **star schema** for BI performance.
3) Dimensions: customer, product, date, store.
4) Fact: sales measures (amount, qty).
5) I implement **SCD2** for customer to track city changes.
6) I partition fact by date_key for pruning.
7) I create KPI views for Power BI consumption.

---
