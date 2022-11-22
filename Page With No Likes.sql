SELECT p.page_id FROM pages p
LEFT JOIN page_likes pl
on p.page_id=pl.page_id
where liked_date is null
order by p.page_id ASC;