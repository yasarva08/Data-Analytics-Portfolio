-- Advanced SQL Project -- Project Dataset 

create table Walmart_Data
(
invoice_id bigint, 
Branch varchar(100),
City varchar(100),
category varchar(100), 
unit_price float,
quantity int,
date varchar(100),
time time, 
payment_method varchar(100), 
rating float ,
profit_margin float 
);

---------------------------------------------------EDA---------------------------------------------------------------
select * from Walmart_Data;

select count(*) from Walmart_Data;

select payment_method, count(*) from Walmart_Data 
group by payment_method;

select count(distinct (branch)) from Walmart_Data;

select max(quantity) from Walmart_Data;



----- Business Problems 

--Q1) find different payment method and number of transaction , number of qty sold--
select payment_method , count(*) as no_payment, sum(quantity) as no_qty_sold from Walmart_Data 
group by payment_method;

--Q2) Identify the highest-rated category in each branch , displaying the branch , category avg rating--
select * from 
(
select branch , category , avg(rating) as avg_rating , rank()over(partition by branch order by avg(rating) desc) as rank   from Walmart_Data
group by 1,2
)
where rank = 1

-- Q3) Identify the busiest day for each branch based on the number of transactions
select * from 
(
select branch , to_char(to_date(date , 'dd/mm/yy') , 'day') as day_name , count (*) as no_transaction ,
rank() over(partition by branch order by count(*) desc) as rank from Walmart_Data
group by 1,2)
where rank = 1 ;


--Q4) Calcuate the total quantity of items sold per payment method . list payment_method and total_quantity--
select payment_method, sum(quantity) as total_qty from Walmart_Data
group by 1

--Q5) Determine the average , minimum, and maximum rating of products for each city. 
--    List  the city , average_rating, min_rating and max_rating--

select city , category ,  avg(rating) as avg_rating , max(rating) as max_rating , min(rating) as min_rating  from Walmart_Data 
group by 1 ,2 

--Q6) Calculate the total profit for each category by considering total_profit as:-
--    (unit_price * quantity * profit_margin) List category and total_profit, ordered from highest to lowest profit--

select category , sum(unit_price * quantity * profit_margin) as total_profit from Walmart_Data 
group by 1  

--Q7 Determine the most common payment method for each branch . Display branch and the prefferred_payment_method.
with cte 
as
(
select branch ,  payment_method , count(*) as total_trans , rank() over(partition by branch order by count(*) desc) as rank from Walmart_Data
group by 1,2 )
select * from cte 
where rank = 1 


--Q8) Categorize sales into 3 group MORNING , AFTERNOON , EVENING . find out which of the shift and number of invoices 


SELECT 
    CASE 
        WHEN time >= '09:00:00' AND time < '12:00:00' THEN 'Morning'
        WHEN time >= '12:00:00' AND time < '17:00:00' THEN 'Afternoon'
        WHEN time >= '17:00:00' AND time < '21:00:00' THEN 'Evening'
        ELSE 'Night'
    END AS time_category,
    COUNT(*) AS total_orders
FROM walmart_data
GROUP BY time_category;


--Q9) Identify 5 branch with highest decrease ratio in revenue compare to last year(current year 2023 and last year 2022)
WITH revenue_2022 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM Walmart_Data
    WHERE EXTRACT(YEAR FROM TO_DATE(date, 'DD/MM/YY')) = 2022
    GROUP BY branch
),

revenue_2023 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM  Walmart_Data
    WHERE EXTRACT(YEAR FROM TO_DATE(date, 'DD/MM/YY')) = 2023
    GROUP BY branch
)

SELECT 
    ls.branch,
    ls.revenue AS last_year_revenue,
    cs.revenue AS cr_year_revenue,
    ROUND(
        (ls.revenue - cs.revenue)::numeric /
        ls.revenue::numeric * 100,
        2
    ) AS rev_dec_ratio
FROM revenue_2022 ls
JOIN revenue_2023 cs
ON ls.branch = cs.branch
WHERE ls.revenue > cs.revenue
ORDER BY rev_dec_ratio DESC
LIMIT 5;




