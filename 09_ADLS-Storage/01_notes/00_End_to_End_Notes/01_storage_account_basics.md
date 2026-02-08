# 01 — Azure Storage Account Basics

## What is an Azure Storage Account?
A storage account is the top-level resource that provides:
- Blob storage
- File shares
- Queues
- Tables

For Data Engineering, we mostly use:
Blob Storage (ADLS Gen2 is built on blob).

## Storage Account Types
- Standard (general purpose v2) → most common
- Premium → high performance (rare for ADLS)

## Replication Options
- LRS
- ZRS
- GRS / RA-GRS

## Endpoints
- blob.core.windows.net
- dfs.core.windows.net (ADLS)

## Pricing factors
- Storage used (GB)
- Transactions
- Data transfer
- Access tier (hot/cool/archive)
