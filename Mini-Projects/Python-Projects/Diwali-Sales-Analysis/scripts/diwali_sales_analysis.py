# 📊 Diwali Sales Data Analysis

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load dataset
df = pd.read_csv("diwali_sales_dataset.csv", encoding="unicode_escape")

# Basic info
print(df.shape)
print(df.head())
print(df.info())

# -------------------- DATA CLEANING --------------------

# Drop unnecessary columns
df.drop(["Status", "unnamed1"], axis=1, inplace=True)

# Check null values
print(df.isnull().sum())

# Drop null values
df.dropna(inplace=True)

# Change datatype
df["Amount"] = df["Amount"].astype(int)

print(df.describe())

# -------------------- EDA --------------------

# Gender Distribution
plt.figure(figsize=(5,5))
ax = sns.countplot(x="Gender", data=df)
for bars in ax.containers:
    ax.bar_label(bars)
plt.title("Gender Distribution")
plt.savefig("images/gender_distribution.png")
plt.show()

# Gender vs Amount
sales_gen = df.groupby(["Gender"], as_index=False)["Amount"].sum().sort_values(by="Amount", ascending=False)

sns.barplot(x="Gender", y="Amount", data=sales_gen)
plt.title("Total Amount by Gender")
plt.savefig("images/gender_amount.png")
plt.show()

# -------------------- AGE --------------------

# Age Group Count
plt.figure(figsize=(8,5))
bx = sns.countplot(data=df, x="Age Group", hue="Gender")
for bars in bx.containers:
    bx.bar_label(bars)
plt.title("Age Group Distribution")
plt.savefig("images/age_group_distribution.png")
plt.show()

# Age Group vs Amount
sales_age = df.groupby(["Age Group"], as_index=False)["Amount"].sum().sort_values(by="Amount", ascending=False)

sns.barplot(x="Age Group", y="Amount", data=sales_age)
plt.title("Amount by Age Group")
plt.savefig("images/age_group_amount.png")
plt.show()

# -------------------- STATE --------------------

# Orders by State
sales_state = df.groupby(["State"], as_index=False)["Orders"].sum().sort_values(by="Orders", ascending=False).head(10)

plt.figure(figsize=(15,5))
sns.barplot(x="State", y="Orders", data=sales_state)
plt.title("Top 10 States by Orders")
plt.xticks(rotation=45)
plt.savefig("images/state_orders.png")
plt.show()

# Amount by State
sales_state = df.groupby(["State"], as_index=False)["Amount"].sum().sort_values(by="Amount", ascending=False).head(10)

plt.figure(figsize=(15,5))
sns.barplot(x="State", y="Amount", data=sales_state)
plt.title("Top 10 States by Amount")
plt.xticks(rotation=45)
plt.savefig("images/state_amount.png")
plt.show()

# -------------------- MARITAL STATUS --------------------

# Count
cx = sns.countplot(data=df, x="Marital_Status")
for bars in cx.containers:
    cx.bar_label(bars)
plt.title("Marital Status Distribution")
plt.savefig("images/marital_status.png")
plt.show()

# Amount by Marital Status
sales_marital = df.groupby(["Marital_Status"], as_index=False)["Amount"].sum().sort_values(by="Amount", ascending=False)

sns.barplot(x="Marital_Status", y="Amount", data=sales_marital, hue="Gender")
plt.title("Amount by Marital Status")
plt.savefig("images/marital_status_amount.png")
plt.show()

# -------------------- OCCUPATION --------------------

# Count
plt.figure(figsize=(12,5))
cx = sns.countplot(data=df, x="Occupation")
for bars in cx.containers:
    cx.bar_label(bars)
plt.xticks(rotation=45)
plt.title("Occupation Distribution")
plt.savefig("images/occupation_distribution.png")
plt.show()

# Amount by Occupation
sales_occ = df.groupby(["Occupation"], as_index=False)["Amount"].sum().sort_values(by="Amount", ascending=False)

plt.figure(figsize=(20,5))
sns.barplot(x="Occupation", y="Amount", data=sales_occ)
plt.xticks(rotation=45)
plt.title("Amount by Occupation")
plt.savefig("images/occupation_amount.png")
plt.show()

# -------------------- PRODUCT CATEGORY --------------------

# Count
plt.figure(figsize=(12,5))
cx = sns.countplot(data=df, x="Product_Category")
for bars in cx.containers:
    cx.bar_label(bars)
plt.xticks(rotation=45)
plt.title("Product Category Distribution")
plt.savefig("images/product_category.png")
plt.show()

# Amount by Category
sales_prod = df.groupby(["Product_Category"], as_index=False)["Amount"].sum().sort_values(by="Amount", ascending=False)

plt.figure(figsize=(20,5))
sns.barplot(x="Product_Category", y="Amount", data=sales_prod)
plt.xticks(rotation=45)
plt.title("Amount by Product Category")
plt.savefig("images/product_category_amount.png")
plt.show()

# -------------------- TOP PRODUCTS --------------------

sales_prod = df.groupby(["Product_ID"], as_index=False)["Orders"].sum().sort_values(by="Orders", ascending=False).head(10)

plt.figure(figsize=(20,5))
sns.barplot(x="Product_ID", y="Orders", data=sales_prod)
plt.xticks(rotation=45)
plt.title("Top 10 Most Sold Products")
plt.savefig("images/top_products.png")
plt.show()

# -------------------- CONCLUSION --------------------

print("""
Conclusion:
Married women aged 26–35 from Uttar Pradesh, Maharashtra, and Karnataka working in IT, Healthcare, and Aviation sectors 
are more likely to purchase products from Food, Clothing, and Electronics categories.
""")