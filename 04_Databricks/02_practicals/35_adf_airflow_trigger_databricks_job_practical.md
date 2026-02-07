# 35 - Trigger Databricks Job from ADF / Airflow Practical (Enterprise)

🎯 Goal: Understand integration of Databricks with orchestration tools.

---

## ✅ What you will learn
- How ADF triggers Databricks job
- How Airflow triggers Databricks job
- REST API pattern
- Production orchestration strategy

---

## 1) ADF → Databricks Integration (Concept)

In Azure Data Factory:
- use Databricks activity
OR
- use Web activity (REST API)

Typical flow:
```
ADF Pipeline → Databricks Job → Delta tables → Power BI
```

---

## 2) Airflow → Databricks Integration (Concept)

Airflow has:
- DatabricksRunNowOperator
- DatabricksSubmitRunOperator

Flow:
```
Airflow DAG → Databricks job run → monitoring
```

---

## 3) Best Practice Approach
Recommended:
- Orchestrator triggers Databricks Jobs
- Databricks handles Spark compute + Delta writes
- UC handles governance

---

## 4) REST API Trigger Example
```bash
curl -X POST https://<workspace-url>/api/2.1/jobs/run-now   -H "Authorization: Bearer <TOKEN>"   -H "Content-Type: application/json"   -d '{
        "job_id": 12345,
        "notebook_params": {"run_date":"2026-01-01"}
      }'
```

---

## 5) Interview Talking Points
- ADF uses Databricks activity or REST API
- Airflow uses Databricks operator
- SP authentication is preferred
- job parameters allow date-based loads

---

## 6) Output
After this practical:
✅ you can explain ADF/Airflow integration  
✅ you know how jobs are triggered externally  

---

✅ Next: `36_dlt_autoloader_end_to_end_practical.md`
