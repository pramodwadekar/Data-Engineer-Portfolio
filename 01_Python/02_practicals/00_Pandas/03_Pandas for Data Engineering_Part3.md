# Pandas for Data Engineering (Part 3)

## Advanced Topics

### Pivot Table
```python
pd.pivot_table(df, values='salary', index='dept', aggfunc='mean')
```

### Window Functions
```python
df['rank'] = df['salary'].rank()
```

### Working with Dates
```python
df['date'] = pd.to_datetime(df['date'])
```

### Performance Tips
- Use vectorized operations
- Avoid loops

### Pandas with SQL
```python
import sqlite3
conn = sqlite3.connect('db.sqlite')
df = pd.read_sql("SELECT * FROM table", conn)
```

## Use Cases in Data Engineering
- ETL pipelines
- Data cleaning
- Feature engineering
