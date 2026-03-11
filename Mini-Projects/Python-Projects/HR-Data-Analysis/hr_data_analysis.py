import numpy as np 
import pandas as pd 
import matplotlib.pyplot as plt
import seaborn as sns 
from datetime import datetime

df = pd.read_csv("Sample_HR.csv")
# print(df.shape)
# print(df.head())

# duplicate rows count 
# df = df[df.duplicated()].shape[0]
# print(df)

# deleting duplicates rows in the dataset 

df =df.drop_duplicates()
df.shape[0]
# print(df)


# checking the null values in the dataset 
# print(df.info())

# replacing the null values with the mean values in the columns (Age & Department)

average_age = df["Age"].mean()
average_age = int(average_age)
# print(average_age)

df["Age"] = df["Age"].fillna(average_age)
df["Department"] = df["Department"].fillna("Data Engineering")
# print(df.head())
# print(df.info())


# standardization the Gender column

df["Gender"] = df["Gender"].replace({"M":"Male" , "F" : "Female"})

# print(df.head())

# combining first name and last name 

df["Full Name"] = df["First Name"] + " " + df["Last Name"]

# placing the full name column in index 3 

columns = df.columns.tolist()
last_name_index  = columns.index("Last Name")
columns.insert(last_name_index + 1 , columns.pop(columns.index("Full Name")))
df = df[columns]


# get the no. of experience ( Years )

hire_date = pd.to_datetime(df["Hire_Date"]).dt.year
current_year = datetime.now().year

df["YearAtCompany"] = current_year - hire_date
# print(df.head())

# creating the bar chart 
# department_count = df["Department"].value_counts()
# plt.figure(figsize=(10,6))
# color = ["darkblue" , "darkgreen" , "yellow" , "purple"]
# department_count.plot(kind="bar" , color = color)
# plt.title("Employee count by Department" , fontweight = "bold")
# plt.xlabel("Dapertment" ,  fontweight = "bold" )
# plt.ylabel("Employee count " ,  fontweight = "bold")
# plt.xticks(rotation = 0)
# plt.show()

# creating the line chart
# age_gender = df.groupby(["Age" , "Gender"]).size().reset_index(name="Count")
# print(age_gender) 
# plt.figure(figsize=(10,6))
# sns.lineplot(data=age_gender , x="Age" , y= "Count", hue="Gender" , markers="o")
# plt.title("Employee count by Age & Gender" , fontweight = "bold")
# plt.xlabel("Age" ,  fontweight = "bold" )
# plt.ylabel("Employee count " ,  fontweight = "bold")
# plt.xticks(rotation = 0)
# plt.show()

# creating the pie chart
# marital_status_count = df.groupby(["MaritalStatus"]).size().reset_index(name="Count")
# marital_status  = marital_status_count["MaritalStatus"]
# count = marital_status_count["Count"]

# sns.set(style="whitegrid")
# colors  =sns.color_palette("colorblind")[0:len(marital_status)]
# colors = ["darkblue" , "darkgreen" , "purple"]
# plt.figure(figsize=(8,8))
# plt.pie(count , labels=marital_status , colors=colors , autopct="%1.1f%%" , startangle=140)
# plt.axis("equal")

# plt.xlabel("Strength by Marital Status" , fontweight = "bold")
# plt.show()


# creating the bar plot 

# df = df.rename(columns={"MonthlyRate" : "Salary"})
# average_salary = df.groupby(["Department" ,"Gender"])["Salary"].mean().reset_index()
# plt.figure(figsize=(16,8))
# sns.barplot(data=average_salary , x= "Department" , y = "Salary" , hue="Gender")
# plt.title("Average Salary By Department And Gender" , fontweight = "bold")
# plt.show()

# creating the histogram 
# age = df["Age"]
# plt.hist(age, bins=10 , edgecolor = "black" , color = "skyblue")
# plt.title("Empployee Count  by Age" , fontweight = "bold")
# plt.xlabel("Age" , fontweight = "bold")
# plt.ylabel("Employee Count" , fontweight = "bold")
# plt.show()

# creating the boxplot 

plt.figure(figsize=(10,6))
sns.boxplot(x = "Department" , y = "MonthlyRate" , data=df , hue="Gender")
plt.title("Salary By Department" , fontweight = 'bold')
plt.xlabel("Department" ,  fontweight = 'bold')
plt.ylabel("Salary" ,  fontweight = 'bold')
plt.show()