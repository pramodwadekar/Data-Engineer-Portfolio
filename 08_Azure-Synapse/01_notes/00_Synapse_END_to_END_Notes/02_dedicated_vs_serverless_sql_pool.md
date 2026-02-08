# 02 — Dedicated SQL Pool vs Serverless SQL Pool (Most Important)

## Dedicated SQL Pool
### What it is
A provisioned MPP data warehouse (formerly SQL DW).

### Key points
- You pay for provisioned compute (DWUs)
- Data stored in relational tables
- Best for enterprise BI performance
- Supports columnstore, distribution, partitions

### Use cases
- Large structured reporting workloads
- Consistent performance requirement
- Heavy concurrent BI dashboards

---

## Serverless SQL Pool
### What it is
Query engine over files in ADLS (no provisioning).

### Key points
- Pay per TB scanned
- Great for ad-hoc queries
- Works with Parquet/CSV/JSON
- Uses OPENROWSET, external tables, CETAS

### Use cases
- Data exploration
- Quick reporting directly from lake
- Creating external data marts

---

## Dedicated vs Serverless (Interview Table)
| Feature | Dedicated | Serverless |
|---|---|---|
| Pricing | Provisioned DWU | Pay per TB scanned |
| Storage | SQL tables | ADLS files |
| Performance | High, consistent | Depends on file layout |
| Best for | Enterprise BI | Ad-hoc + lake queries |
| Scaling | Pause/Resume | Auto |
| Distribution | Yes | No |

---

## Most asked interview questions
- Which is cheaper?
- Which is faster?
- When to use CETAS?
- How to optimize serverless scanning?
