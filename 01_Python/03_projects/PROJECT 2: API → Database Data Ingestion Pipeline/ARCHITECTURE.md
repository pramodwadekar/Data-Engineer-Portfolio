# API → Database Data Ingestion Pipeline  
### Architecture & Design Documentation

This document explains the **architecture, design decisions, and data flow**
of the API → Database Data Ingestion Pipeline.

It is intended for:
- Interviewers
- Reviewers
- Developers onboarding to the project

---

## 1. Project Objective

The objective of this project is to design a **production-style Python data pipeline**
that ingests data from a REST API, validates it, transforms it into a structured format,
and stores it in a relational database.

The pipeline is designed to be:
- Modular
- Config-driven
- Fault-tolerant
- Easy to extend to cloud and production systems

---

## 2. High-Level Architecture

REST API
↓
Python Ingestion Layer
↓
Validation & Transformation
↓
Relational Database (SQLite / Postgres)

---

## 3. Folder Structure & Responsibilities

PROJECT 2: API → Database Data Ingestion Pipeline/
│
├── data/
│ └── api_data.db
│
├── config.json
├── pipeline.py
├── api_ingestion.py
├── validation.py
├── db_handler.py
├── logger.py
├── README.md
└── ARCHITECTURE.md


### 3.1 `data/`
- Stores the database file
- Represents persistent storage layer
- SQLite is used for local simulation (easily replaceable with Postgres)

---

## 4. File-Level Design Explanation

### `config.json`
Centralized configuration file.

**Purpose:**
- Avoid hardcoding values
- Make pipeline environment-independent

**Contains:**
- API URL
- Request timeout
- Database path
- Target table name

---

### `pipeline.py` (Main Orchestrator)
This is the **entry point** of the pipeline.

**Responsibilities:**
- Load configuration
- Control Extract → Validate → Transform → Load flow
- Handle errors and logging
- Coordinate all components

This file does **not** contain business logic directly.

---

### `api_ingestion.py`
Responsible for API communication.

**Responsibilities:**
- Make HTTP GET requests
- Handle HTTP errors
- Return raw API response

Why separated?
- API logic can change independently
- Easier testing and reuse

---

### `validation.py`
Responsible for **data quality checks**.

**Responsibilities:**
- Validate API response is not empty
- Validate expected data structure
- Prevent bad data from entering database

This ensures **data correctness** early in the pipeline.

---

### `db_handler.py`
Responsible for database operations.

**Responsibilities:**
- Create tables if not present
- Insert transformed data
- Abstract database logic from pipeline

Why separate?
- Database logic is isolated
- Easy to switch SQLite → Postgres

---

### `logger.py`
Centralized logging configuration.

**Responsibilities:**
- Consistent log format
- Central control of logging behavior
- Production-style observability

---

## 5. Pipeline Execution Flow (Step-by-Step)

### Step 1: Configuration Load
- Pipeline reads `config.json`
- Extracts runtime parameters

---

### Step 2: Extract (API Ingestion)
- Calls REST API using Python `requests`
- Handles HTTP errors and timeouts
- Retrieves raw JSON response

---

### Step 3: Validate
- Ensures API response is not empty
- Ensures expected keys exist
- Stops pipeline early if validation fails

---

### Step 4: Transform
- Converts JSON to pandas DataFrame
- Renames columns
- Selects required fields
- Prepares data for relational storage

---

### Step 5: Load
- Establishes database connection
- Creates table if not exists
- Inserts records into database
- Commits transaction

---

## 6. Error Handling Strategy

- All pipeline steps wrapped in `try-except`
- API failures are logged clearly
- Validation failures stop execution
- Database errors are surfaced immediately
- Pipeline fails safely (no partial corruption)

---

## 7. Logging Strategy

The pipeline logs:
- Pipeline start and end
- API request activity
- Transformation steps
- Errors and failures

This enables:
- Debugging
- Monitoring
- Production readiness

---

## 8. Design Decisions & Justification

### Why Config-Driven?
- Easy environment change
- Avoids hardcoded paths
- Industry standard for DE pipelines

---

### Why Modular Files?
- Clear separation of concerns
- Easier maintenance
- Individual components testable

---

### Why SQLite?
- Lightweight local database
- No setup required
- Same SQL logic works for Postgres

---

### Why Python?
- Best tool for API ingestion
- Rich ecosystem
- Acts as orchestration layer in DE systems

---

## 9. Interview Explanation (How to Say It)

**One-liner:**
> “I built a Python pipeline that ingests REST API data, validates it,
transforms JSON into a structured format, and loads it into a relational database
using a modular, config-driven design.”

**If interviewer asks deeper:**
- Explain separation of ingestion, validation, and loading
- Explain why validation is critical before database writes
- Explain how this scales to Postgres or cloud

---

## 10. Future Enhancements

- Replace SQLite with Postgres
- Add incremental ingestion
- Add API pagination handling
- Add orchestration using ADF or Airflow
- Move transformation logic to Spark for scale

---

## Final Note

This project is intentionally designed to mirror **real-world Data Engineering pipelines**
and demonstrate production-level thinking rather than simple scripting.
