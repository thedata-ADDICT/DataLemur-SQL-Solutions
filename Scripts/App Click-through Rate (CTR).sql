with activity as 
(
	SELECT app_id,
		COUNT(CASE WHEN event_type='impression' THEN 1 END ) AS impr,
		COUNT(CASE WHEN event_type='click' THEN 1 END ) AS click
	FROM events
		WHERE DATE_PART('YEAR',TIMESTAMP)=2022
		GROUP BY app_id 
)
SELECT 
	app_id,
	ROUND((click*100.0/impr),2) as ctr
FROM activity;

***************************************************************************************

SELECT 
	app_id,
	ROUND(100.0 * 
	COUNT(CASE WHEN event_type='click' THEN 1 END) /
	COUNT(CASE WHEN event_type='impression' THEN 1 END)
	      ,2) AS ctr
FROM events
	WHERE DATE_PART('year',timestamp)=2022
	GROUP BY app_id