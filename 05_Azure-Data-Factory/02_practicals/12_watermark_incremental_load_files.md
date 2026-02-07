# 12 - Watermark Incremental Load for Files (Practical)

## Goal
Process only new files in a folder.

---

## Pattern
- Get Metadata childItems
- Filter files by naming pattern
- ForEach copy each file
- Log processed file names

---

## Steps
1. Get Metadata on folder
Field list: childItems

2. ForEach items:
```text
@activity('GetMetadata').output.childItems
```

3. Copy each file to bronze

4. Log processed file in a SQL table

---

## Interview Points
- file-based incremental ingestion
- commonly used for SFTP/file drops
