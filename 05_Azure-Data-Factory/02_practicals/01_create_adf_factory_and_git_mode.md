# 01 - Create ADF Factory + Enable Git Mode (Practical)

## Goal
Create an Azure Data Factory instance and enable Git integration.

---

## Steps

### 1) Create ADF Factory
1. Azure Portal → Create resource
2. Search: **Data Factory**
3. Create:
   - Subscription: your subscription
   - Resource group: `rg-de-adf`
   - Factory name: `adf-de-pramod`
   - Region: Central India (or nearest)

4. Click **Review + Create**

---

### 2) Open ADF Studio
Go to:
- Factory → **Launch Studio**

---

### 3) Enable Git mode (Important for real company)
1. In ADF Studio → Manage (wrench icon)
2. Git configuration
3. Choose:
   - Azure DevOps Git OR GitHub
4. Select repository + collaboration branch

---

## Why Git mode is important?
- version control
- CI/CD deployment
- team collaboration

---

## Interview Points
- “In production, we always use Git mode”
- “Publish branch is used for deployment artifacts”
