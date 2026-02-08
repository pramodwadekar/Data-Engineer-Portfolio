# 05 — RBAC vs ACL (Most Important Topic)

## RBAC
Applied at storage account / container level.
Managed in IAM.

Roles:
- Storage Blob Data Reader
- Storage Blob Data Contributor
- Storage Blob Data Owner

## ACL
Applied at folder/file level.
POSIX style rwx.

## Key rule
You need BOTH RBAC and ACL.

Example:
RBAC present but ACL missing → access denied.
ACL present but RBAC missing → access denied.

## Default ACL vs Access ACL
- Access ACL: applies to existing
- Default ACL: inherited by new files/folders
