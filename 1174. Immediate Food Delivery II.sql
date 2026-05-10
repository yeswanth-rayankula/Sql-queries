# Write your MySQL query statement below

SELECT 
  Round(AVG(
    CASE 
        WHEN order_date = customer_pref_delivery_date 
            THEN 1 
            ELSE 0 
        END
    )*100,2) AS immediate_percentage
FROM
(
    SELECT delivery_id,order_date,customer_pref_delivery_date,
    RANK() OVER ( PARTITION BY customer_id  ORDER BY order_date ) AS rnk
    FROM delivery
) tnk
WHERE rnk = 1;
