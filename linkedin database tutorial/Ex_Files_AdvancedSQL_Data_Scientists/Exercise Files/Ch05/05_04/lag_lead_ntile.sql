
/*  Use lag to reference rows behind */
select
   department,
   salary,
   lag(salary) over (partition by department order by salary desc)
from
   staff

/* Use lead to reference rows ahead */
select
   department,
   salary,
   lead(salary) over (partition by department order by salary desc)
from
   staff

/* Use ntiles to assign "buckets" to rows */
/* Include quartiles in list of salaries by department */
select
   department,
   salary,
   ntile(4) over (partition by department order by salary desc) as quartile
from
   staff;
