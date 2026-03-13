-- Netflix SQL project 

create table netflix (
show_id varchar(6),
type    varchar(10),
title   varchar(150),
director varchar(210),
casts    varchar(1000),
country  varchar(150),
date_added	varchar(50),
release_year int,
rating	varchar(10),
duration varchar(15),
listed_in varchar(100),
description varchar(250)
);

select * from netflix;

select count(*) as total_rows from netflix;

select distinct(type) from netflix;

--15 business problems in netflix dataset--

--Q1) Count the number of Movies and TV Shows 

select type , count(*) as Total_count from netflix 
group by type ;


--Q2) Find the most common rating for movies and TV shows--
select type , rating from(
select type, rating , count(*), rank() over(partition BY type order by count(*) desc) as ranking from netflix
group by type , rating 
) as t1 
where ranking = 1 ;

--Q3) List all the movies releases in a specific year (e.g, . 2020)

select * from netflix;


select * from netflix 
where
     type  = 'Movie'
     and 
     release_year = 2020;


--Q4) FInd the top 5 countries with the most content onn netflix--
select 
unnest(string_to_array(country , ',')) as new_country, count(show_id) as total_content 
from netflix
group by 1
order by total_content desc 
limit 5 ;

--Q5) Identify the longest movie--

SELECT * FROM netflix 
where type ='Movie'
and 
duration =(select max(duration) from netflix);

--Q6) find content added in the last five year 

select * from netflix 
where 
to_date(date_added , 'month DD ,YYYY') >= current_date - interval '5years'

--Q7) Find all the movies/TV shows by director 'Rajiv Chilaka'--

select type , director from netflix
where director ilike '%Rajiv Chilaka%';

--Q8) list all TV shows with more than 5 seasons 
select * from netflix
where type = 'TV Show'
and cast(replace(replace(duration , 'Seasons' ,''), 'Season' ,'') as integer ) >5;

--Q9) Count the number of content items in each genre 
select unnest(string_to_array(listed_in , ',')) as genre , count(show_id) from netflix
group by genre;

--Q10) Find each year and the average numbers of content release  by India on netflix , return top 5 year with highest avg content release ,
select extract(year from to_date(date_added , 'month DD , YYYY')) as year,
count(*) as yearly , 
round(count(*):: numeric/(select count(*) from netflix where country ='India'):: numeric * 100 ,2) as avg_per_year
from netflix 
where country = 'India'
group by 1


--Q11) List all movies that are documentaries-- 
select * from netflix
where type = 'Movie'
and 
listed_in ilike '%Documentaries%'

--Q12) Find all content without a director--
select * from netflix 
where director is null


--Q13) Find how many movies actor 'Salman khan' appeared in last 10 years--
select * from netflix
where type = 'Movie'
and 
casts ilike '%Salman khan%'
and 
release_year > extract( year from current_date) - 10;

--Q14) find the top 10 actors who have appeared in the highest number of movies produced in India 
select  unnest(string_to_array(casts , ',')) as actors ,count(*) as total_content   from netflix 
where country = 'India' 
and type ='Movie'
group by 1
order by 2 desc
limit 10;

--Q15) Categorize the content based on the presence of the keywords 'kill' and 'voilence' in the description field.
--Label content containing these keywords as 'Bad' and all other content as 'Good'. Count how many items fall into each category-- 
with new_table 
as
(
select *, case 
when description ilike '%Kill%'
or 
description ilike '%violence%' then 'Bad_content' 
else 'Good_content'
end category
from netflix
)
select category , count(*) as tota_content from new_table 
group by 1 