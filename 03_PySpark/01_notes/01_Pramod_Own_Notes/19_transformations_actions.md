# 19 - Transformations vs Actions (PySpark) (Core)

This note covers:
- Lazy evaluation
- Transformations list
- Actions list
- DAG explanation

This is one of the most important Spark fundamentals for:
✅ interviews  
✅ debugging  
✅ performance tuning  

---

## 1) Lazy Evaluation (Most Important)

Spark uses **lazy evaluation**.

Meaning:
- Spark does not execute transformations immediately.
- It only builds a logical plan (DAG).
- Execution starts only when an **action** is called.

Example:

```python
df2 = df.filter("salary > 50000")         .select("name", "dept", "salary")
```

Nothing runs yet.

Execution happens only when:

```python
df2.show()
```

---

## 2) What is a Transformation?
A transformation is an operation that:
- creates a new DataFrame/RDD
- does not trigger execution immediately
- is lazy

Transformations return a new DataFrame.

---

## 3) Common Transformations List (DataFrame)

### 3.1 Column / Row Transformations
- select()
- withColumn()
- drop()
- filter()
- where()
- distinct()
- dropDuplicates()

---

### 3.2 Aggregation Transformations
- groupBy()
- agg()

---

### 3.3 Join Transformations
- join()

---

### 3.4 Partition Transformations
- repartition()
- coalesce()

---

### 3.5 Sorting Transformations
- orderBy()
- sort()

---

## 4) What is an Action?
An action is an operation that:
- triggers Spark execution
- returns result to driver OR writes output

Actions are NOT lazy.

---

## 5) Common Actions List (DataFrame)

- show()
- count()
- collect()
- take(n)
- first()
- head()
- foreach()
- write (df.write...)

Example:

```python
df.count()
```

This triggers execution.

---

## 6) DAG Explanation (Directed Acyclic Graph)

### 6.1 What is DAG?
DAG = **Directed Acyclic Graph**

Spark builds a DAG of transformations to understand:
- what operations are needed
- how data flows
- where shuffle boundaries exist

---

### 6.2 DAG is built before execution
When you run transformations, Spark creates a plan.

Only when you call action:
- Spark converts DAG into execution plan
- breaks into stages
- runs tasks on executors

---

## 7) Example of Lazy Evaluation + DAG

```python
df2 = df.filter("dept = 'IT'")         .groupBy("dept")         .count()
```

No execution happens.

Execution happens here:

```python
df2.show()
```

Spark will:
- build DAG
- create stages
- run tasks

---

## 8) Why This Concept is Important?

### 8.1 Performance
Because Spark can optimize transformations before executing.

### 8.2 Debugging
You understand why Spark runs only at actions.

### 8.3 Caching
Cache works only when action triggers.

Example:

```python
df2.cache()
df2.count()   # caching happens here
```

---

## 9) Summary (Quick Notes)

- Spark uses lazy evaluation.
- Transformations are lazy and build DAG.
- Actions trigger execution.
- DAG is the execution plan of transformations.

---

✅ Next File: `20_spark_execution_model.md`
