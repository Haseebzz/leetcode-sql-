--The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.

--Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.
--using a cte with a windowfunction Row_Number to get the ranks of each customer id row order by order date 
with cte as ( 

    select *, Row_Number() over (partition by customer_id order by order_date) as rn
    from Delivery
)
 

 select Round(sum(case when order_date = customer_pref_delivery_date then 1 else 0 END)/count(*) * 100,2) as immediate_percentage
 from cte 
 where rn = 1
