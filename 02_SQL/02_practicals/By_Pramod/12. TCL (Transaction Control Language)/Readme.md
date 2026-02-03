# 🔄 SQL TCL (TRANSACTION CONTROL LANGUAGE)

📖 **Introduction**  
**TCL (Transaction Control Language)** is a part of SQL used to **manage transactions** in a database.  
A **transaction** is a group of SQL statements that are executed as a **single unit of work**.

TCL helps ensure **data consistency, reliability, and integrity** in database operations.

---

## 🔹 Why Use TCL?

- To control database transactions  
- To ensure data consistency and integrity  
- To group multiple SQL statements into one logical unit  
- To save changes permanently or undo them  
- To handle errors safely in database operations  

---

## 🔹 What is a Transaction?

A **transaction** is a sequence of one or more SQL operations that must be:
- Either **fully completed** (COMMIT)  
- Or **fully undone** (ROLLBACK)  

A transaction follows **ACID** properties:
- **A**tomicity – All or nothing  
- **C**onsistency – Data remains valid  
- **I**solation – Transactions don’t interfere  
- **D**urability – Committed data is permanent  

---

## 🔹 TCL Commands

| Command | Description |
|---------|-------------|
| COMMIT | Saves all changes permanently |
| ROLLBACK | Undoes changes since last COMMIT |
| SAVEPOINT | Sets a point to rollback to |
| ROLLBACK TO SAVEPOINT | Rolls back to a specific savepoint |
| SET TRANSACTION | Sets transaction properties (DB dependent) |

---

## 🔹 Basic Syntax

```sql
-- Commit transaction
COMMIT;

-- Rollback transaction
ROLLBACK;

-- Create savepoint
SAVEPOINT savepoint_name;

-- Rollback to savepoint
ROLLBACK TO savepoint_name;



🔹 Examples
1️⃣ Using COMMIT
INSERT INTO Employee(EmpID, EmpName, Salary)
VALUES (101, 'Rahul', 50000);

COMMIT;


👉 The data is now saved permanently in the database.

2️⃣ Using ROLLBACK
INSERT INTO Employee(EmpID, EmpName, Salary)
VALUES (102, 'Amit', 45000);

ROLLBACK;


👉 The insert operation is undone.

3️⃣ Using SAVEPOINT
INSERT INTO Employee VALUES (103, 'Neha', 40000);
SAVEPOINT sp1;

INSERT INTO Employee VALUES (104, 'Riya', 42000);
SAVEPOINT sp2;

INSERT INTO Employee VALUES (105, 'Karan', 48000);


Rollback to sp2:

ROLLBACK TO sp2;


👉 Only the last insert (Karan) is undone.

4️⃣ Commit After Multiple Operations
UPDATE Employee SET Salary = Salary + 5000 WHERE EmpID = 101;
DELETE FROM Employee WHERE EmpID = 102;

COMMIT;


👉 Both operations are saved together as one transaction.

🔹 Important Points

TCL works only with DML commands (INSERT, UPDATE, DELETE)

DDL commands (CREATE, DROP, ALTER) usually auto-commit (DB dependent)

Use SAVEPOINT for partial rollback

Once you COMMIT, you cannot rollback those changes

Use transactions for safe and reliable data operations

🔹 Advantages of TCL

✅ Maintains data integrity

✅ Allows undoing mistakes safely

✅ Groups multiple operations into one unit

✅ Supports error handling and recovery

✅ Essential for multi-user databases

🔹 Summary

TCL controls transactions in SQL 🔄

Main commands: COMMIT, ROLLBACK, SAVEPOINT

Helps ensure ACID properties

Very important for safe database operations
