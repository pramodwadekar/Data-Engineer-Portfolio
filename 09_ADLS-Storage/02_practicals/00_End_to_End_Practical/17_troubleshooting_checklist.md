# Practical 17 — Troubleshooting Checklist (Real World)

## Issue: Permission denied
- Check RBAC role
- Check ACL on folder
- Check execute permission on parent folders

## Issue: Works in portal but not in Synapse
- Synapse uses managed identity
- Give MI permissions

## Issue: Private endpoint fails
- DNS not configured
- Storage firewall blocking

## Issue: Cannot list directory
- Missing x permission

## Issue: Serverless query slow
- CSV + small files + no partitions
