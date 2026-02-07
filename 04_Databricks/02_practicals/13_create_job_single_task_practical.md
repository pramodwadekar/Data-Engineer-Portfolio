# 13 - Create Job (Single Task) Practical (Databricks)

🎯 Goal: Create a production-style Databricks job with a notebook task.

---

## ✅ What you will learn
- Create a job
- Attach notebook task
- Use job cluster
- Schedule job
- View run history

---

## 1) Create a Notebook Task
Create notebook:
`/Repos/.../04_Databricks/02_practicals/job_task_demo`

Code:

```python
from pyspark.sql.functions import current_timestamp

df = spark.createDataFrame([(1,"ok")], ["id","status"])           .withColumn("run_time", current_timestamp())

df.show()
```

---

## 2) Go to Workflows
Left menu → **Workflows**

Click:
**Create Job**

---

## 3) Configure Job
- Job name: `job_single_task_demo`
- Task type: Notebook
- Notebook path: your notebook
- Compute: **Job cluster**

---

## 4) Run Now
Click:
**Run Now**

---

## 5) Check Run Output
Open the run and verify:
- status = success
- logs show df output

---

## 6) Schedule Job (Optional)
Set schedule:
- daily at 9 AM

---

## 7) Interview Talking Points
- jobs are orchestration
- job clusters are cheaper + isolated
- workflows can chain multiple tasks

---

## 8) Output
After this practical:
✅ you created a job  
✅ you ran a notebook task  
✅ you checked run history  

---

✅ Next: `14_workflow_multiple_tasks_practical.md`
