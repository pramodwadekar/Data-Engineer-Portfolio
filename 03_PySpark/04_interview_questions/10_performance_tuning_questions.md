# 10 - Performance Tuning Interview Questions (PySpark)

This file covers performance tuning from interview perspective.

---

## 1) Why Spark jobs become slow?
**Answer:**
Common reasons:
- shuffle heavy operations
- data skew
- wrong partitioning
- too many small files
- wide transformations
- wrong join strategy
- excessive caching
- driver OOM

---

## 2) What is shuffle and why it is expensive?
**Answer:**
Shuffle moves data across executors.
It is expensive due to:
- network IO
- disk spill
- sorting

---

## 3) How to reduce shuffle?
**Answer:**
- broadcast join for small table
- filter before join/groupBy
- avoid unnecessary distinct/orderBy
- reduce shuffle partitions
- use AQE

---

## 4) What is broadcast join?
**Answer:**
Broadcast join sends small table to all executors, avoiding shuffle.

---

## 5) What is caching?
**Answer:**
Storing DataFrame in memory for reuse.

Use when:
- same DF used multiple times

Avoid when:
- used only once
- DF is huge

---

## 6) cache() vs persist()
**Answer:**
- cache() = MEMORY_ONLY
- persist() = configurable (memory/disk)

---

## 7) What is spill?
**Answer:**
When Spark runs out of memory and writes intermediate data to disk.

Spill makes jobs slow.

---

## 8) What is data skew?
**Answer:**
When few keys have huge amount of data.
It causes:
- one stage takes very long
- executor imbalance

---

## 9) How to handle skew?
**Answer:**
- salting technique
- AQE skew join
- broadcast join
- repartition by key

---

## 10) What is AQE and how it helps performance?
**Answer:**
AQE optimizes query at runtime:
- changes join strategy
- reduces shuffle partitions
- handles skew

---

## 11) What is explain() used for?
**Answer:**
To check:
- join type (broadcast vs sort merge)
- shuffle operations
- stage boundaries

---

## 12) What is Tungsten and Catalyst?
**Answer:**
- Catalyst optimizes query plan
- Tungsten optimizes execution (memory, codegen)

---

## 13) What is ZORDER?
**Answer:**
Delta Lake optimization technique to cluster data for faster reads.

---

## 14) What is OPTIMIZE in Delta?
**Answer:**
Compacts small files into bigger files.

---

## 15) What is VACUUM?
**Answer:**
Deletes old Delta files (cleanup).

---

## 16) Best practices for performance
**Answer:**
- always select only needed columns
- filter early
- avoid collect()
- use broadcast join when possible
- partition properly
- handle skew
- avoid too many small files
- use AQE

---

## 17) Interview Scenario
**Question:**
Your join is slow. What steps will you take?

**Answer:**
1) Check explain plan  
2) Check table sizes  
3) Broadcast small table  
4) Filter early  
5) Check skew keys  
6) Tune shuffle partitions  
7) Enable AQE  

---

## ⭐ Quick Revision
- shuffle is main enemy
- broadcast join is best trick
- caching is useful but not always
- AQE is must in Databricks

---

✅ Next: `11_execution_plan_dag_questions.md`
