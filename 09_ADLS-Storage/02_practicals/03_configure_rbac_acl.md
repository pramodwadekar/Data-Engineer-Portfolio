# 03 - Configure RBAC + ACL (Practical)

## Goal
Set access for users/service principals.

### Steps
1. Assign RBAC at container:
   - Storage Blob Data Contributor
2. Set ACL at folder:
   - user: read/write
   - group: read
   - other: none

### Interview point
RBAC without ACL still fails if ACL denies.

---
