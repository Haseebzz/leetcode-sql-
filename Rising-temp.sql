--Write a solution to find all dates' `id` with higher temperatures compared to its previous dates (yesterday). 
--use lag window function to make a new row which gets previous row values of temperature and recordarte so we can compare and use where condition datediff.
SELECT id
FROM (
    SELECT
        id,
        recordDate,
        temperature,
        LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
        LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date
    FROM Weather
) x
WHERE temperature > prev_temp
  AND DATEDIFF(recordDate, prev_date) = 1;

--we can alternatively use a self join so for each row will map to all ids like a cartesian product and can perform the where clausee 
 select w1.id 
 from Weather w1 
 join Weather w2 
where datediff(w1.recordDate,w2.recordDate) = 1 
and w1.temperature > w2.temperature 

--
