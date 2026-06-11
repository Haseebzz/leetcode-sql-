--Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
--one way to solve this is to see if the visit id is not in the transactions table using where clause 
SELECT
    customer_id,
    COUNT(*) AS count_no_trans
FROM Visits
WHERE visit_id NOT IN (
    SELECT visit_id
    FROM Transactions
)
GROUP BY customer_id; 

--another way is to use a left join which gets all of the customer and visit id customer and find where trans_id is null means customer didnt do a transaction 
select customer_id, count(*) as count_no_trans
from Visits 
left join Transactions 
on Visits.visit_id = Transactions.visit_id 
where Transactions.transaction_id is null 
group by customer_id 
