# 29 - Job Run Logs + Debugging Practical (Databricks)

🎯 Goal: Learn how to debug failed jobs using Databricks run logs.

---

## ✅ What you will learn
- Job run history
- Task logs
- Driver logs
- Cluster logs
- Common failure patterns

---

## 1) Create a Job That Fails
Create notebook:
`29_fail_demo`

```python
print("Starting job...")

x = 10
y = 0

# Intentional error
print(x / y)
```

---

## 2) Create Job
Workflows → Create Job
- Notebook task: `29_fail_demo`
- Job cluster
Run now.

---

## 3) Check Run Output
Open the failed run and check:
- error message
- stack trace

---

## 4) Check Task Logs
Inside run:
- stdout
- stderr

---

## 5) Check Cluster Logs
Compute → cluster → logs

Cluster logs show:
- executor issues
- memory errors
- startup failures

---

## 6) Debug Common Errors

### ZeroDivisionError / coding errors
Fix notebook.

### Permission errors
Check Unity Catalog grants.

### OutOfMemory
Fix shuffle + partitions + broadcast.

---

## 7) Best Practices
- always log important values
- store audit metrics in Delta
- keep notebooks modular

---

## 8) Interview Talking Points
- Databricks run history helps debugging
- Spark UI + logs are used together
- job retries handle transient errors

---

## 9) Output
After this practical:
✅ you can debug job failures  
✅ you can read logs and trace errors  
✅ you know where cluster logs are  

---

✅ Next: `30_cost_optimization_checklist_practical.md`
