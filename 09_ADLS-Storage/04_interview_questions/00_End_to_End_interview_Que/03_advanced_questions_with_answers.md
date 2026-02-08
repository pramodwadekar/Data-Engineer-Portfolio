# 03 — Advanced ADLS Gen2 Interview Questions (With Answers)

## Security + Networking
### 1) What is a private endpoint?
**Answer:** A private IP in a VNet that connects securely to ADLS without public internet.

### 2) Why private DNS zone is required?
**Answer:** To resolve storage endpoints to private IPs.

### 3) What is storage firewall?
**Answer:** Network rule restricting storage access to selected networks.

### 4) Common private endpoint issue?
**Answer:** DNS misconfiguration causing access failure.

---

## Encryption
### 5) Microsoft-managed keys vs CMK?
**Answer:**
- Microsoft-managed: default, simplest
- CMK: customer controls key, stored in Key Vault

### 6) Why CMK used?
**Answer:** Compliance in banking/healthcare.

---

## Monitoring
### 7) What are diagnostic logs?
**Answer:** Logs that record storage read/write/delete operations, authentication, and requests.

### 8) Where do you send logs?
**Answer:** Log Analytics, Event Hub, or another storage account.

---

## Performance
### 9) What is the best practice file size?
**Answer:** Typically 100MB to 1GB parquet files (depends on workload).

### 10) How to handle small files?
**Answer:** Compaction using Spark (coalesce/repartition), write fewer larger files.

### 11) Why partition folders?
**Answer:** Partition pruning reduces scanned data in serverless SQL and Spark.

---

## Governance
### 12) What is Defender for Storage?
**Answer:** Security service that detects malware, suspicious access, and threats.

---

## Real-world
### 13) Why portal access works but pipeline fails?
**Answer:** Portal uses your user identity, pipeline uses managed identity or service principal.
