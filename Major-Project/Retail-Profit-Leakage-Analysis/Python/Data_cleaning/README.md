# Data Cleaning & Preparation

This folder contains the Python script used for cleaning and preparing the retail dataset before performing further analysis.

The script performs multiple steps to understand, clean, and prepare the dataset for downstream analysis in SQL, Excel, and Power BI.

## Workflow

### 1. Library Import

Python libraries used for data processing:

* pandas
* numpy

### 2. Dataset Loading

The retail dataset is loaded using pandas for further inspection and processing.

### 3. Dataset Structure Understanding

The structure of the dataset is explored using:

* dataset shape
* column names
* data types

This helps understand how the dataset is organized.

### 4. Summary Statistics

Basic statistics of numerical columns are checked to understand:

* average sales
* minimum and maximum values
* distribution of profit and discount

### 5. Missing Value Check

The dataset is inspected for missing values to ensure data quality before analysis.

### 6. Duplicate Records Check

Duplicate rows are identified and removed to maintain data integrity.

### 7. Date Conversion

The following columns are converted into datetime format:

* Order Date
* Ship Date

This enables time-based analysis later.

### 8. Feature Engineering

New columns are created to support deeper analysis:

* **Profit Margin** – profit relative to sales
* **Loss Flag** – identifies orders with negative profit
* **Year** – extracted from Order Date
* **Month** – extracted from Order Date

### 9. Basic Business Analysis

Initial insights are generated including:

* Total Sales
* Total Profit
* Sales by Category
* Profit by Region

### 10. Clean Dataset Export

After cleaning and preparation, the dataset is exported as a cleaned dataset which is used for:

* SQL analysis
* Excel analysis
* Power BI dashboard
I.

