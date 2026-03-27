select df as Department , name as Employee, salary as Salary
from (
        select d.name as df, e.name, e.salary ,
        dense_rank() over (partition by e.departmentId order by e.salary desc) as ran
        from employee as e
        left join department as d on e.departmentId = d.id
    ) 
as temp where ran<=3 order by salary;
