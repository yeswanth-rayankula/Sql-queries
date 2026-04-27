Approach ->1
select (
    select distinct salary 
    from Employee 
    order by salary desc
    limit 1 offset 1) 
as SecondHighestSalary;



Approach ->2
select max(salary) as SecondHighestSalary
from Employee 
where salary< (select max(salary) from Employee);



Approach ->3
SELECT MAX(salary) AS SecondHighestSalary
FROM (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS ranks
    FROM Employee
) t
WHERE ranks = 2;