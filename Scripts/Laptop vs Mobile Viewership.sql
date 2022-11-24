SELECT sum(x.laptop_views) as laptop_views ,
sum(x.mobile_views) as mobile_views
FROM 
(SELECT
CASE WHEN device_type='tablet' THEN count(user_id)
     WHEN device_type='phone' THEN count(user_id)
End AS mobile_views,
CASE WHEN device_type='laptop' THEN count(user_id)
END AS laptop_views
FROM viewership
GROUP BY device_type) x;