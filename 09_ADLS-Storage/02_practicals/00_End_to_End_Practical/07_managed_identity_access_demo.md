# Practical 07 — Managed Identity Access Demo (Synapse/ADF)

## Goal
Use Managed Identity (MI) to access ADLS without secrets.

## Steps
1. Identify Synapse workspace managed identity
2. Storage IAM → add role:
   - Storage Blob Data Contributor
3. ADLS folder ACL → add MI with rwx
4. In Synapse:
   - create linked service to ADLS using Managed Identity
5. Validate by browsing files

## Interview point
Managed Identity is preferred for production.
