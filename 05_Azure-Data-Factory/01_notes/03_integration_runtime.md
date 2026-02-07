# 03 - Integration Runtime (IR) (Very Important)

## 1) What is Integration Runtime?
Integration Runtime is the **compute infrastructure** used by ADF to:
- move data (copy activity)
- run data flows
- connect to on-prem systems

Think of it as:
> “ADF execution engine”

---

## 2) Types of Integration Runtime
### A) Azure IR
- managed by Microsoft
- used for cloud-to-cloud copy

### B) Self-hosted IR
- installed on your VM/on-prem machine
- used for:
  - on-prem SQL Server
  - file server
  - private network access

### C) Azure-SSIS IR
- used for running SSIS packages in cloud

---

## 3) When do you use Self-hosted IR?
When source/target is inside:
- corporate network
- private VNet
- on-prem datacenter

---

## 4) IR and Performance
IR impacts:
- copy throughput
- parallelism
- data movement speed

---

## 5) Common Interview Questions
### Q1: What is IR?
Compute for data movement.

### Q2: When to use Self-hosted IR?
On-prem or private network.

### Q3: Can IR be shared?
Yes, can be shared across pipelines.

---

## 6) Best Practices
- use Azure IR for cloud sources
- use Self-hosted IR for on-prem
- monitor IR performance
