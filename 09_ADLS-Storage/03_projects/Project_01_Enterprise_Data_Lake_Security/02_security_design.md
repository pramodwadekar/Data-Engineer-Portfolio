# Security Design

## Engineers
RBAC: Storage Blob Data Contributor
ACL: rwx on raw/curated/gold

## Analysts
RBAC: Storage Blob Data Reader
ACL: r-x on gold only

## Default ACL
Set default ACL at top folders for inheritance.
