# 04 - Parameters, Expressions, Dynamic Content (Interview Questions)

## 1) What are pipeline parameters?
Inputs to pipelines for reusability.

---

## 2) What are variables?
Internal values used during pipeline execution.

---

## 3) Parameter vs Variable?
- parameter: input
- variable: runtime value

---

## 4) Where are expressions used?
- dataset path
- SQL queries
- file names
- activity settings

---

## 5) Most used expressions
- `@pipeline().RunId`
- `@utcNow()`
- `@formatDateTime()`
- `@concat()`
- `@equals()`

---

## 6) Example: dynamic folder
```text
@concat('bronze/orders/run_date=', formatDateTime(utcNow(),'yyyy-MM-dd'), '/')
```

---

## 7) How to parameterize dataset?
Add dataset parameters and use:
- `@dataset().param`

---

## 8) What is dynamic content?
Using expressions to build values at runtime.

---

## 9) Interview scenario
**Q:** How do you run same pipeline for multiple tables?
A: Pass table_name as parameter.

---

## 10) Best practices
- avoid hardcoding
- keep naming consistent
