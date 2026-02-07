# 03 - Notebooks, Repos & Git (Interview Questions)

## 1) What is a notebook in Databricks?
An interactive document for:
- code execution
- visualization
- markdown documentation

Supports:
- Python
- SQL
- Scala
- R

---

## 2) Notebook vs Job
Notebook = development  
Job = scheduled production execution

---

## 3) What is Databricks Repos?
Repos allow you to connect:
- GitHub
- Azure DevOps
- GitLab
and work with code inside Databricks.

---

## 4) Why use Repos?
- version control
- collaboration
- CI/CD integration
- review and rollback

---

## 5) How do you structure notebooks in a project?
Common structure:
- ingestion notebook
- transformation notebook
- gold aggregation notebook
- validation notebook

---

## 6) What is %run?
`%run` runs another notebook and imports its variables/functions.

---

## 7) What is dbutils?
Databricks utilities for:
- filesystem operations
- secrets
- widgets
- notebook workflow

---

## 8) What are widgets?
Widgets allow passing parameters into notebooks.

Example:
```python
dbutils.widgets.text("run_date", "")
run_date = dbutils.widgets.get("run_date")
```

---

## 9) What is the difference between Workspace and Repo path?
- Workspace: UI notebooks, harder to version control
- Repo: Git-backed code, best for production

---

## 10) Best practices
- store reusable functions in `.py` files
- avoid too many %run chains
- keep notebooks modular

---

## 11) CI/CD in Databricks (high level)
- push code to Git
- deploy using Asset Bundles
- trigger jobs via pipeline

---

## 12) Interview scenario
**Q:** How do you handle multiple environments (dev/prod)?  
**A:** Use separate workspaces or separate UC catalogs + deploy via bundles.
