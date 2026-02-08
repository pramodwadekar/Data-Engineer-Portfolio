# Practical 05 — ACL Setup (Access ACL)

## Goal
Give folder-level access.

## Steps
1. Container raw → select folder `raw/orders/`
2. Manage ACL
3. Add principal:
   - Synapse workspace managed identity OR your user
4. Give permissions:
   - Read (r)
   - Write (w)
   - Execute (x)

## Important
For folder access you need execute (x) to traverse.

## Interview point
Most permission issues are missing x on folder.
