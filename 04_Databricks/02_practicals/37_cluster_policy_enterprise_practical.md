# 37 - Cluster Policy Practical (Enterprise)

🎯 Goal: Understand cluster policies used in enterprises.

---

## ✅ What you will learn
- What is cluster policy
- Why companies use it
- What restrictions exist
- How it impacts Data Engineers

---

## 1) What is Cluster Policy?
A cluster policy is a set of rules that restrict cluster creation.

It enforces:
- allowed node types
- max workers
- auto termination
- runtime versions
- security configs

---

## 2) Why Companies Use Cluster Policies?
Because:
- cost control
- security
- standardization
- governance

---

## 3) Common Policy Rules
- auto termination must be enabled
- max workers = 4
- only approved DBR versions
- no public IPs
- only certain instance types

---

## 4) Practical Task (UI)
Go to:
Compute → Create cluster

If policies exist, you will see:
- dropdown of policies

Select policy and observe:
- some options locked

---

## 5) Interview Talking Points
- cluster policies ensure compliance and cost control
- DE must work within policy constraints
- job clusters are often mandatory

---

## 6) Output
After this practical:
✅ you understand enterprise cluster governance  
✅ you can explain why policies exist  

---

🎉 Databricks Practicals Completed (01-37)
