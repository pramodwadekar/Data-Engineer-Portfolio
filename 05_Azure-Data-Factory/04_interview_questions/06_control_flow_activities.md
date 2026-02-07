# 06 - Control Flow Activities (Interview Questions)

## 1) What are control flow activities?
Activities used to build pipeline logic and orchestration.

---

## 2) Common control flow activities
- If Condition
- ForEach
- Until
- Switch
- Execute Pipeline
- Wait
- Lookup
- Get Metadata
- Set Variable / Append Variable

---

## 3) ForEach usage?
Process:
- multiple tables
- multiple files
- list of items from lookup

---

## 4) Lookup usage?
Fetch small config data from SQL/file.

---

## 5) Get Metadata usage?
Check:
- file exists
- childItems
- file size

---

## 6) Execute Pipeline usage?
Parent-child modular pipelines.

---

## 7) Until usage?
Retry until condition is met.

---

## 8) Interview scenario
**Q:** How to process 50 tables with one pipeline?
A: Lookup + ForEach + dynamic copy.

---

## 9) Best practices
- keep pipelines modular
- avoid huge monolith pipelines
