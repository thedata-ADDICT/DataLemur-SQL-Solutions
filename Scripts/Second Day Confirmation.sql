SELECT 
 	user_id 
 FROM emails E
 LEFT JOIN texts T
 	ON E.email_id = T.email_id
 WHERE 
	EXTRACT(DAY FROM E.signup_date) = EXTRACT(DAY FROM T.action_date)-1;

****************************************************************************

SELECT 
	user_id 
FROM emails E
LEFT JOIN texts T
	ON E.email_id = T.email_id
WHERE 
	E.signup_date = T.action_date - INTERVAL '1 day';