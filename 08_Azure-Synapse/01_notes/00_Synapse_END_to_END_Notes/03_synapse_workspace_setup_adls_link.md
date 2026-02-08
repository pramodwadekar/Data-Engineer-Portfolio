# 03 — Synapse Workspace Setup + ADLS Integration

## Step-by-step (conceptual)
1. Create ADLS Gen2 storage account
2. Create container:
   - raw
   - curated
   - gold
3. Create Synapse workspace
4. Link ADLS as primary storage
5. Enable managed identity
6. Assign RBAC:
   - Storage Blob Data Contributor
7. Open Synapse Studio and create linked services

---

## Important concepts
### Managed Identity
Synapse workspace has a managed identity.
Use it to access:
- ADLS
- Key Vault
- SQL DB
without storing passwords.

### ACL vs RBAC
- RBAC: Azure role assignment
- ACL: filesystem permissions inside ADLS

Both must be correct.

---

## Common errors
- “Permission denied” due to missing ACL
- Linked service works but queries fail due to missing RBAC
