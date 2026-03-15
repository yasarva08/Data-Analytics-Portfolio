# Retail Profit Leakage Analysis – Power BI Executive Dashboard

This section of the project focuses on building an **interactive Power BI Executive Dashboard** to analyze sales performance, profitability, customer behavior, and profit leakage patterns in the retail dataset.

The dashboard was created using the cleaned dataset generated during the Python data cleaning stage.

Dataset used: `clean_superstore.csv`

Power BI was used to transform analytical insights from Python, SQL, and Excel into an **interactive business intelligence dashboard**.

---

# Data Import & Preparation

The cleaned dataset was imported into Power BI using:

Get Data → CSV → clean_superstore.csv

After importing the dataset, a quick check was performed in **Power Query** to verify:

* column data types
* date formats
* missing values

After verification, the dataset was loaded into the Power BI model.

---

# Key Measures Created

Several DAX measures were created to support dashboard KPIs.

Total Sales

```
Total Sales = SUM(superstore[Sales])
```

Total Profit

```
Total Profit = SUM(superstore[Profit])
```

Profit Margin

```
Profit Margin = DIVIDE(SUM(superstore[Profit]),SUM(superstore[Sales]))
```

Total Orders

```
Total Orders = COUNT(superstore[Order ID])
```

These measures are used across multiple dashboard pages to provide high-level business metrics.

---

# Dashboard Structure

The Power BI dashboard contains **four pages**, each focusing on different aspects of the business.

---

# Page 1 – Executive Overview

This page provides a high-level overview of the company’s performance.

Key metrics displayed:

* Total Sales
* Total Profit
* Profit Margin
* Total Orders

Visualizations included:

* Sales by Category (Clustered Bar Chart)
* Profit by Region (Bar Chart)
* Monthly Sales Trend (Line Chart)

These visuals provide a quick understanding of **overall revenue performance and profitability trends**.

![Executive Overview](images/executive_overview.png)

Insight:

The overview page allows executives to quickly monitor overall sales, profitability, and regional performance trends.

---

# Page 2 – Profit Leakage Analysis

This page focuses on identifying areas where profit is being lost.

Visualizations included:

Profit by Sub-Category

Bar chart sorted in ascending order to highlight **loss-making product groups**.

Discount vs Profit

Scatter chart used to analyze the relationship between **discount levels and profitability**.

Loss Orders Table

Filtered view showing only:

Profit < 0

Columns displayed:

* Product Name
* Sales
* Profit
* Discount

![Profit Leakage Analysis](images/profit_leakage_analysis.png)

Insight:

This page highlights how **aggressive discounting and low-margin products contribute to profit leakage**.

---

# Page 3 – Customer Analysis

This page analyzes customer purchasing behavior.

Top Customers

Bar chart showing **Top 10 customers by sales revenue**.

Sales by Segment

Pie chart comparing performance across:

* Consumer
* Corporate
* Home Office

![Customer Analysis](images/customer_analysis.png)

Insight:

A small number of customers contribute significantly to overall revenue, highlighting the importance of **customer retention and relationship management**.

---

# Page 4 – Regional Performance

This page evaluates geographical performance.

Map Visualization

Displays sales distribution across regions.

Region Profit Ranking

Bar chart ranking regions based on total profit.

![Regional Performance](images/regional_performance.png)

Insight:

Some regions generate higher profits than others, helping identify **strong and weak performing markets**.

---

# Interactive Features

To improve dashboard usability, interactive slicers were added.

Filters available:

* Region
* Category
* Segment
* Year

These slicers allow users to dynamically explore the data and analyze business performance across different dimensions.

---

# Dashboard Design

Several design improvements were implemented to enhance readability and usability.

Design elements include:

* consistent color theme
* clean layout and spacing
* clearly labeled visuals
* professional dashboard structure

The dashboard uses a **blue and white color theme** to maintain visual clarity and consistency.

---

# Key Business Insights

The Power BI dashboard helped uncover several important insights:

* Certain sub-categories generate consistent losses
* High discounts significantly reduce profitability
* Some regions outperform others in terms of profit generation
* A small number of customers contribute a large share of revenue
* Sales patterns show seasonal fluctuations across months

These insights help businesses identify opportunities for:

* pricing optimization
* discount strategy improvement
* customer retention strategies
* regional performance improvement

---

# Tools Used

* Microsoft Power BI
* DAX (Data Analysis Expressions)
* Data Visualization Techniques

---

# Project Integration

The Power BI dashboard is part of the complete project:

Retail Profit Leakage & Growth Optimization

Full project pipeline:

Python → Data Cleaning & EDA
SQL → Business Analysis
Excel → Pivot Analysis & Dashboard
Power BI → Interactive Executive Dashboard

This end-to-end workflow demonstrates how raw data can be transformed into actionable business insights.

