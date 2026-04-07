# Write your MySQL query statement below
select s.user_id, round(ifnull(sum(c.action= 'confirmed')/count(c.action),0), 2) as confirmation_rate
 from signups s left join confirmations c 
on s.user_id = c.user_id 
group by user_id;  
