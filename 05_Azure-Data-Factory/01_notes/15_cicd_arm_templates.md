# 15 - CI/CD in ADF (ARM Templates) (Advanced)

## 1) Why CI/CD?
To move pipelines safely:
- dev → test → prod

---

## 2) ADF Git mode
ADF supports Git integration:
- Azure DevOps
- GitHub

---

## 3) Publish branch
ADF uses a publish branch for deployment artifacts.

---

## 4) ARM Templates
ADF generates ARM templates for:
- pipelines
- datasets
- linked services
- triggers

---

## 5) Deployment flow
1. Develop in dev factory
2. Publish
3. Deploy ARM template to prod factory

---

## 6) Common Interview Questions
### Q1: How do you deploy ADF pipelines to prod?
ARM template deployment.

### Q2: What is publish branch?
Contains generated deployment artifacts.

---

## 7) Best Practices
- separate dev and prod factories
- parameterize linked services
- use Key Vault in prod
