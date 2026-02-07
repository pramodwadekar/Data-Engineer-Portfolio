# 07 - Databricks Repos + Git Integration (Must)

This note covers how Databricks integrates with Git and how to manage code like real projects.

---

## 1) What is Databricks Repos?
Databricks Repos is a feature that allows you to connect a Git repository directly inside Databricks.

Supports:
- GitHub
- Azure DevOps
- GitLab
- Bitbucket

---

## 2) Why Repos is important for Data Engineers?
Because production projects require:
- version control
- collaboration
- code reviews
- branching
- CI/CD

---

## 3) Repo vs Workspace Folder (Important)

### Workspace Folder
- notebooks only
- not real Git tracking

### Repo Folder
- connected to Git
- supports pull/push
- proper source control

---

## 4) Recommended Repo Structure
Inside repo:
```
/notebooks/
  /bronze/
  /silver/
  /gold/
/src/
/tests/
/docs/
README.md
```

---

## 5) How to Use Repos in Databricks

Steps:
1) Open **Repos**
2) Click **Add Repo**
3) Choose Git provider
4) Enter repo URL
5) Create branch (feature branch)

---

## 6) Branching Strategy (Simple)
Recommended:
- main = stable
- dev = development
- feature branches = new work

---

## 7) Notebook Versioning in Repos
Databricks stores notebooks as:
- `.py` files
- `.ipynb` (optional)

Best practice:
Use `.py` notebook export format for clean diffs.

---

## 8) Common Issues
- merge conflicts in notebooks
- large binary files not supported
- credentials expired

---

## 9) Best Practices
- always commit from GitHub, not workspace
- keep notebooks modular
- keep config separate
- never commit secrets

---

## 10) Interview Questions
### Q1) Why use Databricks Repos?
To integrate Git and manage notebooks/code professionally.

### Q2) How do you deploy code?
Using CI/CD or Databricks Asset Bundles.

---

## 11) Summary
Databricks Repos = Git inside Databricks.
Must for real company projects.

---

✅ Next: `08_secrets_and_keyvault.md`
