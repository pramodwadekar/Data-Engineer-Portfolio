# 🌐 NoSQL DATABASES

📖 **Introduction**  
**NoSQL** stands for **Not Only SQL**.  
NoSQL databases are designed to handle **large volumes of data**, **high traffic**, and **unstructured or semi-structured data** with high performance and scalability.

Unlike traditional SQL databases, NoSQL databases are **schema-flexible**, **horizontally scalable**, and optimized for **big data and real-time applications**.

---

## 🔹 Why NoSQL?

- To handle huge amounts of data (Big Data)  
- To support high-speed read/write operations  
- To scale easily across multiple servers (horizontal scaling)  
- To work with unstructured or semi-structured data  
- To build high-performance web and mobile applications  
- To handle real-time analytics and streaming data  

---

## 🔹 SQL vs NoSQL (Quick Comparison)

| Feature | SQL | NoSQL |
|--------|-----|--------|
| Data Model | Tables (Rows & Columns) | Document, Key-Value, Column, Graph |
| Schema | Fixed Schema | Flexible / Schema-less |
| Scalability | Vertical (scale up) | Horizontal (scale out) |
| Transactions | Strong ACID support | Often BASE / eventual consistency |
| Use Case | Structured data, complex queries | Big data, high traffic, flexible data |

---

## 🔹 Types of NoSQL Databases

| Type | Description | Examples | Use Case |
|------|-------------|----------|----------|
| Key-Value Store | Stores data as key-value pairs | Redis, DynamoDB | Caching, sessions |
| Document Store | Stores data as JSON/XML documents | MongoDB, CouchDB | Web apps, APIs |
| Column-Family Store | Stores data in columns instead of rows | Cassandra, HBase | Big data, analytics |
| Graph Database | Stores data as nodes and relationships | Neo4j, ArangoDB | Social networks, recommendations |

---

## 🔹 What is a Document Database? (Example: MongoDB)

- Data is stored in **JSON-like documents**  
- Each document can have a **different structure**  
- Collections are like tables, documents are like rows  
- Very flexible and easy to scale  

**Example document:**
json
{
  "EmpID": 101,
  "EmpName": "Rahul",
  "Salary": 50000,
  "Skills": ["Python", "SQL", "Spark"]
}



**🔹 Basic NoSQL (MongoDB) Commands**

// Show databases
show dbs

// Use database
use companyDB

// Insert document
db.Employee.insertOne({ EmpID: 101, EmpName: "Rahul", Salary: 50000 })

// Find documents
db.Employee.find({ Salary: { $gt: 40000 } })

// Update document
db.Employee.updateOne({ EmpID: 101 }, { $set: { Salary: 55000 } })

// Delete document
db.Employee.deleteOne({ EmpID: 101 })
  


**🔹 Advantages of NoSQL**

✅ High performance and speed

✅ Easy horizontal scaling

✅ Flexible schema

✅ Handles big data efficiently

✅ Good for distributed systems and cloud apps

  
**🔹 Limitations of NoSQL**

❌ Not ideal for complex joins

❌ Weaker support for complex transactions (in some DBs)

❌ Data consistency may be eventual (DB dependent)

❌ Less standardization compared to SQL
  

**🔹 When to Use NoSQL?**

When data structure changes frequently

When you need to handle huge traffic and big data

When you need high availability and scalability

For real-time apps, analytics, IoT, social media, logging systems

For microservices and distributed systems
  

**🔹 When to Use SQL Instead?**

When data is highly structured

When you need complex joins and queries

When strong ACID transactions are critical

For financial, banking, and enterprise systems
  

**🔹 Summary**

NoSQL = Not Only SQL 🌐

Designed for big data, scalability, and high performance

Types: Key-Value, Document, Column, Graph

Best for modern, distributed, high-traffic applications

SQL and NoSQL are complementary, not enemies 😉
