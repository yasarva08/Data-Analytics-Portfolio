-- Advanced SQL Project -- Project Dataset 

create table spotify
(
Artist varchar(255),
Track varchar(255),
Album	varchar(255),
Album_type varchar(55),
Danceability float,
Energy float,
Loudness float,
Speechiness float,
Acousticness float,
Instrumentalness float,
Liveness float,
Valence float,
Tempo float,
Duration_min float,
Title varchar(255),
Channel varchar(255),
Views float,
Likes float,
Comments float,
Licensed boolean ,
official_video boolean,
Stream bigint,
EnergyLiveness float,
most_playedon varchar(50)
);

select * from spotify;

---------------------------------------------- EDA---------------------------------------------------------------

select count(*) from spotify;

select count(distinct artist) from spotify;

select distinct album_type from spotify;

select max(duration_min) from spotify;

select min(duration_min) from spotify;

select * from spotify 
where duration_min = 0;

delete from spotify 
where duration_min = 0; 

select distinct channel from spotify; 
select distinct most_playedon from spotify; 

-- ------------------------------
-- Data Analysis - Easy Category
-- ------------------------------

--Q1) Retrieve the names of all  tracks that have more than 1 billion streams--
select track , stream from spotify
where stream > 1000000000;

--Q2) List all the albums with their respective artists--
select  distinct album , artist  from spotify
order by 1 ;


--Q3) Get the total number of comments for tracks where licensed = TRUE-- 
select  sum(comments) , licensed from spotify
where licensed = 'TRUE'
group by  2;

--Q4) Find all tracks that belongs to the album type single--

select track , album_type from spotify  
where album_type = 'single';

--Q5) Count the total number of tracks by each artist--

select artist , count(track) from spotify
group by 1;


-- ------------------------------
-- Data Analysis - Medium Category
-- ------------------------------

--Q6) Calculate the average danceability of tracks in each column--
select  album , avg(danceability) as avg_danceability from spotify
group by 1 
order by 2 desc;


--Q7) FInd the top tracks with the highest energy values--
select track , max(energy) from spotify 
group by  1
order by 2 desc
limit 5 ; 

--Q8) List all tracks along with their views and likes where official_video = TRUE--
select track , sum(views) as total_views , sum(likes) as total_likes from spotify 
where official_video ='TRUE'
group by  1
order by 2 desc 
limit 5;

--Q9) For each album , calculate the total views of all associated track--
select album ,track , sum(views) as total_views  from spotify 
group by 1 ,2 
order by 3 desc;

--Q10) Retrieve the track names that have been streamed on spotify more than youtube--
select * from 
(
select track , 
coalesce(sum(case when most_playedon ='Youtube' then stream end ),0) as stream_on_youtube,
coalesce(sum(case when most_playedon ='Spotify' then stream end ),0) as stream_on_spotify
from spotify
group by 1 
) as t1 
where stream_on_spotify > stream_on_youtube 
and 
stream_on_youtube <>0;


-- ------------------------------
-- Data Analysis - Advanced Category
-- ------------------------------

--Q11) Find the top 3 most viewed tracks for each artist using window functions--
with ranking_artist 
as
(
select artist , track , sum(views) as total_view , 
dense_rank() over(partition by artist order by sum(views) desc) as rank from spotify 
group by 1,2 
order by 1, 3 desc
)
select * from ranking_artist
where rank <=3; 

--Q12) Write a query to find tracks where the liveness score is above the average--
select track , liveness  from spotify 

where liveness  >(select (avg(liveness)) as avg_liveness from  spotify);
 
--Q13) Use a with clause to calculate the difference between the highest and lowest energy values for tracks in each album--
with cte 
as
(
select album , 
max(energy) as max_energy ,
min(energy) as min_energy from spotify 
group by 1 
)
select album , max_energy - min_energy as energy_diff from cte 
order by 2 desc;

--Q14) Find tracks where the energy to liveness ratio is greater than 1.2--
SELECT track , energy, liveness, energy / liveness AS ratio FROM spotify
WHERE liveness != 0
AND 
energy / liveness > 1.2;

--Q15) Calculate the cumulative sum of likes for tracks ordered by the number of views, using window function  
SELECT track, views,likes, SUM(likes) OVER (ORDER BY views
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_likes
FROM spotify
order by 4 desc ; 
















