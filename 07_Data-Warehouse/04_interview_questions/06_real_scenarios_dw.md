# 06 - Real DW Interview Scenarios (System Design)

## Scenario 1: Retail sales DW
Design:
- DimCustomer (SCD2)
- DimProduct
- DimStore
- DimDate
- FactSales (transaction)

## Scenario 2: Banking customer 360
Design:
- DimCustomer (SCD2)
- FactTransactions
- FactBalanceSnapshot (daily snapshot)

## Scenario 3: Late arriving dimension
If fact arrives before dimension:
- load with unknown key (-1)
- backfill later using update

## Scenario 4: Incremental loads
Use watermark table and idempotent load strategy.

---
