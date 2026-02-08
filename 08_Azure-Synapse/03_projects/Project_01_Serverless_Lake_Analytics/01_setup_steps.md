# 01 — Setup Steps

## Step 1: ADLS folders
Create:
- raw/orders/
- gold/monthly_sales/

## Step 2: Upload sample parquet
Upload file:
- raw/orders/orders_2024.parquet

## Step 3: Permissions
Give Synapse MI:
- RBAC: Storage Blob Data Contributor
- ACL: read/execute on containers
