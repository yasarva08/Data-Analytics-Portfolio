#------------------------Python EDA (Retail Profit Leakage Analysis)-------------------------------
# Importing Libraries 
import numpy as np 
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns 

df = pd.read_csv("CleanDataset_superstore.csv")
# print(df.head())
#---------------------------Total Business Overview------------------------------------------------
# # total Sales 
# print(df["Sales"].sum())
 
# #Total Profit
# print(df["Profit"].sum())

# #Average Profit Margin 
# print(df["Profit Margin"].mean()) 

#------------------------------------Sales By Category----------------------------------------------

sales_category = df.groupby("Category")["Sales"].sum()
# print(sales_category)
#Chart 

# ax = sales_category.plot(kind="bar")
# for i, v in enumerate(sales_category):
#     plt.text(i, v, str(round(v,2)), ha="center", va="bottom")
# plt.title("Sales by Category")
# plt.xlabel("Category")
# plt.ylabel("Sales")
# plt.show()

#---------------------------------Profit By Category----------------------------------------------

Profit_category = df.groupby("Category")["Profit"].sum()
# print(Profit_category)

#Chart 

# ax = sales_category.plot(kind="bar")
# for i, v in enumerate(Profit_category):
#     plt.text(i, v, str(round(v,2)), ha="center", va="bottom")
# plt.title("Profit by Category")
# plt.xlabel("Category")
# plt.ylabel("Profit")
# plt.show()

#---------------------------------Profit By Sub-Category------------------------------------------
Profit_Sub_category = df.groupby("Sub-Category")["Profit"].sum()
# print(Profit_Sub_category)

#Chart 

# ax = Profit_Sub_category.plot(kind="barh")
# for i, v in enumerate(Profit_Sub_category):
#     plt.text(i, v, str(round(v,2)), ha="center", va="bottom")
# plt.title("Profit by Sub-Category")
# plt.xlabel("Sub-Category")
# plt.ylabel("Profit")
# plt.show()


#-----------------------------Sales Trend( Monthly)-------------------------------------------------
Monthly_Sales = df.groupby("Month")["Sales"].sum()
# print(Monthly_Sales)

#chart
# ax = Monthly_Sales.plot(kind="line")
# for i, v in enumerate(Monthly_Sales):
#     plt.text(i, v, str(round(v,2)), ha="center", va="bottom")
# plt.title("Monthly Sales Trend")
# plt.xlabel("Months")
# plt.ylabel("Sales")
# plt.show()

#-------------------------------------Profit By Region----------------------------------------------
Profit_region = df.groupby("Region")["Profit"].sum()
# print(Profit_region)

#chart
# ax = Profit_region.plot(kind="bar")
# for i, v in enumerate(Profit_region):
#     plt.text(i, v, str(round(v,2)), ha="center", va="bottom")
# plt.title("Profit By Region")
# plt.xlabel("Region")
# plt.ylabel("Profit")
# plt.show()

#------------------------Discount VS Profit Analysis----------------------------------------------

# sns.scatterplot(x="Discount", y="Profit",
#                 hue="Loss Flag",
#                 palette={False:"green", True:"red"},
#                 data=df)

# plt.title("Discount vs Profit")
# plt.show()

# #Loss making Orders
# print(df[df["Profit"]<0].shape)

# # Top loss products
# print(df[df["Profit"]<0][["Product Name" , "Sales" , "Profit"]].head())

#----------------------------------Correlation Heatmap--------------------------------------------
corr = df.corr(numeric_only=True)

# sns.heatmap(corr, annot=True, cmap="coolwarm")

# plt.title("Correlation Matrix")
# plt.show()


#----------------------------------Profit Distribution-------------------------------------------
sns.histplot(df["Profit"] , bins=50)
plt.title("Profit Distrbution")
plt.show()







#--------------------------------Sales Vs Profit Relationship--------------------------------------
# sns.scatterplot(x="Sales", y="Profit",
#                  hue="Loss Flag",
#                 palette={False:"green", True:"red"},
#                 data=df)

# plt.title("Sales vs Profit")
# plt.show()


#--------------------------------Discount Distribution---------------------------------------------
# sns.boxplot(x="Discount" , data=df)
# plt.title("Discount Distribution")
# plt.show()

#---------------------------------Discount Impact Analysis-----------------------------------------
# print(df.groupby("Discount")["Profit"].mean())

# #Chart
# sns.scatterplot(x="Discount" , y="Profit" ,   hue="Loss Flag",
#              palette={False:"green", True:"red"} , data=df)
# plt.title("Discount impact on Profit")
# plt.show()

#---------------------------------loss_products--------------------------------------------------
loss_products = df[df["Profit"]<0]
# print(loss_products.groupby("Sub-Category")["Profit"].sum().sort_values())

#---------------------------------Regional Profit Analysis-------------------------------------
# print(df.groupby("Region")["Profit"].sum().sort_values())