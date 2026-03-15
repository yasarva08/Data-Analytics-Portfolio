import numpy as np
import pandas as pd 
#-------------------------------Dataset Load -----------------------------------------------------
df = pd.read_csv("Superstore.csv")

#-------------------------------Dataset Structure------------------------------------------------
print(df.head())
print(df.shape)
print(df.columns)
print(df.info())


#-----------------------------Basic Summary Check-------------------------------------------------

print(df.describe())

#----------------------------Missing Values Check-------------------------------------------------

print(df.isnull().sum())

# there is no null values in the dataset 

#-----------------------------Duplicate Rows Check------------------------------------------------

print(df.duplicated().sum())
# there is no dublicate rows in the dataset 

#-----------------------------Date Column Convert-------------------------------------------------

df["Order Date"] = pd.to_datetime(df["Order Date"] ,errors="coerce")
df["Ship Date"] = pd.to_datetime(df["Ship Date"], errors="coerce")
print(df[["Order Date", "Ship Date"]])

#----------------------------Creating New Columns---------------------------------------------------

# Profit Margin 

df["Profit Margin"] = df["Profit"] / df["Sales"]


#Loss Flag 
df["Loss Flag"] = df["Profit"]<0

#Year Column
df["Year"] = df["Order Date"].dt.year
print(df[["Order Date","Year"]].head())

#Month Column
df["Month"] = df["Order Date"].dt.month
print(df[["Order Date","Month"]].head())

#--------------------------------------Basic Analysis----------------------------------------------
# Total Sales 
print(df["Sales"].sum())
# Total Profit 
print(df["Profit"].sum())
# Sales By Category 
print(df.groupby("Category")["Sales"].sum())
# Profit By Region 
print(df.groupby("Region")["Profit"].sum())

df.to_csv("Clean_superstore.csv" , index=False)