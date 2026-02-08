# Practical 12 — Private Endpoint + DNS (Advanced)

## Goal
Configure private access.

## Steps (high level)
1. Create VNet + subnet
2. Storage account → Private endpoint → create
3. Create private DNS zone:
   - privatelink.dfs.core.windows.net
4. Link DNS zone to VNet
5. Validate name resolution:
   - storage.dfs.core.windows.net resolves to private IP

## Interview point
Private endpoint + DNS misconfig is very common.
