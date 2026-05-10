# Write your MySQL query statement below


with cte as(
    select *,sum(amount) as c_sum from Customer 
    group by visited_on
)
select visited_on , 
        sum(c_sum) over( order by visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as amount , 
    round(
        avg(c_sum) over( order by visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
    ,2) as average_amount
from cte limit 1000 offset 6;
-- select * from cte;