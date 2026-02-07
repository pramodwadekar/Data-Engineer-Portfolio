# Project 03 - ADF CI/CD (Dev → Test → Prod) + Parameterization

## Overview
This project demonstrates **ADF DevOps CI/CD**:
- ADF connected to Git
- Publish branch artifacts
- ARM template deployment
- Environment-specific parameterization
- Key Vault integration in prod

---

## Why this project?
ADF CI/CD is a **very strong interview differentiator**.
Most candidates only know pipeline building, not deployment.

---

## What you learn
- Collaboration branch vs publish branch
- ARM template generation
- Parameterizing linked services
- DevOps release pipeline concept
- Using Key Vault in production

---

## Folder Structure
```
03_ADF_CICD_Multi_Environment_Deployment/
  adf/
    arm_templates/
      ARMTemplateForFactory.json
      ARMTemplateParametersForFactory.json
  docs/
    cicd_steps.md
    interview_explanation.md
```

---

## What to say in interview
- “We develop in dev factory with Git integration.”
- “Publish generates ARM templates.”
- “We deploy to test/prod using Azure DevOps pipelines.”
- “Linked services are parameterized and secrets come from Key Vault.”

---
