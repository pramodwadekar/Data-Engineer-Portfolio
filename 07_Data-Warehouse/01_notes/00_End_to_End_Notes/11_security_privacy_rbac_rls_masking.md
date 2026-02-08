# 11 — Security, Privacy, RBAC, RLS, Masking (Warehouse)

## 1) Why security matters?
Warehouses store sensitive data:
- PII (phone, email)
- finance
- employee data

---

## 2) RBAC (Role Based Access Control)
You assign:
- roles
- permissions
- groups

Instead of giving access to individuals.

Example:
- Analyst role = read access to marts
- Engineer role = write access to staging

---

## 3) Row Level Security (RLS)
Restrict rows based on user.

Example:
- West region analysts see only West sales.

---

## 4) Column Level Security
Restrict columns:
- salary
- SSN
- phone

---

## 5) Dynamic Data Masking
Mask sensitive values:
- show last 4 digits only

Example:
- 9876543210 → ******3210

---

## 6) Encryption
- At rest
- In transit

---

## 7) Audit logging
Track:
- who accessed what
- when
- what query

---

## 8) Interview questions
- What is RBAC?
- What is RLS?
- What is masking?
- How do you secure PII?
