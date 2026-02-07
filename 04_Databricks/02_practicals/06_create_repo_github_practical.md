# 06 - Create Repo (GitHub) Practical (Databricks)

🎯 Goal: Connect your GitHub repository with Databricks using Databricks Repos.

---

## ✅ What you will learn
- Create a repo inside Databricks
- Connect to GitHub
- Understand Repos vs Workspace folders
- Where to keep notebooks for real projects

---

## 1) Pre-requirements
You should have:
- GitHub account
- A repository (example: `Data-Engineering-Portfolio`)

---

## 2) Open Repos
Left menu → **Repos**

Click:
**Add Repo**

---

## 3) Select Git Provider
Choose:
- GitHub

Paste your repository URL.

Example:
```
https://github.com/<username>/Data-Engineering-Portfolio
```

---

## 4) Choose Branch
Select:
- main

Click:
**Create Repo**

---

## 5) Verify Repo is Created
You should see:
- your folder structure
- README files
- notebooks folder

---

## 6) Create a Notebook inside Repo
Inside repo create:

`/04_Databricks/02_practicals/06_create_repo_github`

Add code:

```python
print("Repo is connected successfully!")
```

---

## 7) Repos vs Workspace Folder (Must)
### Workspace folder
- not tracked by Git

### Repo folder
- fully tracked by Git
- commit/push supported

---

## 8) Best Practices
- keep all project notebooks in Repos
- use feature branches
- commit frequently

---

## 9) Output
After this practical:
✅ you connected GitHub repo  
✅ you created a notebook inside repo  

---

✅ Next: `07_branch_commit_push_practical.md`
