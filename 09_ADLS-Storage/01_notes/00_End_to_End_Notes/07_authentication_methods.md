# 07 — Authentication Methods

## Managed Identity (recommended)
- No secrets
- Best for Synapse/ADF/Databricks

## Service Principal (SPN)
- client_id + secret/cert
- used for automation/cross tenant

## SAS token
- temporary scoped access

## Shared key
- full access (avoid in production)
