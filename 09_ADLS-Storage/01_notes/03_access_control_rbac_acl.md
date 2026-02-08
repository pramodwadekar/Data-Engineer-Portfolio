# 03 - RBAC vs ACL (Most Important)

## RBAC (Role Based Access Control)
- Azure-level permissions
- assigned to user/group/service principal
- applies at storage account or container level

Common roles:
- Storage Blob Data Reader
- Storage Blob Data Contributor
- Storage Blob Data Owner

## ACL (Access Control List)
- POSIX style permissions
- applies at folder/file path level
- supports:
  - user
  - group
  - other
  - default ACLs

## Key interview point
RBAC gives permission to access the storage.
ACL controls permission inside the lake hierarchy.

## Real-world
Most enterprises use BOTH:
- RBAC at account/container
- ACL at folder level

---
