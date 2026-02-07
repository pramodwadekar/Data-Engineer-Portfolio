# 20 - Databricks Asset Bundles (DAB) + CI/CD (Bonus - Top 1%)

Databricks Asset Bundles (DAB) is the modern Databricks way to deploy:
- notebooks
- jobs/workflows
- pipelines
- configs

using CI/CD.

This topic makes your profile look **senior + production-ready**.

---

## 1) What is Databricks Asset Bundles (DAB)?
Databricks Asset Bundles is a **deployment framework** to package Databricks assets into a bundle and deploy them using:
- Databricks CLI
- CI/CD pipelines (GitHub Actions, Azure DevOps)

---

## 2) Why DAB is needed?
Because manually creating jobs in UI is not scalable.

DAB enables:
- Infrastructure as Code (IaC) style deployment
- repeatable deployments
- dev → qa → prod promotion
- version control for jobs

---

## 3) What can be deployed using DAB?
- Jobs / Workflows
- Notebooks
- SQL queries
- DLT pipelines (in some cases)
- Libraries
- cluster configs

---

## 4) Typical CI/CD Flow

1) Developer pushes code to Git
2) CI runs unit tests / lint checks
3) CD deploys bundle to Databricks workspace
4) Jobs are updated automatically

---

## 5) Bundle Structure (Concept)
Common bundle files:
- `databricks.yml`
- notebooks/
- src/
- resources/jobs.yml

---

## 6) Environments (dev/qa/prod)
DAB supports environment targets.

Example:
- target: dev
- target: prod

---

## 7) Interview Questions
### Q1) How do you deploy Databricks jobs in production?
Best answer:
Using Databricks Asset Bundles + CI/CD.

### Q2) Why not manual UI jobs?
Not repeatable, not scalable, hard to track changes.

---

## 8) Summary
DAB is not mandatory for all roles, but it is a **Top 1% skill**.

---

✅ Next: `21_databricks_rest_api_basics.md`
