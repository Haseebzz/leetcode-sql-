--The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. 
--The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.
--Write a solution to find the confirmation rate of each user.

--we can join the tables using a left join because we still want userid from the left table. group by userid and use coalesce so that if we get null return 0 then
--we can perform the sum aggregate on each userid rows where action is confirmed divide that by the total rows using count and round it up to 2 decimal places 

select 
s.user_id,
ROUND(coalesce(sum(case when c.action = 'confirmed' then 1 END) / count(*),0),2)
as confirmation_rate
from Signups s   
left join  Confirmations c 
on s.user_id = c.user_id 
group by s.user_id 



