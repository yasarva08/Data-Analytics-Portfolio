# 🎧 Spotify Data Analysis using SQL

![Spotify Logo](./spotify_logo.jpg)

---

## 📌 Project Overview

This project focuses on analyzing a real-world Spotify dataset using **SQL** to extract meaningful insights about tracks, artists, albums, and user engagement metrics.

The analysis covers everything from **basic data exploration (EDA)** to **advanced SQL techniques** such as window functions, CTEs, and performance-based queries.

---

## 🎯 Objectives

* Perform data cleaning and exploration on Spotify dataset
* Analyze music trends and engagement metrics
* Practice SQL from basic to advanced level
* Extract actionable insights using structured queries

---

## 🛠️ Tech Stack

* **Database**: SQL (MySQL / PostgreSQL)
* **Language**: SQL
* **Tools Used**: SQL Editor (MySQL Workbench / pgAdmin)

---

## 📂 Project Structure

```
Spotify-SQL-Analysis/
│── dataset/
│   └── spotify_data.csv
│
│── queries/
│   └── spotify_analysis.sql
│
│── docs/
│   └── sql_questions.txt
│
│── README.md
│── spotify_logo.jpg
```

---

## 📊 Dataset Description

The dataset contains detailed information about Spotify tracks, including:

* **Artist & Track Information**
* **Album & Album Type**
* **Audio Features** (danceability, energy, loudness, etc.)
* **Engagement Metrics** (views, likes, comments, streams)
* **Platform Data** (Spotify vs YouTube)

---

## 🔍 Analysis Performed

### 🧹 1. Data Exploration (EDA)

* Total number of records
* Unique artists and albums
* Data cleaning (handling zero duration values)
* Distribution of tracks across platforms

---

### 📈 2. SQL Analysis

#### 🟢 Easy Level

* Tracks with more than 1B streams
* Albums with respective artists
* Total comments on licensed tracks
* Tracks of type "single"
* Track count per artist

#### 🟡 Medium Level

* Average danceability per album
* Top 5 high-energy tracks
* Views & likes of official videos
* Total views per album
* Spotify vs YouTube stream comparison

#### 🔴 Advanced Level

* Top 3 most viewed tracks per artist (Window Function)
* Tracks with above-average liveness
* Energy difference per album (CTE)
* Energy-to-liveness ratio analysis
* Cumulative likes using window function

---

## 🚀 Key SQL Concepts Used

* `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`
* Aggregate Functions (`SUM`, `AVG`, `COUNT`)
* Window Functions (`DENSE_RANK`, `SUM OVER`)
* Common Table Expressions (CTE)
* Conditional Aggregation
* Data Cleaning Queries

---

## 💡 Key Insights

* Identified top-performing tracks and artists based on streams
* Compared streaming behavior across platforms (Spotify vs YouTube)
* Analyzed musical features like energy and danceability
* Discovered engagement trends using likes, views, and comments

---

## 🧠 Learning Outcomes

* Improved SQL querying skills from beginner to advanced level
* Learned real-world dataset handling and cleaning
* Gained experience with analytical thinking using SQL
* Understood performance-focused queries and optimization basics

---

## 📁 Practice Questions

All SQL problems solved in this project are available here:
👉 `/docs/sql_questions.txt`

---

## ▶️ How to Run the Project

1. Import the dataset (`spotify_data.csv`) into your SQL database
2. Create the table using the provided schema
3. Run queries from `spotify_analysis.sql`
4. Analyze outputs and insights

---

## 📌 Future Improvements

* Create dashboards using Power BI or Tableau
* Add more datasets for deeper analysis
* Implement query optimization techniques (indexing, execution plans)

---

## 🤝 Contributing

Feel free to fork this repository and improve the project. Contributions are welcome!

---

## 📄 License

This project is open-source and available under the MIT License.

---

## 👨‍💻 Author

**Your Name**
Aspiring Data Analyst | SQL | Power BI | Python

---

