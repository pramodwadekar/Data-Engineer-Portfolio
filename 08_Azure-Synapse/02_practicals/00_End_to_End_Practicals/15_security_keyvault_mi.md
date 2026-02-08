# Practical 15 — Security: Managed Identity + Key Vault

## Managed Identity (preferred)
- Assign RBAC to Synapse MI
- No secrets stored

## Key Vault (if secrets needed)
- Store SQL passwords / SP secrets
- Use in linked services

## Interview point
Enterprise = MI + Key Vault + private endpoints.
