# Exploratory Data Analysis (EDA)

This folder contains the Python script used to perform exploratory data analysis on the cleaned retail dataset for the **Retail Profit Leakage Analysis** project.

The goal of this analysis is to understand sales performance, identify profit leakage patterns, and analyze the impact of discount strategies on profitability.

## Libraries Used

* pandas
* numpy
* matplotlib
* seaborn

## Dataset

The analysis is performed using the cleaned dataset generated during the data cleaning stage.

## Analysis Workflow

### 1. Business Overview

Initial exploration of overall company performance:

* Total Sales
* Total Profit
* Average Profit Margin

This provides a high-level understanding of the business performance.

### 2. Category-Level Analysis

Analysis of sales and profit across different product categories.

* Sales by Category
* Profit by Category

This helps identify which categories contribute the most to revenue and profitability.

### 3. Sub-Category Profit Analysis

Profit analysis at a deeper level using sub-categories.

This helps identify **loss-making product groups** and potential areas of profit leakage.

### 4. Monthly Sales Trend

Monthly sales aggregation is performed to identify **seasonal patterns and sales trends** throughout the year.

### 5. Regional Profit Analysis

Profit performance across different regions is analyzed to identify **high-performing and low-performing regions**.

### 6. Discount vs Profit Analysis

This is one of the most important analyses in the project.

A scatter plot is used to examine the relationship between **discount levels and profit**, helping identify whether aggressive discounting leads to reduced profitability.

### 7. Loss-Making Orders

Orders with negative profit are identified in order to detect:

* loss-generating transactions
* potentially problematic products

### 8. Correlation Analysis

A correlation matrix is generated to understand the relationship between numerical variables such as:

* Sales
* Profit
* Discount
* Quantity

### 9. Profit Distribution

A histogram is used to analyze the distribution of profit across orders.

### 10. Additional Visual Analysis

Additional visualizations include:

* Sales vs Profit relationship
* Discount distribution
* Discount impact analysis

These charts help better understand pricing behavior and profitability patterns.

## Key Outcome

The EDA stage helps uncover patterns related to **profit leakage**, including:

* the impact of high discounts on profitability
* loss-making sub-categories
* regional differences in profit performance
* overall sales and profit trends

These insights form the foundation for further analysis using **SQL, Excel, and Power BI dashboards**.
