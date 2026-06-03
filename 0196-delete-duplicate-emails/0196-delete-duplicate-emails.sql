# Write your MySQL query statement below
/* delete from person 
where id in 
(select id from (select id,
row_number() over (partition by email order by id asc) as rn
from person) t
where rn > 1);
*/
delete p1
from person p1
join person p2 
on p1.email=p2.email
and p1.id>p2.id; 