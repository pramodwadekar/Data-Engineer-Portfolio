# 10 — Data Quality, Governance, Metadata & Lineage

## 1) Why data quality is critical?
A warehouse is trusted only if data is correct.

Bad data leads to:
- wrong KPIs
- wrong business decisions
- loss of trust

---

## 2) Common Data Quality checks
### Basic checks
- Null check
- Data type check
- Range check
- Duplicate check
- Referential integrity (fact ↔ dimension)

### Business checks
- Sales cannot be negative
- Order date cannot be future
- Customer age cannot be 200

---

## 3) Data validation layers
- Source validation
- Staging validation
- Warehouse validation
- Reporting validation

---

## 4) Data governance
Governance includes:
- ownership (data steward)
- policies
- access control
- retention rules
- compliance (GDPR)

---

## 5) Metadata
Metadata = data about data.

Types:
- Technical metadata (schema, columns)
- Business metadata (meaning, KPI definitions)
- Operational metadata (load time, run status)

---

## 6) Data lineage
Lineage shows:
- where data came from
- transformations applied
- where it is used

Tools:
- Microsoft Purview
- Collibra
- DataHub
- OpenLineage

---

## 7) Interview questions
- What checks do you implement?
- What is data lineage?
- What is metadata?
