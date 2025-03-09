# Netflix-Data-Analysis



# 1. Count the Number of Movies vs TV Shows




`select 
       type, 
       count(*) 
from netflix 
group by type;`





# 2. Find the Most Common Rating for Movies and TV Shows
 
 
 'select 
type,
rating

from

(select 
type, rating, count(rating) as rat,
rank() over (partition by type order by count(rating) desc ) as Ranking
from netflix 
group by 1,2  
order by 1,3) as t1

where Ranking=1;'

