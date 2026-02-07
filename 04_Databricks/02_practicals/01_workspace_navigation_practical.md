# 01 - Workspace Navigation Practical (Databricks)

🎯 Goal: Learn Databricks workspace navigation like a real Data Engineer.

This practical is UI-based + small notebook checks.

---

## ✅ What you will learn
- Workspace sections (Home, Workspace, Repos, Data, SQL, Workflows, Compute)
- Where to create notebooks
- Where to create jobs
- Where to view tables
- How to organize a clean workspace structure

---

## 1) Open Databricks Workspace

Go to the left menu and locate these:

- **Workspace**
- **Repos**
- **Data**
- **SQL**
- **Workflows**
- **Compute**

---

## 2) Create Your Personal Folder (Best Practice)

Go to:

`Workspace → Users → <your_email>`

Create folders:

```
01_learning
02_practicals
03_projects
04_jobs
```

---

## 3) Create a Notebook

Inside `02_practicals/` create:

Notebook name:
`01_workspace_navigation`

Language:
`Python`

---

## 4) Attach Cluster to Notebook
Top right:
- Select cluster
- If cluster not available, you will create in Practical 02

---

## 5) Quick Notebook Test

Run this:

```python
spark
```

Check Spark version:

```python
spark.version
```

---

## 6) Locate the Following in UI (Must Know)

### Data Explorer
Go to:
`Data`

Check:
- catalogs
- schemas
- tables

### SQL Editor
Go to:
`SQL`

Check:
- query editor
- dashboards

### Workflows
Go to:
`Workflows`

Check:
- Jobs list
- Run history

### Compute
Go to:
`Compute`

Check:
- clusters
- SQL warehouses

---

## 7) Interview Talking Points
If interviewer asks "Databricks workspace basics", answer:

- Workspace = notebooks/code
- Data explorer = catalogs/schemas/tables
- Workflows = orchestration
- Compute = clusters/warehouses
- Repos = Git integration

---

## 8) Output (What to Write in Your Notes)
After completing this practical, write:

✅ I can navigate Databricks UI confidently  
✅ I know where to manage clusters, jobs, repos, and tables  
✅ I created my clean workspace folder structure  

---

## ⭐ Summary
This practical is foundational.
If your workspace organization is clean, your projects become professional.

---

✅ Next: `02_create_cluster_practical.md`
