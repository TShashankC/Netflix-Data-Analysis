select 
       type, 
       count(*) 
from netflix 
group by type; 


# 2. Find the Most Common Rating for Movies and TV Shows

with Ratings as(
select 
      type, 
	  rating, 
	  count(*) as rating_count 
from netflix
group by type,rating 
),
rankedRatings as (
select 
      type, 
	  rating, 
	  Ratings,
	  rank() over (partition by type order by rating_count desc) as Rank
from Ratings
)


select *
from rankedRatings
where Rank=1;


# 3. List All Movies Released in a Specific Year (e.g., 2020)

SELECT * 
FROM netflix
WHERE release_year = 2020;



#4. Find the Top 5 Countries with the Most Content on Netflix

select 
      unnest(string_to_array(country,',')) as new_country,
	  count(*) as total
from netflix
group by new_country
order by total desc
limit 5;


#5. Identify the Longest Movie

Select 
    *
from netflix
where type = 'Movie'
order by split_part(duration, ' ', 1)::int desc;

# 6. Find Content Added in the Last 5 Years

select
      * 
from netflix
where To_date(date_added, 'Month DD, YYYY') >= current_date - interval '5 years'



#7. Categorize Content Based on the Presence of 'Kill' and 'Violence' Keywords

select 
      count(*),
	  case 
	  when description ilike '%kill%' or description ilike '%violence%' then 'Bad'
	  else 
	  'Good' 
	  end as Label
from netflix
group by Label


#8. Find All Content Without a Director

select
      *
from netflix
where director isnull
