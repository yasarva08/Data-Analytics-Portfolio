-- SQL Retail Sales Analysis - p1 

create database SQl_PROJECT_P2

-- CREATE TABLE 



CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(20),
    quantiy INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
---  data cleaning  
SELECT *
FROM retail_sales
LIMIT 10


select  count(*) from retail_sales;

select * from retail_sales 
where transactions_id is null

select * from retail_sales 
where sale_date is null

select * from retail_sales 
where sale_time is null

select * from retail_sales 
where 
      transactions_id is null 
	  OR
	  sale_date	is null 
	  OR
	  sale_time	is null 
	  OR
	  customer_id is null
	  OR
	  gender is null
	  OR
	  category is null
	  OR
	  quantiy	is null
	  OR
	  cogs	is null
	  OR
	  total_sale is null

	  delete from retail_sales 
	  where 
      transactions_id is null 
	  OR
	  sale_date	is null 
	  OR
	  sale_time	is null 
	  OR
	  customer_id is null
	  OR
	  gender is null
	  OR
	  category is null
	  OR
	  quantiy	is null
	  OR
	  cogs	is null
	  OR
	  total_sale is null

-- data exploration 
-- how many sales we have ? 
select count(*) as total_sale from retail_sales 

-- how many unique customers we have ?

select count(distinct customer_id) from retail_sales

 -- how many unique customers we have ?

 select distinct category from retail_sales 

 -- data analysis and business key problems ans answers 

 -- q1) write a sql query  to retrieve all columns for sales made on 05-11-2022
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';


-- q2) write a sql query  to retreive all all transactions where the categary is " clothing" and the quantity sold is more than 4   in the month of nov  - 2022
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
  AND quantiy >= 4;

-- q3) write a sql query  to calculate the total sales (total_sale) for each catogary ?

select category , sum(total_sale) as net_sale , count(*) as total_orders from retail_sales
GROUP BY category;

-- q4) write a sql  query to find the average age of customers who purchased items from the 'beauty' category ?
select ROUND(avg(age),2) as avg_age from retail_sales
where category = 'Beauty';

-- q5) write a sql query to find all transactions where the total_sale is greater than 1000


select  count(transactions_id) as transactions from retail_sales 
where total_sale > 1000 ;  

-- q6) write a sql query to find the total number of transaaction (transactions_id) made by each gender in each category 

select  gender , category , count(transactions_id)  from retail_sales
group by gender , category 
order by  1;

-- q7) write a sql to calculate the average sale for each month . find out best selling month in each year 
select year ,  month ,  avg_sale
from (
select 
extract(year from sale_date) as year ,
extract(month from sale_date) as month ,
avg(total_sale) as  avg_sale , 
rank() over( partition by extract(year from sale_date) order by avg(total_sale) desc) as rank
from retail_sales
group by 1,2 
) as t1 
where rank = 1

-- q8) write a sql query to find the top 5 customers based on the highest total sales 

SELECT 
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- q9)  write a sql query to find the number of unique customers who purchased items from each category ?
select  category ,  count(distinct customer_id) as cnt_unique_cst from retail_sales
group by category 


-- q10) write a sql query to create each shift and number of orders ( example morning <=12 , afternoon between 12 & 17 , evening > 17  )
with hourly_sale
as
(
select *,
case 
when extract(hour from sale_time) < 12 then 'Morning'
when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
else 'Evening'

end as Shift
from retail_sales
)
select 
shift, 
count(*) as total_orders 
from hourly_sale
group by shift 


-- q11) Top 5 customer of total spending 
SELECT customer_id, SUM(total_sale) AS total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

--q12 ) Time slot wise sales (Morning / Afternoon / Evening) 
SELECT
CASE
    WHEN sale_time < '12:00:00' THEN 'Morning'
    WHEN sale_time BETWEEN '12:00:00' AND '17:00:00' THEN 'Afternoon'
    ELSE 'Evening'
END AS time_slot,
SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY time_slot;

--q13 ) Gender-wise category preference 
SELECT gender, category, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY gender, category
ORDER BY gender, total_sales DESC;

-- q14) Monthly sales trend 

SELECT
EXTRACT(MONTH FROM sale_date) AS month,
SUM(total_sale) AS monthly_sales
FROM retail_sales
GROUP BY month
ORDER BY month;


-- q15) Average Order Value 
SELECT
AVG(total_sale) AS avg_order_value
FROM retail_sales;
