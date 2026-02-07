# 31 - Databricks Asset Bundles Deploy Practical (DAB) (Bonus)

🎯 Goal: Understand how to deploy Databricks Jobs/Notebooks using Databricks Asset Bundles.

This is a **Top 1%** Databricks skill.

---

## ✅ What you will learn
- What DAB is
- Bundle structure
- databricks.yml basics
- Deploy to dev/prod targets
- CI/CD concept

---

## 0) Prerequisites
You need:
- Databricks CLI installed (local machine)
- Workspace URL
- Token / service principal
- Git repo with your notebooks

---

## 1) Install Databricks CLI (Local)
```bash
pip install databricks-cli
```

(Modern setups use Databricks CLI v2)

---

## 2) Configure CLI
```bash
databricks configure
```

Enter:
- host URL
- token

---

## 3) Create a Bundle (Concept)
In your repo, create folder:
```
/databricks_bundle/
  databricks.yml
  resources/
    jobs.yml
  notebooks/
```

---

## 4) Example databricks.yml (Simple)
```yaml
bundle:
  name: de_portfolio_bundle

targets:
  dev:
    workspace:
      host: https://<workspace-url>
```

---

## 5) Deploy Bundle
```bash
databricks bundle deploy -t dev
```

---

## 6) Run Bundle Job
```bash
databricks bundle run -t dev job_name
```

---

## 7) CI/CD Integration (Concept)
In GitHub Actions:
- deploy bundle on merge to main
- promote dev → prod

---

## 8) Interview Talking Points
- DAB enables Infrastructure-as-Code deployment
- avoids manual job creation
- supports multi-environment deployment

---

## 9) Output
After this practical:
✅ you understand DAB deployment flow  
✅ you can explain CI/CD in Databricks  

---

✅ Next: `32_jobs_rest_api_trigger_practical.md`
