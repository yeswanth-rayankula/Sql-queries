# Write your MySQL query statement below




select Department, Employee, Salary from(
    select d.name as Department, e.name as Employee, 
        e.salary as Salary,
        max(e.salary) over (partition by e.departmentId) as emp_sal
    from employee e
    left join department d on e.departmentId = d.id
)temp
where Salary = emp_sal;
