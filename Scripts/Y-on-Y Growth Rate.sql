with year_on_year_growth as 
(
SELECT 
	EXTRACT(Year FROM transaction_date) as year,
	product_id,
	spend AS curr_year_spend,
	LAG(spend,1) OVER(PARTITION BY product_id ORDER BY product_id) AS prev_year_spend
FROM 
	user_transactions
)
SELECT
	year,
	product_id,
	curr_year_spend,
	prev_year_spend,
	ROUND((curr_year_spend-prev_year_spend)*100.0/prev_year_spend,2) as yoy_rate
FROM
	year_on_year_growth;