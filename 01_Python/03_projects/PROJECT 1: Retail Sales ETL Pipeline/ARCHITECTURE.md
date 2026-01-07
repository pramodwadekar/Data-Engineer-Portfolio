# Retail Sales ETL Pipeline – Architecture & Design Explanation

This document provides a **detailed explanation of the project structure,
pipeline flow, and design decisions** used in the Retail Sales ETL Pipeline.

It is intended for:
- Interviewers
- Code reviewers
- Developers onboarding to the project

---

## 1. Project Objective

The goal of this project is to build a **production-style ETL pipeline using Python**
that processes retail sales data and generates aggregated insights.

The pipeline is designed to be:
- Config-driven
- Modular
- Fault-tolerant
- Easy to extend

---

## 2. High-Level Architecture

Raw Sales Data (CSV)
↓
Python ETL Pipeline
↓
Data Validation & Logging
↓
Aggregated Sales Output (CSV)

---

## 3. Folder Structure Explanation

PROJECT 1: Retail Sales ETL Pipeline/
│
├── data/
│ ├── raw/
│ │ └── sales.csv
│ └── processed/
│ └── sales_summary.csv
│
├── config.json
├── etl_pipeline.py
├── validation.py
├── logger.py
├── README.md
└── ARCHITECTURE.md


### 3.1 `data/raw/`
- Contains raw input data received from upstream systems
- Files in this folder are **never modified**
- Acts as the source layer of the pipeline

### 3.2 `data/processed/`
- Stores cleaned and transformed output data
- Output files are safe for analytics and reporting
- Acts as the curated layer

---

## 4. File-Level Responsibilities

### `config.json`
- Stores environment-independent configuration
- Avoids hardcoding file paths and parameters
- Makes pipeline reusable across environments

**Responsibilities:**
- Input file location
- Output file location
- Business rules (minimum valid amount)

---

### `etl_pipeline.py` (Main Orchestrator)
This is the **entry point** of the pipeline.

**Responsibilities:**
- Load configuration
- Orchestrate Extract → Transform → Load
- Handle errors gracefully
- Trigger logging

This file does **not** contain business logic directly.
Instead, it coordinates multiple components.

---

### `validation.py`
Contains **data quality checks**.

**Responsibilities:**
- Validate schema
- Ensure required columns exist
- Prevent pipeline from running on bad data

Separating validation logic improves:
- Readability
- Testability
- Reusability

---

### `logger.py`
Centralized logging configuration.

**Responsibilities:**
- Standardize log format
- Ensure consistent logging across pipeline
- Enable observability for production runs

This approach avoids duplicate logging setup in multiple files.

---

## 5. ETL Pipeline Flow (Step-by-Step)

### Step 1: Configuration Load
- Reads `config.json`
- Extracts runtime parameters

### Step 2: Extract
- Reads raw sales data from CSV
- Performs initial file-level checks

### Step 3: Validate
- Ensures required columns exist
- Ensures data is not empty
- Stops pipeline if validation fails

### Step 4: Transform
- Removes records with null values
- Filters invalid sales amounts
- Aggregates total sales per category

### Step 5: Load
- Writes aggregated data to processed folder
- Output is analytics-ready

---

## 6. Error Handling Strategy

- All pipeline execution is wrapped in `try-except`
- Validation errors stop execution early
- Errors are logged with meaningful messages
- Pipeline fails safely instead of producing incorrect data

---

## 7. Logging Strategy

The pipeline logs:
- Start and end of execution
- Major pipeline steps
- Errors and failures

This ensures:
- Easy debugging
- Operational transparency
- Production readiness

---

## 8. Design Decisions & Justification

### Why Config-Driven?
- Enables environment flexibility
- Avoids hardcoded values
- Industry standard in DE pipelines

### Why Modular Files?
- Easier maintenance
- Cleaner codebase
- Individual components can be tested independently

### Why Pandas?
- Suitable for small to medium datasets
- Simple and expressive API
- Acts as a preprocessing layer before Spark

---

## 9. How to Explain This Project in Interviews

**One-liner explanation:**
> “I built a config-driven retail sales ETL pipeline in Python that validates,
cleans, and aggregates sales data with proper logging and error handling.”

**If asked about design:**
- Explain modular structure
- Explain why validation and logging are separate
- Explain config-driven approach

---

## 10. Possible Enhancements (Future Scope)

- Move transformation logic to PySpark for large data
- Store output in a data warehouse
- Add orchestration via Airflow or ADF
- Add automated testing

---

## Final Note

This project is intentionally designed to reflect
**real-world Data Engineering best practices** rather than toy examples.
