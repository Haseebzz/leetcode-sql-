--Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In othe
--r words, you need to determine the number of players who logged in on the day immediately following their initial login, and
--divide it by the number of total players.


WITH cte AS (
    SELECT *,
           MIN(event_date) OVER (
               PARTITION BY player_id
           ) AS min_date
    FROM Activity
)

SELECT
    ROUND(
        SUM(
            CASE
                WHEN event_date = DATE_ADD(min_date, INTERVAL 1 DAY)
                THEN 1
                ELSE 0
            END
        ) / COUNT(DISTINCT player_id),
        2
    ) AS fraction
FROM cte;
