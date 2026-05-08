
SELECT DISTINCT a.*
FROM stadium a
JOIN stadium b ON a.id = b.id - 1
JOIN stadium c ON b.id = c.id - 1
WHERE a.people >= 100
  AND b.people >= 100
  AND c.people >= 100

UNION

SELECT DISTINCT b.*
FROM stadium a
JOIN stadium b ON a.id = b.id - 1
JOIN stadium c ON b.id = c.id - 1
WHERE a.people >= 100
  AND b.people >= 100
  AND c.people >= 100

UNION

SELECT DISTINCT c.*
FROM stadium a
JOIN stadium b ON a.id = b.id - 1
JOIN stadium c ON b.id = c.id - 1
WHERE a.people >= 100
  AND b.people >= 100
  AND c.people >= 100

ORDER BY id;


