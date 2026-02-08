# 05 - Surrogate Keys and Grain

## Grain (Most important DW concept)
Grain = what one row represents.

Example grains:
- FactSales: one row per order_line
- FactInventory: one row per product per day

---

## Why grain matters?
Because:
- determines table size
- determines metrics correctness
- avoids double counting

---

## Surrogate key
A warehouse-generated key (integer).

### Why not use natural key?
Natural keys can:
- change
- be composite
- be inconsistent across sources

Surrogate keys provide:
- performance
- stability
- SCD2 support

---

## Conformed dimensions
Dimensions shared across facts.

Example:
DimDate used by FactSales and FactInventory.

---

## Interview Tip
When asked to design DW, always start with:
1) Define grain
2) Define dimensions
3) Define measures

---
