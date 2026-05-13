WITH t1 AS (
    SELECT player_id,MIN(event_date) AS first_date
    FROM Activity GROUP BY player_id
),

t2 AS (
    SELECT COUNT(DISTINCT player_id) AS total_players FROM Activity
),

t3 AS (
    SELECT COUNT(DISTINCT a.player_id) AS consecutive_players
    FROM Activity a
    JOIN t1
    ON a.player_id = t1.player_id
    WHERE DATEDIFF(a.event_date, t1.first_date) = 1
)

SELECT ROUND(
    (SELECT consecutive_players FROM t3)  /
    (SELECT total_players FROM t2),
    2
) AS fraction;