# Write your MySQL query statement below
-- select visits.customer_id, COUNT(*) AS count_no_trans
-- FROM Visits
-- LEFT JOIN Transactions
-- ON visits.visit_id = transactions.visit_id
-- WHERE transactions.transaction_id IS NULL
-- GROUP BY visits.customer_id;
select visits.customer_id, count(*) as count_no_trans from 
visits 
left join transactions on visits.visit_id = transactions.visit_id 
where transactions.transaction_id is null 
group by visits.customer_id;