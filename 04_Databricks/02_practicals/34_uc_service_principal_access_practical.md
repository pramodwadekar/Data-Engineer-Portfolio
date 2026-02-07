# 34 - Unity Catalog + Service Principal Access Practical (Enterprise)

🎯 Goal: Understand how production Databricks jobs access data using **Service Principals**.

This is a real enterprise pattern.

---

## ✅ What you will learn
- What is service principal (SP)
- Why SP is used instead of personal accounts
- How permissions are granted to SP
- UC + Jobs security model

---

## 1) What is Service Principal?
A service principal is a non-human identity used for:
- production jobs
- CI/CD pipelines
- automation

---

## 2) Why Service Principal is Used?
Because:
- employees leave company
- personal tokens expire
- compliance requires non-human identity

---

## 3) Typical Production Setup (Concept)
1) Create Service Principal
2) Add SP to group: `prod_data_engineering_jobs`
3) Grant UC permissions to group
4) Jobs run using SP identity

---

## 4) Grant UC Permissions to Service Principal (Example)

```sql
-- Example: grant schema usage
GRANT USE CATALOG ON CATALOG prod TO `prod_jobs_sp`;
GRANT USE SCHEMA ON SCHEMA prod.sales TO `prod_jobs_sp`;
GRANT SELECT, MODIFY ON SCHEMA prod.sales TO `prod_jobs_sp`;
```

---

## 5) Run Job as Service Principal (Concept)
In job settings:
- Run as: service principal

(Depending on workspace setup)

---

## 6) Validate Permissions
Try reading a table:
```sql
SELECT * FROM prod.sales.orders;
```

If permission missing → UC error.

---

## 7) Interview Talking Points
- production jobs should run as service principal
- permissions should be group-based
- least privilege model is applied

---

## 8) Output
After this practical:
✅ you can explain SP usage in Databricks  
✅ you understand UC permissions for jobs  

---

✅ Next: `35_adf_airflow_trigger_databricks_job_practical.md`
