Approach 1
select email from Person 
group by email having count(*)>=2


Approach 2
SELECT DISTINCT email
FROM (
    SELECT email,
           ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
    FROM Person
) t
WHERE rn > 1;