# Practical 01 — Create ADLS Gen2 Storage Account (HNS ON)

## Goal
Create a correct ADLS Gen2 storage account for Data Engineering.

## Steps
1. Azure portal → Storage accounts → Create
2. Performance: Standard
3. Redundancy: LRS (dev) / ZRS or GRS (prod)
4. Advanced tab:
   - Enable **Hierarchical namespace (HNS) = ON**
5. Create storage account

## Validation
- Go to Data Lake Storage → Containers (should be visible)

## Interview point
Without HNS ON, you cannot use ACL properly.
