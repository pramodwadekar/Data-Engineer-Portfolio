# Pandas for Data Engineering (Part 2)

## Data Cleaning
Data cleaning means fixing bad data in your data set.

Bad data could be:

Empty cells
Data in wrong format
Wrong data
Duplicates

### Handle Missing Values
```python
df.isnull()

df.dropna()

Remove rows with a NULL value in the "Date" column:
df.dropna(subset=['Date'], inplace = True)

df.fillna(0)
```

### Remove Duplicates
```python
Returns True for every row that is a duplicate, otherwise False:
print(df.duplicated())

df.drop_duplicates()
```

## Filtering
```python
df[df['age'] > 20]
```

## Sorting
```python
df.sort_values(by='age')
```

## GroupBy
```python
df.groupby('dept')['salary'].sum()
```

## Merge & Join
```python
pd.merge(df1, df2, on='id')
```

## Apply Functions
```python
df['new'] = df['age'].apply(lambda x: x*2)
```
