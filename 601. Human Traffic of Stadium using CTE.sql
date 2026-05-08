with CTE as (
    select *,
        id - ROW_NUMBER() over (order by id) as grp
    from stadium
    where people>=100
)

select id, visit_date, people from CTE
where grp in (select grp from CTE group by grp having count(*)>=3);