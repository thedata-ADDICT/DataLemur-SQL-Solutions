with transaction_records as 
(
SELECT 
	*,
	row_number() over(PARTITION BY user_id order by user_id,transaction_date) as trans_num
FROM 
	transactions
)

SELECT 
  user_id , 
  spend , 
  transaction_date
FROM 
  transaction_records
WHERE
  trans_num=3;
  
******************************************************************************************

SELECT 
	user_id , 
	spend , 
	transaction_date
FROM 
	(	SELECT 
				*
				row_number() over(PARTITION BY user_id order by user_id,transaction_date) as rn
		FROM 
				transactions) transaction_records 
WHERE 
	rn=3;