WITH mart AS (
SELECT 
  item_type,
  SUM(square_footage) as area,
  count(1) as qty
FROM 
	inventory
GROUP BY 
	item_type
),
prime_mart AS (
SELECT
	item_type,
	area,
	TRUNC(500000/area) as prime_item_combo,
	TRUNC(500000/area)*qty as prime_item_count
FROM
	mart
WHERE 
	item_type='prime_eligible'
),
non_prime_mart AS
(
SELECT
	item_type,
	area,
	TRUNC((500000-(SELECT area*prime_item_combo FROM prime_mart))/area) as non_prime_item_combo,
	TRUNC((500000-(SELECT area*prime_item_combo FROM prime_mart))/area)*qty as non_prime_item_count
FROM
	mart
WHERE 
	item_type='not_prime'
)
SELECT
	item_type,
	prime_item_count
FROM
	prime_mart
UNION ALL
SELECT
	item_type,
	non_prime_item_count
FROM
	non_prime_mart