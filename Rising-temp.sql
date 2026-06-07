Write a solution to find all dates' `id` with higher temperatures compared to its previous dates (yesterday).
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
