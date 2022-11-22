SELECT sender_id,
count(1) as message_count
FROM messages
where date_part('month',sent_date)=08
and date_part('year',sent_date)=2022
GROUP BY sender_id
order by message_count DESC
limit 2;