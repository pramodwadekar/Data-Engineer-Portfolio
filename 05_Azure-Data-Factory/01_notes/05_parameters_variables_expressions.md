# 05 - Parameters, Variables & Expressions (Must for Real Pipelines)

## 1) Pipeline Parameters
Pipeline parameters make pipelines reusable.

Example:
- run_date
- file_name
- table_name

---

## 2) Variables
Variables are used for intermediate values.

Types:
- String
- Array
- Boolean

---

## 3) Expressions
ADF uses expression language:
- `@concat()`
- `@utcNow()`
- `@formatDateTime()`
- `@pipeline().parameters.run_date`

---

## 4) Most common expressions (Interview Must)
- `@pipeline().RunId`
- `@pipeline().TriggerTime`
- `@utcNow()`
- `@addDays(utcNow(), -1)`
- `@formatDateTime(utcNow(),'yyyy-MM-dd')`
- `@concat('raw/', pipeline().parameters.table, '/')`

---

## 5) Dynamic Content Example
Dynamic file path:
```text
@concat('raw/sales/', formatDateTime(utcNow(),'yyyy/MM/dd'), '/')
```

---

## 6) Common Interview Questions
### Q1: Difference between parameter and variable?
- parameter: input to pipeline
- variable: internal value during run

### Q2: Where do you use expressions?
In dataset paths, SQL queries, activity settings.

---

## 7) Best Practices
- keep parameters small and meaningful
- use a single config pipeline for all tables
- avoid hardcoding paths
