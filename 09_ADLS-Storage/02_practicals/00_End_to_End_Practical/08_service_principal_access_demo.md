# Practical 08 — Service Principal (SPN) Access (OAuth)

## Goal
Access ADLS using service principal.

## Steps
1. Entra ID → App registrations → New registration
2. Create client secret
3. Storage IAM → assign role to SPN
4. ADLS folder ACL → add SPN
5. Use SPN in:
   - Databricks
   - ADF
   - custom apps

## Interview point
SPN used when MI not possible (cross tenant, external apps).
