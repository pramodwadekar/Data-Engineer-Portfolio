# 03 - Fact and Dimension Tables

## Dimension table
Descriptive attributes (who, what, where, when).

Examples:
- DimCustomer
- DimProduct
- DimDate
- DimStore

### Properties
- relatively smaller
- changes slowly
- used for filtering/grouping

---

## Fact table
Measurements/events.

Examples:
- FactSales
- FactOrders
- FactPayments

### Properties
- huge rows
- additive metrics
- contains foreign keys to dimensions

---

## Fact types
### 1) Transaction fact
One row per transaction
Example: one row per order line

### 2) Snapshot fact
One row per time snapshot
Example: daily inventory snapshot

### 3) Accumulating snapshot
Tracks lifecycle
Example: order lifecycle (created → shipped → delivered)

---

## Additive / Semi-additive / Non-additive facts
- Additive: sum across all dims (sales)
- Semi-additive: sum across some dims only (bank balance)
- Non-additive: ratios, percentages

---

## Interview Tip
Always define:
- fact type
- grain
- measures
- dimensions

---
