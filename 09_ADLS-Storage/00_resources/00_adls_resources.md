# 00_Resources — ADLS Gen2 (Azure Data Lake Storage) (09_ADLS-Storage)

This module covers ADLS Gen2 from **Basic → Advanced**, including:
- Storage account basics
- Containers, folders, files
- RBAC vs ACL (most important)
- Managed Identity access
- Private endpoints + networking
- Encryption + security
- Lifecycle management + cost optimization
- Monitoring + logging
- Integration with Synapse, ADF, Databricks
- Interview questions + DP-203 mapping

---

## 1) Official Microsoft Documentation (Best)

### ADLS Gen2 Main Docs
- Azure Data Lake Storage Gen2 documentation  
  https://learn.microsoft.com/en-us/azure/storage/blobs/data-lake-storage-introduction

### Storage Account Overview
- Azure Storage account overview  
  https://learn.microsoft.com/en-us/azure/storage/common/storage-account-overview

### Hierarchical Namespace (HNS)
- Hierarchical namespace in ADLS Gen2  
  https://learn.microsoft.com/en-us/azure/storage/blobs/data-lake-storage-namespace

---

## 2) ADLS Security (Most Important Topics)

### RBAC (Azure Role Based Access Control)
- Azure RBAC overview  
  https://learn.microsoft.com/en-us/azure/role-based-access-control/overview

### Storage RBAC Roles
- Built-in roles for storage  
  https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles#storage

### ACLs (File/Folder permissions)
- Access control lists (ACLs) in ADLS Gen2  
  https://learn.microsoft.com/en-us/azure/storage/blobs/data-lake-storage-access-control

### RBAC vs ACL (Best Topic)
- Authorization in ADLS Gen2 (RBAC + ACL)  
  https://learn.microsoft.com/en-us/azure/storage/blobs/data-lake-storage-access-control-model

---

## 3) Authentication (Service Principal / Managed Identity)

### Managed Identity
- Managed identities in Azure  
  https://learn.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview

### Service Principal
- Create Azure AD service principal  
  https://learn.microsoft.com/en-us/entra/identity-platform/howto-create-service-principal-portal

### SAS Token
- SAS token overview  
  https://learn.microsoft.com/en-us/azure/storage/common/storage-sas-overview

### Shared Key
- Storage account keys  
  https://learn.microsoft.com/en-us/azure/storage/common/storage-account-keys-manage

---

## 4) Networking & Private Access (Advanced + Interview Important)

### Private Endpoint
- Private endpoints for Azure Storage  
  https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-overview

### Storage Firewall
- Configure Azure Storage firewalls and virtual networks  
  https://learn.microsoft.com/en-us/azure/storage/common/storage-network-security

### Managed VNet (Synapse)
- Synapse Managed Virtual Network  
  https://learn.microsoft.com/en-us/azure/synapse-analytics/security/synapse-workspace-managed-vnet

---

## 5) Encryption, Security, Compliance (Advanced)

### Encryption at rest
- Azure Storage encryption for data at rest  
  https://learn.microsoft.com/en-us/azure/storage/common/storage-service-encryption

### Customer Managed Keys (CMK)
- Customer-managed keys for Azure Storage encryption  
  https://learn.microsoft.com/en-us/azure/storage/common/customer-managed-keys-overview

### Microsoft Defender for Storage
- Defender for Storage  
  https://learn.microsoft.com/en-us/azure/defender-for-cloud/defender-for-storage-introduction

---

## 6) Data Management + Cost Optimization

### Lifecycle Management
- Azure Blob lifecycle management  
  https://learn.microsoft.com/en-us/azure/storage/blobs/lifecycle-management-overview

### Storage Tiers
- Blob storage access tiers  
  https://learn.microsoft.com/en-us/azure/storage/blobs/access-tiers-overview

### Monitoring + Logging
- Azure Storage monitoring  
  https://learn.microsoft.com/en-us/azure/storage/common/storage-monitoring-diagnosing-troubleshooting

### Azure Storage Metrics
- Azure Monitor metrics for Storage  
  https://learn.microsoft.com/en-us/azure/storage/common/monitor-storage

---

## 7) ADLS + Tools Integration (Data Engineering Focus)

### ADLS + ADF
- Copy activity in Azure Data Factory  
  https://learn.microsoft.com/en-us/azure/data-factory/copy-activity-overview

### ADLS + Synapse
- Synapse + ADLS integration  
  https://learn.microsoft.com/en-us/azure/synapse-analytics/security/how-to-grant-workspace-managed-identity-permissions

### ADLS + Databricks
- Azure Databricks access to ADLS Gen2  
  https://learn.microsoft.com/en-us/azure/databricks/connect/storage/azure-storage

---

## 8) PDF Resources (Free + High Quality)

### Azure Storage Documentation (Printable / PDF)
Microsoft docs can be printed to PDF:
- ADLS Gen2 docs (print to PDF from browser)  
  https://learn.microsoft.com/en-us/azure/storage/blobs/data-lake-storage-introduction

### DP-203 Study Guide (PDF style page)
- DP-203 study guide  
  https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/dp-203

### Azure Well-Architected Framework (Security + Cost)
- Azure Well-Architected Framework  
  https://learn.microsoft.com/en-us/azure/well-architected/

---

## 9) Best YouTube Resources (Basic → Advanced)

### ADLS Gen2 Full Course Search
- ADLS Gen2 tutorial full course  
  https://www.youtube.com/results?search_query=adls+gen2+tutorial+full+course

### RBAC vs ACL (Most important)
- ADLS RBAC vs ACL explained  
  https://www.youtube.com/results?search_query=adls+rbac+vs+acl

### Managed Identity + ADLS
- Managed Identity ADLS Gen2  
  https://www.youtube.com/results?search_query=managed+identity+adls+gen2

### Private Endpoint + Storage
- Azure Storage private endpoint  
  https://www.youtube.com/results?search_query=azure+storage+private+endpoint

### Lifecycle Management (Cost saving)
- Azure storage lifecycle management  
  https://www.youtube.com/results?search_query=azure+storage+lifecycle+management

### Databricks + ADLS Integration
- Databricks ADLS Gen2 integration  
  https://www.youtube.com/results?search_query=databricks+adls+gen2+integration

### ADF + ADLS Integration
- ADF to ADLS Gen2 copy  
  https://www.youtube.com/results?search_query=adf+copy+to+adls+gen2

---

## 10) Hands-on Labs (Free)

### Microsoft Learning GitHub Labs
- MicrosoftLearning labs (search ADLS / DP-203)  
  https://github.com/MicrosoftLearning

### Synapse Workshop (uses ADLS heavily)
- Synapse Analytics Workshop  
  https://github.com/microsoft/synapseworkshop

---

## 11) Interview Preparation Topics (Must Master)

You MUST be strong in:

### Core
- Storage account types
- Containers vs folders
- HNS (Hierarchical namespace)

### Security (Most asked)
- RBAC vs ACL (difference + how both apply)
- Managed Identity vs Service Principal
- SAS token vs Shared Key

### Networking
- Storage firewall
- Private endpoints
- Managed VNet (Synapse)

### Cost optimization
- Hot/Cool/Archive tiers
- Lifecycle management rules

### Monitoring
- Azure Monitor metrics
- Diagnostic logs
- Storage analytics logs

---

## 12) What You Will Master After This Module

By the end, you will confidently explain and implement:

✅ ADLS Gen2 structure + HNS  
✅ Containers, folders, access tiers  
✅ RBAC + ACL (full clarity)  
✅ Managed Identity, SPN, SAS  
✅ Private endpoints + firewall  
✅ Encryption (Microsoft managed vs CMK)  
✅ Lifecycle rules for cost saving  
✅ Monitoring + logging  
✅ Integration with Synapse, ADF, Databricks  
✅ Interview + DP-203 ADLS topics

---
