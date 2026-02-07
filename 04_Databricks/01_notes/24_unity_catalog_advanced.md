# 24 - Unity Catalog Advanced (Bonus - Top 1%)

This note covers advanced Unity Catalog topics.

---

## 1) External Locations (Deep)
External locations provide a secure way to access cloud storage.

They connect:
- storage credential
- cloud path

Example:
- external location: `raw_location`
- path: `abfss://raw@storage.../`

---

## 2) Storage Credentials (Deep)
Storage credentials define how Databricks accesses storage.

Examples:
- Azure managed identity
- AWS IAM role

Best practice:
Use managed identity / IAM roles instead of storage keys.

---

## 3) Volumes (Deep)
Volumes are UC-managed file storage.

Types:
- managed volume
- external volume

Use case:
- landing zone for raw files
- storing reference files

---

## 4) Data Sharing (Delta Sharing)
Unity Catalog supports Delta Sharing:
- share data securely with other organizations
- without copying data

---

## 5) Lineage + Audit Logs
UC provides:
- table lineage
- audit logs (who accessed what)

Important for compliance.

---

## 6) Service Principals in UC
Production jobs should use:
- service principals
instead of personal accounts.

---

## 7) Environment Strategy (Best Practice)
Recommended:
- `dev_catalog`
- `qa_catalog`
- `prod_catalog`

This avoids mixing dev and prod data.

---

## 8) Interview Questions (Advanced)
### Q1) How do you securely access ADLS in UC?
Use storage credential + external location + grants.

### Q2) How do you share Delta table externally?
Use Delta Sharing.

### Q3) How do you implement governance?
Use UC permissions + audit logs + lineage.

---

## 9) Summary
Unity Catalog advanced topics make you stand out in interviews.

---

✅ Databricks notes complete.
