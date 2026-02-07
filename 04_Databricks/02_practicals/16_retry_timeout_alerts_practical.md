# 16 - Retry, Timeout, Alerts Practical (Databricks Jobs)

🎯 Goal: Configure Jobs like production pipelines with retries, timeouts, and notifications.

---

## ✅ What you will learn
- Task retries
- Retry interval
- Task timeout
- Failure notifications
- Run history analysis

---

## 1) Create a Notebook That Fails on Purpose
Create notebook:
`16_retry_demo`

```python
dbutils.widgets.text("should_fail", "yes")
flag = dbutils.widgets.get("should_fail")

print("should_fail =", flag)

if flag == "yes":
    raise Exception("Intentional failure to test retries.")
else:
    print("Success run!")
```

---

## 2) Create Job
Workflows → Create Job

Name:
`job_retry_timeout_demo`

Task:
- Notebook: `16_retry_demo`

Compute:
- Job cluster

---

## 3) Configure Retry Policy
In task settings:
- Retries: 2
- Retry interval: 2 minutes

---

## 4) Configure Timeout
Set:
- Timeout: 10 minutes

---

## 5) Configure Notifications
Enable:
- email on failure

(Add your email)

---

## 6) Run Job
Run now.

Expected:
- it fails
- retries happen
- finally fails

---

## 7) Fix and Re-run
Edit job parameters:
- should_fail = no

Run again.

Expected:
- success

---

## 8) Interview Talking Points
- retries handle transient failures
- timeout prevents stuck jobs
- alerts ensure SLA monitoring

---

## 9) Output
After this practical:
✅ you can configure retries/timeouts  
✅ you understand job run history  
✅ you know production job controls  

---

✅ Next: `17_uc_create_catalog_schema_practical.md`
