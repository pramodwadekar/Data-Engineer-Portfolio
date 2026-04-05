# Databricks notebook source
# MAGIC %md
# MAGIC ### Data Reading using Pyspark
# MAGIC

# COMMAND ----------

### Csv File
df = spark.read.format('csv').option("header",True).option("inferSchema",True).load("/Volumes/workspace/csv_data/pyspark_dataset/BigMart Sales.csv")

# Another optioon is:
# df = spark.read.csv("/Volumes/workspace/csv_data/pyspark_dataset/BigMart Sales.csv", header=True, inferSchema=True)

display(df)

# COMMAND ----------

## read json file
df_json = spark.read.format('json').option("header",True).option("inferSchema",True).load("/Volumes/workspace/csv_data/pyspark_dataset/drivers.json")
display(df_json)


# COMMAND ----------

## reading parquet file
# df_parquet = spark.read.parquet("/Volumes/workspace/csv_data/pyspark_dataset/parquet_data")
# display(df_parquet)

# COMMAND ----------

# MAGIC %md
# MAGIC ### print schema showing the data type of each column

# COMMAND ----------

# print schema showing the data type of each column 
df.printSchema()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Tranformation For Beginners

# COMMAND ----------

# MAGIC %md
# MAGIC ### Select

# COMMAND ----------

# Select Transformation:
# df_set = df.select("Item_Identifier", "Item_Weight", "Item_Fat_Content").display()

# using col
from pyspark.sql.functions import col
df_set = df.select(col("Item_Identifier"),col("Item_Weight"), col("Item_Fat_Content")).display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Alias

# COMMAND ----------

# alias
df_alias = df.select(col("Item_Identifier").alias("Item"), col("Item_Weight").alias("Weight"), col("Item_Fat_Content").alias("Fat")).display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Filter

# COMMAND ----------

# filter tranformation
# schenario 1 is show only regular intem fat content
df_filter = df.filter(col("Item_fat_content") == "Regular").display()

# COMMAND ----------

# filter schenario 2 is: filter the data with item type = Soft drink and weight < 10
df_filter2 = df.filter((col("Item_Type") == "Soft Drinks") & (col("Item_Weight")<10)).display()

# COMMAND ----------

# DBTITLE 1,Cell 12
# fetch tha data with outlet location type in (Tier1 or Tier2) and outlet size is null

df_filter3 = df.filter((col("Outlet_Location_Type").isin("Tire 1", "Tier 2")) & (col("Outlet_Size").isNull())).display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### WithColumn

# COMMAND ----------

# withcolumn and add new value in new column 
# lit is used for adding constant velue for entire rows and single column 
from pyspark.sql.functions import *
df_withColumn = df.withColumn("Flag", lit("New Value")).display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Reg_Replace (chnage row value)

# COMMAND ----------

# DBTITLE 1,Cell 15
#regexp_replace is used for replacing the value in column with new value
df_replace = df.withColumn("Item_Fat_Content",regexp_replace(col("Item_Fat_Content"),"Regular","reg")).withColumn("Item_Fat_Content",regexp_replace(col("Item_Fat_Content"),"Low Fat","LF")).display()


# COMMAND ----------

# MAGIC %md
# MAGIC ### Type Casting

# COMMAND ----------

#Type Casting 
df.printSchema()
df_cast = df.withColumn("Item_Weight",col("Item_Weight").cast(StringType()))
df_cast.display()
df_cast.printSchema()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Sort Or OrderBY
# MAGIC

# COMMAND ----------

sorting = df.sort(col("Item_Weight").desc())
sorting.display()

# COMMAND ----------

# sorting based on multicolumn
# df.sort(col("Item_Weight").desc(), col("Outlet_Establishment_Year").asc()).display()
multi_sort = df.sort(["Item_Weight","Outlet_Establishment_Year"], ascending=[False,True])
# multi_sort = df.sort(["Item_Weight","Outlet_Establishment_Year"], ascending=[0,1])
multi_sort.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### limit

# COMMAND ----------

df.limit(5).display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Drop column

# COMMAND ----------

# drop single col
# drop_col = df.drop("Item_Visibility")
# drop_col.display()

# drop multi col
multi_drop = df.drop("Item_Visibility","Item_Weight")
multi_drop.display()


# COMMAND ----------

# MAGIC %md
# MAGIC ### Pyspark Intermediate Transformation (IMP)

# COMMAND ----------

# MAGIC %md
# MAGIC ### Drop Dublicates

# COMMAND ----------

# dropduplicates = df.dropDuplicates()
dropduplicates = df.drop_duplicates()
dropduplicates.display()

# COMMAND ----------

# Drop duplicate in multi columns
# dropduplicates = df.drop_duplicates(["Item_Identifier","Outlet_Identifier"])
dropduplicates = df.dropDuplicates(subset=["Item_Identifier","Outlet_Identifier"])
dropduplicates.display()

# COMMAND ----------

# using distinct
df.distinct().display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Union and UnionByName

# COMMAND ----------

## Union

data1=(["1","kad"],["2","sid"])
schemadata1 ="id string,name string" 
df_data1 = spark.createDataFrame(data1,schemadata1)

data2=(["rahul","3"],["yash", "4"])
schemadata2 ="name string,id string" 
df_data2 = spark.createDataFrame(data2,schemadata2)

df_data1.union(df_data2).display()



# COMMAND ----------

## Union All
df_data1.unionAll(df_data2).display()

# COMMAND ----------

#Union By Name
df_data1.unionByName(df_data2).display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### String Function
# MAGIC

# COMMAND ----------

# MAGIC %md
# MAGIC ## InitCap(convert data in proper format like capitalize)

# COMMAND ----------

df.select(initcap(col("Item_Type"))).display()

# COMMAND ----------

# UpperCase
df.select(upper(col("Item_Type"))).display()
# LowerCase
df.select(lower(col("Item_Type"))).display()
# trim
df.select(trim(col("Item_Type"))).display()


# COMMAND ----------

# MAGIC %md
# MAGIC ### Date Function (IMP)

# COMMAND ----------

# current Date
curr_date = df.withColumn("Curr_Date", current_date()).display()

# COMMAND ----------

# Date Add
add_date =  df.withColumn("add_date",date_add(current_date(),5))
add_date.display()

# COMMAND ----------

# sub_date
sub_date = df.withColumn("Sub_date",date_sub(current_date(),5))
sub_date.display()

# COMMAND ----------

## Date Diff
date_diff = sub_date.withColumn("date_diff",datediff(current_date(),"sub_date"))
date_diff.display()

# COMMAND ----------

# Date Format dd-mm-yy
dmy = sub_date.withColumn("DMY",date_format("sub_date","dd-MM-yyyy"))
dmy.display()

# COMMAND ----------

date = sub_date.withColumn("Date",date_format("sub_date","dd"))
date.display()

month = sub_date.withColumn("Month",date_format("sub_date","MM"))
month.display()

year = sub_date.withColumn("Year",date_format("sub_date","yyyy"))
year.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Handling null values 

# COMMAND ----------

# MAGIC %md
# MAGIC ### Dropping Nulls

# COMMAND ----------

# DBTITLE 1,Cell 51
# df_drop = df.dropna()
# df_drop = df.dropna("all")
df_drop = df.dropna("any")
df_drop.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Fill Null values 

# COMMAND ----------

# df_fill = df.fillna(0) # fill the null values in only int columns
# df_fill = df.fillna("NA") # fill the null values in only string columns
# df_fill = df.fillna(0).fillna("NA")  # fill the null values at a time string with int columns
# df_fill = df.fillna(0, subset=["Item_Weight"])# fill the null values in perticular or multiple columns
df_fill = df.fillna({"Item_Weight":0,"Outlet_Size":"NA"}) # fill the null values in perticular or multiple columns
df_fill.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Split

# COMMAND ----------

df_split = df.withColumn("Split_outlet_type",split("Outlet_Type"," "))
df_split.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ###  Indexing
# MAGIC

# COMMAND ----------

df_index = df.withColumn("first_index_outlet_type",split("Outlet_Type"," ")[1])
df_index.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Explode

# COMMAND ----------

df_explode = df_split.withColumn("explode_outlet_type",explode("Split_outlet_type"))
df_explode.display() 
# Note: First we need to column is in array or splited values

# COMMAND ----------

# MAGIC %md
# MAGIC ### Array Contains

# COMMAND ----------

df_contains = df_split.withColumn("contains_outlet_type",array_contains("Split_outlet_type","Type1"))
df_contains.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Group by

# COMMAND ----------

df_groupb= df.groupBy("Item_Type").agg(sum("Item_MRP"))
df_groupb.display()

# COMMAND ----------

df_groupbavg = df.groupBy("Item_Type").agg(avg("Item_MRP"))
df_groupbavg.display()

# COMMAND ----------

# Group by multiple columns

df_groupbavg = df.groupBy("Item_Type","Outlet_Type").agg(avg("Item_MRP").alias("avg_Item_MRP"))
df_groupbavg.display()

# COMMAND ----------

df_groupbavg = df.groupBy("Item_Type","Outlet_Type").agg(avg("Item_MRP").alias("avg_Item_MRP"),sum("Item_Outlet_Sales").alias("sum_Item_Outlet_Sales"))
df_groupbavg.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### PySpark Advance Level Function (VIMP)

# COMMAND ----------

# MAGIC %md
# MAGIC ### Collect List

# COMMAND ----------

# this fuction is replce of group of concat
userdata1 = [("user1","book1"),("user2","book2"),("user2","book3"),("user2","book4"),("user3","book1")]
user_data_schema = ["user", "book"]
df_userdata = spark.createDataFrame(userdata1,user_data_schema)
df_userdata.display()
df_user_collect = df_userdata.groupBy("user").agg(collect_list("book").alias("books"))
df_user_collect.display()
# this fuction is replce of group of concat
df_user_concat = df_userdata.groupBy("user").agg(concat_ws(",",collect_list("book")).alias("books"))
df_user_concat.display()



# COMMAND ----------

# MAGIC %md
# MAGIC ### Pivot

# COMMAND ----------

df_pivot = df.groupBy("Item_Type").pivot("Outlet_Type").agg(avg("Item_MRP"))
df_pivot.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### When Otherwise
# MAGIC

# COMMAND ----------

df.display()
w_other = df.withColumn("Veg_Flag", when(col("Item_Type")=="Meat","Non Veg").otherwise("Veg"))
w_other.display()

# COMMAND ----------

## when otherwise
w_other_con = w_other.withColumn("Veg_Exp_flag", when((col("Veg_Flag")== "Veg") & (col("Item_MRP")<100),"InExpensve").when((col("Veg_Flag")== "Veg") & (col("Item_MRP")>100),"Expensive").otherwise("Non Veg"))
w_other_con.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Joins (VIMP Topics)

# COMMAND ----------



# COMMAND ----------

# MAGIC %md
# MAGIC ### Create DataFrame for Joins
# MAGIC

# COMMAND ----------

datafr1 = [("1","Gaur", 'D01'), ("2","Ravi", 'D02'), ("3","nishant", 'D03'), ("4","kunal", 'D04'), ("5","mahesh", 'D05'), ("6","sourav", 'D06'), ("7","pramod", 'D07')]
df_data1 = spark.createDataFrame(datafr1,['emp_id','emp_name','dept_id'])
df_data1.display()
datafr2 = [("D01","HR"),("D02","Marketing"),("D03","Accounts"),("D04","IT"),("D05","Finance"),("D06","Sales")]
df_data2 = spark.createDataFrame(datafr2,['dept_id','dept_name'])
df_data2.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Inner Join 
# MAGIC

# COMMAND ----------

df_inner = df_data1.join(df_data2,df_data1.dept_id==df_data2.dept_id,'inner')
df_inner.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Left Join 
# MAGIC

# COMMAND ----------

df_left = df_data1.join(df_data2,df_data1.dept_id==df_data2.dept_id,'left')
df_left.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Right join

# COMMAND ----------

df_right = df_data1.join(df_data2,df_data1.dept_id==df_data2.dept_id,'right')
df_right.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Full Join

# COMMAND ----------

df_full = df_data1.join(df_data2,df_data1.dept_id==df_data2.dept_id,"full")
df_full.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Anti Join

# COMMAND ----------

df_anti = df_data1.join(df_data2,df_data1.dept_id==df_data2.dept_id,'anti')
df_anti.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Windows Functions (VIMP)

# COMMAND ----------

# MAGIC %md
# MAGIC ### Row Number 

# COMMAND ----------

from pyspark.sql.functions import *
from pyspark.sql.window import Window
row_num = df.withColumn("Row Number",row_number().over(Window.orderBy("Item_Type")))
row_num.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Rank()

# COMMAND ----------

rank_num = df.withColumn("Rank", rank().over(Window.orderBy("Item_Identifier")))
rank_num.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Dense Rank()

# COMMAND ----------

dense_rank_num = df.withColumn("Dense Rank", dense_rank().over(Window.orderBy("Item_Identifier")))
dense_rank_num.display()


# COMMAND ----------

# MAGIC %md
# MAGIC ### lag()

# COMMAND ----------

lag_val = df.withColumn("next lag Value", lag("Item_Weight",1).over(Window.orderBy("Item_Identifier")))
lag_val.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Lead()

# COMMAND ----------

lead_value = df.withColumn("lead value", lead("Item_Weight",1).over(Window.orderBy("Item_Identifier")))
lead_value.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Data Writing 

# COMMAND ----------

dense_rank_num.write.format("csv").mode("overwrite").save("/Volumes/workspace/csv_data/pyspark_dataset/dense_rank.csv")
# spark.read.csv("/Volumes/workspace/csv_data/pyspark_dataset/dense_rank.csv", header=True, inferSchema=True).display()



# COMMAND ----------

# MAGIC %md
# MAGIC ### Modes of Writing file
# MAGIC Differents mode for file writings
# MAGIC - Append: add new data without deleting old data 
# MAGIC - Overwrite: add new data replacing the old data (delete existing data write a new data)
# MAGIC - Error: throw an error if data already exists (if path is exists then then showing error otherwise data added)
# MAGIC - Ignore: if data already added then do nothing(if path is already exists then skip to write)