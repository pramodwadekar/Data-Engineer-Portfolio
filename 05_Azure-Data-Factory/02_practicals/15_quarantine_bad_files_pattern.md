# 15 - Quarantine Bad Files Pattern (Practical)

## Goal
If a file is corrupt, move it to quarantine and continue pipeline.

---

## Pattern
1. Copy activity fails
2. On failure:
   - move file to quarantine folder
   - log error
3. Continue with next file

---

## Implementation
- Use ForEach
- Use dependency: Failed
- Use Copy/Move activity to quarantine folder

---

## Interview Points
- real enterprise pattern
- ensures pipeline doesn’t stop due to one bad file
