# 01 — Business Problem

A bank wants daily reporting:
- Total deposits
- Average daily balance per customer
- Branch-wise growth
- High-risk accounts monitoring

Data is in OLTP:
- customers
- accounts
- branches
- transactions

OLTP cannot handle heavy daily snapshot reporting efficiently.

So we build a warehouse.
