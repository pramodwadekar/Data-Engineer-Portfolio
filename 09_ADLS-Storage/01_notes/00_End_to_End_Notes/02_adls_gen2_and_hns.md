# 02 — ADLS Gen2 and Hierarchical Namespace (HNS)

## What is ADLS Gen2?
Azure Data Lake Storage Gen2 is:
- Azure Blob Storage + hierarchical namespace + ACLs
- Optimized for big data analytics

## Why HNS is important?
HNS enables:
- Real folders
- Fast rename directory operations
- ACLs on folders and files
- POSIX-like permissions

## Blob vs ADLS Gen2
Blob = virtual folders, no ACL
ADLS = real folders, ACL, fast rename

## Interview point
ADLS Gen2 is default data lake for Synapse, Databricks, ADF.
