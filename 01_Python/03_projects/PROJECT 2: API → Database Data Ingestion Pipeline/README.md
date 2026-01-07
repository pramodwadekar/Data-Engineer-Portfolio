# API → Database Data Ingestion Pipeline (Python)

## 1. Problem Statement
Ingest data from a REST API and store it in a relational database
for analytics and downstream processing.

---

## 2. Architecture

REST API → Python Pipeline → SQLite Database

---

## 3. Tech Stack
- Python
- Requests
- Pandas
- SQLite
- Logging

---

## 4. Pipeline Flow
1. Fetch data from REST API
2. Validate API response
3. Transform JSON into tabular format
4. Store data in database

---

## 5. Error Handling
- API failures
- Empty or invalid API responses
- Database errors
- Centralized logging

---

## 6. How to Run
bash
python pipeline.py

## 7. Output
- Data stored in api_data.db

- Table: posts

## 8. Learnings
- API ingestion using Python

- Data validation

- SQL database integration

- Config-driven pipelines
