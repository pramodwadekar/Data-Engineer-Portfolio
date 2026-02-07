# 07 - Control Flow Activities (Real Pipeline Design)

Control flow activities help you build dynamic pipelines.

---

## 1) If Condition
Used for branching logic.

Example:
- if file exists → process
- else → skip

---

## 2) ForEach
Used for looping.

Example:
- process multiple tables
- process multiple files

---

## 3) Until
Used for retry loops until condition becomes true.

---

## 4) Switch
Used for multiple cases.

---

## 5) Execute Pipeline
Used for modular design:
- parent pipeline calls child pipeline

---

## 6) Lookup Activity
Reads small data (config table/file) for pipeline logic.

---

## 7) Get Metadata Activity
Used to check:
- file exists?
- folder exists?
- child items list

---

## 8) Common Interview Questions
### Q1: How to process multiple tables dynamically?
Use Lookup + ForEach.

### Q2: How to modularize pipelines?
Use Execute Pipeline.

---

## 9) Best Practices
- prefer metadata-driven pipelines
- keep control flow logic simple
- use child pipelines for reuse
