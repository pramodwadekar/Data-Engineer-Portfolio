# Exception Handling for Data Engineering

## 1. What is Exception Handling?
Exception handling is the process of identifying, catching, and managing
runtime errors that occur during program execution, so that data pipelines
do not fail unexpectedly.

---

## 2. Why Exception Handling is Important in Data Engineering
In real Data Engineering pipelines:

- Source files may be missing
- Data may be corrupt or incomplete
- Schema may change unexpectedly
- Network or system issues may occur

Without proper exception handling, pipelines can crash silently or
produce incorrect data.

---

## 3. Where Exception Handling is Used in DE Projects
Exception handling is used when:

- Reading input files
- Validating schemas
- Writing output data
- Connecting to external systems
- Running scheduled pipelines

**Example:**

try:
    df = pd.read_csv("input.csv")
except FileNotFoundError:
    print("Input file not found")

## 4. try–except–else–finally Structure

Python exception handling supports four blocks:

- try → code that may fail

- except → handles the exception

- else → executes if no exception occurs

- finally → always executes (cleanup)

## 5. Example with else and finally (DE Context)
try:
    df = pd.read_csv("input.csv")
except FileNotFoundError:
    print("Input file not found")
else:
    print("File read successfully")
finally:
    print("Pipeline step completed")

**Explanation:**

- **try:** attempts to read input file

- **except:** handles missing file

- **else:** runs only if file read is successful

- **finally:** runs regardless (logging, cleanup, closing resources)



## 6. Common Exceptions in Data Engineering
**a) FileNotFoundError**

Occurs when input files are missing.

try:
    pd.read_csv("missing.csv")
except FileNotFoundError:
    print("File does not exist")

**b) ValueError**

Occurs when data values are invalid.

try:
    int("abc")
except ValueError:
    print("Invalid value")

**c) KeyError**

Occurs when accessing missing dictionary keys or DataFrame columns.

try:
    df["non_existing_column"]
except KeyError:
    print("Column not found")

## 7. Using try-except Blocks Effectively

**Basic structure:**

try:
    # risky operation
except Exception as e:
    print(e)


**Better practice:**

try:
    process_data()
except Exception as e:
    log_error(e)
    raise

## 8. Best Practices for Exception Handling in DE

- Catch specific exceptions instead of generic ones

- Log errors instead of printing them

- Fail pipelines gracefully

- Do not ignore exceptions silently

- Add retries only where safe

- Use else for success logic

- Use finally for cleanup or logging

- Stop pipeline on critical failures

## 9. Common Mistakes

- Using bare except: blocks

- Suppressing exceptions without logging

- Not using finally for cleanup

- Continuing pipeline execution after critical failure

- Handling exceptions too late

**Example of bad practice:**

try:
    process_data()
except:
    pass  # dangerous

## 10. How Exception Handling Fits into a DE Pipeline
Read Input
   ↓
try / except / else / finally
   ↓
Stop / Retry / Alert


Exception handling ensures pipeline reliability.

## 11. Interview Perspective

Interviewers expect Data Engineers to:

- Explain all four blocks clearly

- Use else for success paths

- Use finally for cleanup/logging

- Handle missing files gracefully

- Explain different exception types

- Show how pipelines fail safely

- Avoid silent data corruption

**Typical interview question:**

❓ What happens if a source file is missing?
✅ The pipeline should log the error and stop or retry gracefully.

**Key Takeaway**

Exception handling is critical for building reliable and production-ready
data pipelines. A Data Engineer must anticipate failures and design
pipelines that fail safely and transparently.

