# 02 - Linked Services, Datasets, Integration Runtime (Interview Questions)

## 1) What is a Linked Service?
Connection configuration to a system (ADLS, SQL, Databricks, SFTP).

---

## 2) What is a Dataset?
Represents the data structure/path/table inside linked service.

---

## 3) Linked Service vs Dataset?
- Linked service = connection
- Dataset = data reference

---

## 4) Can one linked service have multiple datasets?
Yes.

---

## 5) What is Integration Runtime (IR)?
Execution infrastructure for:
- copy activity
- data flows
- on-prem connectivity

---

## 6) Types of IR?
- Azure IR
- Self-hosted IR
- Azure-SSIS IR

---

## 7) When to use Self-hosted IR?
When connecting to:
- on-prem systems
- private networks
- firewall restricted resources

---

## 8) Does IR affect performance?
Yes. It affects throughput and parallelism.

---

## 9) What is Managed Virtual Network?
ADF-managed network for secure connectivity (advanced).

---

## 10) Best practice for linked services?
- use Key Vault
- avoid hardcoding secrets
- use managed identity where possible
