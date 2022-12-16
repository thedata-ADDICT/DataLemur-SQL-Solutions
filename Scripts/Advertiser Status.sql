with payment_status as (
SELECT 
	adv.user_id,
	CASE WHEN paid is null THEN 'CHURN'
		 WHEN status!='CHURN' and paid is not null THEN 'EXISTING'
		 WHEN status='CHURN' and paid is not null THEN 'RESURRECT'
	END AS new_status
FROM 
    advertiser adv
LEFT JOIN 
    daily_pay dp 
ON
    adv.user_id=dp.user_id
UNION 
SELECT
	dp.user_id,
	CASE WHEN paid is not null THEN 'NEW' END AS new_status
FROM 
    daily_pay dp
LEFT JOIN 
    advertiser adv 
ON
    adv.user_id=dp.user_id
WHERE 
	adv.user_id IS NULL
)
SELECT * FROM payment_status order by user_id ;

