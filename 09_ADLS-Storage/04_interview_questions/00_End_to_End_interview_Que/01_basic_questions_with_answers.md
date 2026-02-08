# 01 — Basic ADLS Gen2 Interview Questions (With Answers)

## 1) What is ADLS Gen2?
**Answer:** Azure Data Lake Storage Gen2 is Azure Blob Storage with hierarchical namespace (HNS) and ACL support, optimized for analytics.

## 2) Why do Data Engineers use ADLS?
**Answer:** It is scalable, cheap, supports big data tools, and integrates with Synapse/ADF/Databricks.

## 3) What is HNS?
**Answer:** Hierarchical Namespace enables real folders, fast rename operations, and ACL permissions.

## 4) Blob storage vs ADLS Gen2?
**Answer:** ADLS Gen2 supports HNS and ACLs. Blob storage has virtual folders and no ACL.

## 5) What is a container?
**Answer:** Top-level grouping inside a storage account (like S3 bucket).

## 6) Common containers in a data lake?
**Answer:** raw, curated, gold, logs.

## 7) What is the DFS endpoint?
**Answer:** `dfs.core.windows.net` used for ADLS Gen2 filesystem operations.

## 8) What is the Blob endpoint?
**Answer:** `blob.core.windows.net` used for blob operations.

## 9) What is a data lake partition?
**Answer:** Folder-based partitioning such as `year=2025/month=08/day=05` to improve query performance.

## 10) What is the ABFSS path?
**Answer:** A secure path used by Spark:
`abfss://<container>@<storage>.dfs.core.windows.net/<path>`

## 11) What is the raw layer?
**Answer:** Immutable copy of source data.

## 12) What is curated layer?
**Answer:** Cleaned and standardized data.

## 13) What is gold layer?
**Answer:** Business-ready aggregates and marts.

## 14) How do you upload files to ADLS?
**Answer:** Azure portal, Azure Storage Explorer, AzCopy, SDKs, ADF, Synapse pipelines.

## 15) What is the biggest ADLS interview topic?
**Answer:** RBAC vs ACL.
