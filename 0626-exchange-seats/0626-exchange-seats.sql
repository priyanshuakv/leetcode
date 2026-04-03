# Write your MySQL query statement below
-- select 
--     case  
--         when id %2 = 0 then id - 1
--         when id = (select max(id) from seat)   then id
--     else id + 1
--     end as id,
-- student from seat 
-- order by id asc;
select id, 
case 
    when id % 2= 1 then coalesce(lead(student) over(order by id ), student)
    else lag(student) over (order by id)
    end as student 
from seat;