# 18 - Unity Catalog Permissions (GRANT/REVOKE) Practical

🎯 Goal: Learn how UC permissions work in real projects.

⚠️ Note:
To run GRANT/REVOKE you need privileges (admin or object owner).

---

## ✅ What you will learn
- Grant USE CATALOG / USE SCHEMA
- Grant SELECT / MODIFY
- Revoke permissions
- Permission troubleshooting

---

## 1) Create Group-based Access (Concept)
In real companies, permissions are given to groups:
- data_engineers
- analysts
- ml_team

---

## 2) Grant Catalog Access
```sql
GRANT USE CATALOG ON CATALOG main TO `data_engineers`;
```

---

## 3) Grant Schema Access
```sql
GRANT USE SCHEMA ON SCHEMA main.de_training TO `data_engineers`;
```

---

## 4) Grant Table Access
```sql
GRANT SELECT ON TABLE main.de_training.employees_uc TO `analysts`;
```

---

## 5) Grant Modify Access
```sql
GRANT MODIFY ON TABLE main.de_training.employees_uc TO `data_engineers`;
```

---

## 6) Revoke Access
```sql
REVOKE SELECT ON TABLE main.de_training.employees_uc FROM `analysts`;
```

---

## 7) Show Grants
```sql
SHOW GRANTS ON TABLE main.de_training.employees_uc;
```

---

## 8) Common Permission Errors
- missing USE CATALOG
- missing USE SCHEMA
- missing SELECT

---

## 9) Interview Talking Points
- UC permissions are hierarchical
- groups are recommended over users
- least privilege is standard

---

## 10) Output
After this practical:
✅ you understand UC permissions  
✅ you can explain GRANT/REVOKE  
✅ you can debug permission issues  

---

✅ Next: `19_uc_external_location_volume_practical.md`
