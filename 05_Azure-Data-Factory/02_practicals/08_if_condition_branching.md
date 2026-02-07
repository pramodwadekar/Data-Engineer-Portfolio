# 08 - If Condition Branching (Practical)

## Goal
Use If Condition to run different logic based on parameter.

---

## Scenario
If load_type = full → full copy  
Else → incremental

---

## Steps
Pipeline parameter:
- `load_type`

If condition:
```text
@equals(pipeline().parameters.load_type, 'full')
```

True → Full Copy  
False → Incremental Copy

---

## Interview Points
- useful for dev/testing
- supports reusable pipelines
