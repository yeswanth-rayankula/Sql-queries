WITH t1 AS
(
    SELECT request_at, COUNT(*) AS total
    FROM trips t
    JOIN users c
        ON t.client_id = c.users_id
    JOIN users d
        ON t.driver_id = d.users_id
    WHERE c.banned = 'No'
      AND d.banned = 'No'
      AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
    GROUP BY request_at
),

t2 AS
(
    SELECT request_at, COUNT(*) AS dividend
    FROM trips t
    JOIN users c
        ON t.client_id = c.users_id
    JOIN users d
        ON t.driver_id = d.users_id
    WHERE c.banned = 'No'
      AND d.banned = 'No'
      AND t.status IN ('cancelled_by_driver', 'cancelled_by_client')
      AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
    GROUP BY request_at
)

SELECT 
    t1.request_at AS Day,
    ROUND(IFNULL(t2.dividend,0) / t1.total, 2) AS `Cancellation Rate`
FROM t1
LEFT JOIN t2
ON t1.request_at = t2.request_at;