

-- Approach 1
SELECT user_id, MAX(time_stamp) AS last_stamp
FROM logins
WHERE YEAR(time_stamp) = 2020
GROUP BY user_id;

-- Approach 2
SELECT user_id, time_stamp as last_stamp
FROM (
    SELECT user_id, time_stamp,
           ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY time_stamp DESC) AS rn
    FROM logins
    WHERE YEAR(time_stamp) = 2020
) t
WHERE rn = 1;