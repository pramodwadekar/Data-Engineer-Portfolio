# 32 - Trigger Databricks Job using REST API Practical (Bonus)

🎯 Goal: Trigger a Databricks Job externally using REST API.

This is useful for:
- ADF pipelines
- Airflow
- custom schedulers

---

## ✅ What you will learn
- Jobs API usage
- run-now endpoint concept
- authentication
- integration pattern

---

## 1) Create a Job in Databricks
Create a simple job:
- name: `api_trigger_demo_job`
- task: notebook that prints run_date

---

## 2) Get Job ID
Open job → URL contains job id.
Or use API list jobs.

---

## 3) Run Job using REST API (Concept)
Endpoint:
- `/api/2.1/jobs/run-now`

Example request:

```bash
curl -X POST https://<workspace-url>/api/2.1/jobs/run-now   -H "Authorization: Bearer <TOKEN>"   -H "Content-Type: application/json"   -d '{
        "job_id": 12345,
        "notebook_params": {
          "run_date": "2026-01-01"
        }
      }'
```

---

## 4) Get Run Status
Use:
- `/api/2.1/jobs/runs/get`

---

## 5) Real Integration Example
### ADF
ADF calls REST API activity to trigger Databricks job.

### Airflow
Airflow uses Databricks operator.

---

## 6) Best Practices
- use service principal instead of PAT
- never store tokens in notebooks
- rotate secrets
- add retries in orchestrator

---

## 7) Interview Talking Points
- Databricks Jobs can be triggered via REST API
- used in ADF/Airflow integration
- service principal is preferred

---

## 8) Output
After this practical:
✅ you can explain external triggering  
✅ you know key endpoints  

---

✅ Next: `33_sql_warehouse_dashboard_practical.md`
