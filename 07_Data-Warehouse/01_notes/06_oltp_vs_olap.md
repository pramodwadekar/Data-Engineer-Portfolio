# 06 - OLTP vs OLAP

## OLTP (Online Transaction Processing)
Used for:
- day-to-day operations
- inserts/updates

Examples:
- banking transactions
- ecommerce order placement

### Characteristics
- normalized schema (3NF)
- many small transactions
- low latency
- current state

---

## OLAP (Online Analytical Processing)
Used for:
- analytics
- reporting
- aggregations

### Characteristics
- denormalized schema (star)
- complex queries
- historical data
- read heavy

---

## Interview Example
OLTP query:
- insert order

OLAP query:
- total sales per month by city

---
