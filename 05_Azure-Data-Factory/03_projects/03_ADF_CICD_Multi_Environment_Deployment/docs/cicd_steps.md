# ADF CI/CD Steps (High Level)

1. Connect ADF to Azure DevOps Git repo
2. Develop pipelines in collaboration branch (main)
3. Click Publish (generates artifacts in publish branch)
4. Create Azure DevOps pipeline:
   - Export publish branch artifacts
   - Deploy ARM templates to target factory
5. Use parameter files for:
   - storage account
   - SQL server name
   - key vault name
6. Validate triggers in prod before enabling

---
