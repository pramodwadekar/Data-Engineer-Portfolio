# 🔐 SQL DCL (DATA CONTROL LANGUAGE)

📖 **Introduction**  
**DCL (Data Control Language)** is a part of SQL used to **control access and permissions** in a database.  
It helps database administrators manage **who can do what** with database objects like tables, views, and procedures.

DCL is mainly used for **security and access control**.

---

## 🔹 Why Use DCL?

- To control user access to database objects  
- To protect sensitive data  
- To assign roles and permissions  
- To prevent unauthorized operations  
- To manage database security efficiently  

---

## 🔹 What is DCL?

DCL includes SQL commands that **grant and revoke permissions**.

Main DCL commands:
- `GRANT` → Give permissions to users/roles  
- `REVOKE` → Remove permissions from users/roles  

(Some databases also use `DENY`.)

---

## 🔹 Common Privileges

| Privilege | Description |
|-----------|-------------|
| SELECT | Allows reading data from a table/view |
| INSERT | Allows inserting new data |
| UPDATE | Allows modifying existing data |
| DELETE | Allows deleting data |
| REFERENCES | Allows creating foreign keys |
| EXECUTE | Allows executing procedures/functions |
| ALL / ALL PRIVILEGES | Gives all permissions |

---

## 🔹 Basic Syntax

```sql
-- Grant permission
GRANT privilege_name
ON object_name
TO user_name;

-- Revoke permission
REVOKE privilege_name
ON object_name
FROM user_name;



🔹 Examples
1️⃣ Grant SELECT Permission on Employee Table
GRANT SELECT
ON Employee
TO user1;


👉 Now user1 can read data from Employee.

2️⃣ Grant Multiple Permissions
GRANT SELECT, INSERT, UPDATE
ON Employee
TO user1;


👉 user1 can read, insert, and update records in Employee.

3️⃣ Grant All Permissions
GRANT ALL
ON Employee
TO user1;


👉 Gives full control on Employee to user1.

4️⃣ Revoke a Permission
REVOKE INSERT
ON Employee
FROM user1;


👉 Now user1 can no longer insert data into Employee.

5️⃣ Revoke All Permissions
REVOKE ALL
ON Employee
FROM user1;


👉 Removes all permissions from user1 on Employee.

🔹 Roles (Optional Concept)

Instead of giving permissions to each user, you can give them to a role.

-- Create role (DB dependent)
CREATE ROLE reporting_role;

-- Grant permission to role
GRANT SELECT ON Employee TO reporting_role;

-- Assign role to user
GRANT reporting_role TO user1;

🔹 Advantages of DCL

✅ Improves database security

✅ Controls user access

✅ Protects sensitive data

✅ Supports role-based access control

✅ Easy to manage permissions

🔹 Important Points

Only DBA or authorized users can use DCL commands

Permissions can be given on tables, views, procedures, etc.

Use least privilege principle (give only required access)

Be careful while using GRANT ALL

🔹 Summary

DCL is used for access control and security 🔐

Main commands: GRANT and REVOKE

Helps manage who can read, insert, update, delete data

Very important for secure database systems
