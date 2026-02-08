# Practical 01 — Workspace Setup + ADLS Permissions

## Goal
Create Synapse workspace and connect ADLS Gen2 correctly.

## Steps
1. Create ADLS Gen2 (Hierarchical namespace = ON)
2. Create containers: `raw`, `curated`, `gold`
3. Create Synapse workspace and link default ADLS
4. Storage IAM → give Synapse Managed Identity:
   - Storage Blob Data Contributor
5. ADLS ACLs → give Synapse MI:
   - Read + Execute on folders

## Validation
Synapse Studio → Data → Linked → Browse containers.

## Common issue
If RBAC is correct but ACL missing → access denied.

## Interview point
RBAC + ACL both are required.
