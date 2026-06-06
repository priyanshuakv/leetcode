# Write your MySQL query statement below
/* select  max(salary) as SecondHighestSalary 
from (select salary,
dense_rank() over ( order by salary desc) as rnk
from employee) t
where t.rnk = 2;
*/
select ( select distinct salary from 
employee 
order by salary desc 
limit 1 offset 1)
as secondHighestsalary;