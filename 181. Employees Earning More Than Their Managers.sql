Approach 1
select name as Employee from Employee as a where managerId in
(select id from Employee as b where a.managerId=b.id and a.salary>b.salary);


Approach 2
select a.name as Employee
from Employee a
join Employee b
on a.managerId = b.id
where a.salary > b.salary;