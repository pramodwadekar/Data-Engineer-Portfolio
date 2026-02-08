# 99 — ADLS Interview Cheat Sheet

## Core
- ADLS Gen2 = Blob + HNS + ACL
- Endpoint: dfs.core.windows.net
- Spark path: abfss://container@storage.dfs.core.windows.net/path

## Security (Most asked)
- Authorization = RBAC + ACL
- ACL uses rwx
- Folder execute (x) = traverse
- Default ACL = inheritance

## Auth
- Managed Identity (preferred)
- Service Principal (OAuth)
- SAS (temporary)
- Shared key (avoid)

## Networking
- Firewall
- Private endpoint
- Private DNS required

## Encryption
- Microsoft-managed keys
- CMK via Key Vault

## Cost
- Hot/Cool/Archive
- Lifecycle rules

## Performance
- Parquet/Delta
- Partition folders
- Avoid small files
