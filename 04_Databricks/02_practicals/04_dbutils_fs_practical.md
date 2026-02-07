# 04 - dbutils.fs Practical (Databricks File Operations)

🎯 Goal: Learn file operations in Databricks using `dbutils.fs`.

---

## ✅ What you will learn
- list files
- create folders
- copy files
- remove files
- understand dbfs:/ paths

---

## 1) Create Notebook
Name:
`04_dbutils_fs`

---

## 2) List Root DBFS

```python
dbutils.fs.ls("dbfs:/")
```

---

## 3) Create a Folder

```python
dbutils.fs.mkdirs("dbfs:/tmp/pramod_databricks/")
```

---

## 4) Create a Small Text File (Notebook Method)

```python
sample_text = "hello databricks"
dbutils.fs.put("dbfs:/tmp/pramod_databricks/hello.txt", sample_text, True)
```

---

## 5) List Folder

```python
dbutils.fs.ls("dbfs:/tmp/pramod_databricks/")
```

---

## 6) Read File Back

```python
print(dbutils.fs.head("dbfs:/tmp/pramod_databricks/hello.txt"))
```

---

## 7) Copy File

```python
dbutils.fs.cp(
    "dbfs:/tmp/pramod_databricks/hello.txt",
    "dbfs:/tmp/pramod_databricks/hello_copy.txt"
)
```

---

## 8) Remove File

```python
dbutils.fs.rm("dbfs:/tmp/pramod_databricks/hello_copy.txt")
```

---

## 9) Remove Folder (Recursive)

```python
dbutils.fs.rm("dbfs:/tmp/pramod_databricks/", True)
```

---

## 10) Interview Talking Points
- dbutils.fs works with DBFS
- DBFS is abstraction layer over cloud storage
- For production: store data in ADLS/S3, not FileStore

---

## 11) Output
After this practical, you can:
✅ manage DBFS paths  
✅ perform file operations inside Databricks  

---

✅ Next: `05_dbfs_filestore_upload_practical.md`
