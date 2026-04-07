# Pandas for Data Engineering (Part 1)

## What is Pandas?
Pandas is an open-source Python library used for data manipulation and analysis.

## Why Pandas?
- Handles structured data efficiently
- Easy data cleaning and transformation
- Works well with CSV, Excel, SQL

## Installation
```bash
pip install pandas
```

## Import
```python
import pandas as pd
```

## Core Data Structures

### Series
## What is a Series?
A Pandas Series is like a column in a table.

It is a one-dimensional array holding data of any type.


```python
s = pd.Series([1,2,3])
```

### DataFrame
What is a DataFrame?
A Pandas DataFrame is a 2 dimensional data structure, like a 2 dimensional array, or a table with rows and columns.

```python
df = pd.DataFrame({
    "name": ["A","B"],
    "age": [20,25]
})
```

## Reading Data
```python
df = pd.read_csv("file.csv")
df = pd.read_excel("file.xlsx")

df = pd.read_json('data.json')
print(df.to_string()) 


import pandas as pd

data = {
  "Duration":{
    "0":60,
    "1":60,
    "2":60,
    "3":45,
    "4":45,
    "5":60
  },
  "Pulse":{
    "0":110,
    "1":117,
    "2":103,
    "3":109,
    "4":117,
    "5":102
  },
  "Maxpulse":{
    "0":130,
    "1":145,
    "2":135,
    "3":175,
    "4":148,
    "5":127
  },
  "Calories":{
    "0":409,
    "1":479,
    "2":340,
    "3":282,
    "4":406,
    "5":300
  }
}

df = pd.DataFrame(data)

print(df) 

```

## Writing Data
```python
df.to_csv("out.csv")
```

## Basic Operations
```python
Get a quick overview by printing the first 10 rows of the DataFrame:
df.head()   '''first 5'''
print(df.head(10))  '''first 10'''


There is also a tail() method for viewing the last rows of the DataFrame.
Print the last 5 rows of the DataFrame:
df.tail()  '''last 5'''

Print information about the data:
df.info()


df.describe()
```
