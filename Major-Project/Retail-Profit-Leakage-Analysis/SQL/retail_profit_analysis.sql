create table Retail_Profit_Leakage(
Row_ID int,
Order_ID varchar(20),
Order_Date text , 
Ship_Date text,
Ship_Mode varchar(20),
Customer_ID varchar(20),
Customer_Name varchar(50),
Segment  varchar(20),
Country varchar(20),
City varchar(40),
State varchar(30),
Postal_Code bigint ,
Region varchar(20),
Product_ID varchar(30),
Category varchar(50),
Sub_Category varchar(50),
Product_Name varchar(200),
Sales NUMERIC(10,4),
Quantity int,
Discount  NUMERIC(4,2),
Profit NUMERIC(10,4),
Profit_Margin NUMERIC(10,4),
Loss_Flag	boolean ,
Year int,
Month int
);

SELECT *
FROM retail_profit_leakage
LIMIT 10;

-- Row Count 
select count(*) from retail_profit_leakage ;

-- Converting the order_id and ship_date into  date column 
ALTER TABLE retail_profit_leakage
ALTER COLUMN order_date TYPE DATE
USING TO_DATE(order_date,'MM/DD/YYYY');

ALTER TABLE retail_profit_leakage
ALTER COLUMN ship_date TYPE DATE
USING TO_DATE(ship_date,'MM/DD/YYYY');

-----------------------------------Checking Dataset Structure-------------------------------------------------------

select * from Retail_Profit_Leakage
limit 10;


------------------------------------------Total Buisness Overview--------------------------------------------------
--# Total Sales 
select sum(Sales) as total_sales from Retail_Profit_Leakage;

--# Total Profit 
select sum(Profit) as total_profit from Retail_Profit_Leakage;

--# Average Profit Margin
select avg(Profit_Margin) as avg_Profit_Margin from Retail_Profit_Leakage;

----------------------------------------Sales & Profit by Region--------------------------------------------------
select Region , sum(Sales) as total_Sales , sum(Profit) as total_Profit from Retail_Profit_Leakage
group by 1 
order by 3 desc;



--------------------------------------- Category Performance------------------------------------------------------
select Category , sum(Sales) as total_Sales , sum(Profit) as total_Profit from Retail_Profit_Leakage
group by 1 
order by 3 desc;

---------------------------------------Sub-Category Profit Analysis-------------------------------------------------
select Sub_Category , sum(Profit) as total_Profit from Retail_Profit_Leakage
group by  1 
order by 2 ;

-------------------------------------- High Sales but Low Profit---------------------------------------------------
select Product_Name , Sales , Profit from  Retail_Profit_Leakage 
where Sales > 1000
and 
Profit < 50 
order by Profit ;


---------------------------------------Top 10 Customers-----------------------------------------------------------
select Customer_Name  , Sum(Sales) as total_Sales from Retail_Profit_Leakage
group by 1 
order by 2 desc 
limit 10 ; 

-------------------------------------Monthly Sales Analysis------------------------------------------------------
select Month  , sum(Sales) as Monthly_Sales from Retail_Profit_Leakage
group by 1 
order by 1;

---------------------------------------Region Ranking------------------------------------------------------------
select Region , sum(Profit) as total_Profit  ,rank() over(order by sum(Profit) desc ) as Profit_rank 
from Retail_Profit_Leakage
group by 1 ;


----------------------------------------Loss Making Products-----------------------------------------------------
select * from Retail_Profit_Leakage
where Profit <0;

---------------------------------------Order Per Segment-------------------------------------------------------

select Segment , count(Order_ID) as total_Orders from Retail_Profit_Leakage
group by 1 
order by 2 desc ;


---------------------------------------Average Discount By Category----------------------------------------------
select Category , Avg(Discount) as Avg_Discount from Retail_Profit_Leakage 
group by 1 
order by  2 desc;

--------------------------------------Yearly Sales Growth--------------------------------------------------------
select Year , Sum(Sales) as total_Sales from Retail_Profit_Leakage
group by 1 
order by 1 


------------------------------------Top 10 Products BY Profit-----------------------------------------------------
select Product_Name , sum(Profit) as total_Profit from Retail_Profit_Leakage
group by 1 
order by 2 desc 
limit 10;


----------------------------------- Negative Profit Sub-Category------------------------------------------------
select Sub_Category , sum(Profit) as total_Profit from Retail_Profit_Leakage
group by 1
having sum(Profit)<0
order by 2;















