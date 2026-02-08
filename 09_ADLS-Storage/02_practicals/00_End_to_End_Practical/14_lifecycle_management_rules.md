# Practical 14 — Lifecycle Management (Cost Optimization)

## Goal
Move old data to cheaper tiers automatically.

## Steps
1. Storage account → Data management → Lifecycle management
2. Create rule:
   - If blob last modified > 30 days → move to Cool
   - > 180 days → move to Archive
   - > 365 days → delete

## Interview point
Lifecycle rules save huge cost in production.
