Select * From 
(	Select user_id,
	date_part('day',max(post_date)-min(post_date)) AS DAYS_BETWEEN
	FROM posts
	where date_part('year',post_date)= 2021 
	GROUP BY user_id
	order by user_id 
) x
where days_between>0;
