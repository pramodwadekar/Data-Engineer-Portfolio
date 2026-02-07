# 06 - Get Metadata: Check File Exists (Practical)

## Goal
Use Get Metadata to check if file exists before processing.

---

## Steps
1. Add Get Metadata activity
2. Dataset: landing dataset
3. Field list: `exists`

---

## Add If Condition
Condition:
```text
@activity('Get Metadata1').output.exists
```

True → process  
False → skip / alert

---

## Interview Points
- avoids pipeline failure when file missing
- improves reliability
