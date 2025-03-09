# Netflix-Data-Analysis



# 1. Count the Number of Movies vs TV Shows




```select 
       type, 
			 count(*) 
from netflix 
group by type;

