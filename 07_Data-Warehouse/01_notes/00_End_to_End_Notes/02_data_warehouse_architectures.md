# 02 — Data Warehouse Architectures (Kimball, Inmon, Data Vault, Lakehouse)

## 1) Why architecture matters
Architecture defines:
- How data flows
- Where transformations happen
- How scalable and maintainable your DWH becomes

---

## 2) Kimball Architecture (Bottom-Up)
### Concept
- Build **Data Marts first**
- Use **Dimensional modeling**
- Later combine marts into enterprise warehouse

### Key points
- Best for BI & reporting
- Faster delivery
- Highly business-friendly

### Strengths
✅ Quick to implement  
✅ Excellent query performance  
✅ Easy for analysts  

### Weaknesses
❌ Harder to change enterprise-wide logic later  
❌ Integration complexity grows with many marts  

---

## 3) Inmon Architecture (Top-Down)
### Concept
- Build an **Enterprise Data Warehouse (EDW)** first
- EDW uses normalized model (3NF)
- Data marts created later

### Strengths
✅ Strong enterprise consistency  
✅ Good governance  
✅ Works well for large organizations  

### Weaknesses
❌ Slower to deliver  
❌ More complex  
❌ Less BI-friendly initially  

---

## 4) Data Vault Architecture (Advanced)
### Concept
Data Vault separates into:
- **Hubs** → business keys
- **Links** → relationships
- **Satellites** → descriptive attributes + history

### When used
- Highly regulated industries
- Very large enterprise warehouses
- Need auditability and full history

### Strengths
✅ Highly scalable  
✅ Easy to add new sources  
✅ Full audit trail  

### Weaknesses
❌ Not BI-friendly directly  
❌ Requires marts on top (Star schema)  
❌ More tables = more complexity  

---

## 5) Lakehouse Architecture (Modern)
### Concept
Use:
- Data Lake storage (ADLS/S3)
- Open formats (Delta/Iceberg/Hudi)
- Warehouse-style SQL engines

### Typical layering
- Bronze (raw)
- Silver (cleaned)
- Gold (business)

### Strengths
✅ One storage for BI + ML  
✅ Cheap + scalable  
✅ Great for streaming + batch  

### Weaknesses
❌ Governance needed  
❌ Without discipline becomes “data swamp”  

---

## 6) Common DWH patterns in Azure
- ADLS Gen2 (Raw + Curated)
- ADF (Orchestration)
- Databricks (Transformations)
- Synapse Dedicated SQL Pool or Serverless SQL
- Power BI (Reporting)

---

## 7) Interview-ready comparisons
### Kimball vs Inmon
- Kimball = marts first, dimensional
- Inmon = EDW first, normalized

### Data Vault vs Kimball
- Data Vault = enterprise ingestion + audit + flexibility
- Kimball = best for BI consumption

---

## 8) Real-world advice
Most companies use hybrid:
- Raw in lake
- Transform in Spark
- Serve in star schema
