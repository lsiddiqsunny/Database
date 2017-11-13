/* Select individual salary and average department salary */
select
   department,
   last_name,
   salary,
   avg(salary) over (partition by department)
from
   staff;

/* Use a windowing operation with a different aggregate function */
select
   department,
   last_name,
   salary,
   max(salary) over (partition by department)
from
   staff;

/* Use a windowing operation with a different aggregate function and different grouping */
select
   company_region,
   last_name,
   salary,
   min(salary) over (partition by company_region)
from
   staff_div_reg;


/* Order results and include the relative rank by row */
select
   department,
   last_name,
   salary,
   rank() over (partition by department order by salary desc)
from
   staff;


/* Select a set of attributes grouped by department, include the first value by department in each row */
select
   department,
   last_name,
   salary,
   first_value(salary) over (partition by department order by salary desc)
from
   staff;

/* Window functions can be used to add ranked row numbers */
select
   company_division,
   last_name,
   salary,
   row_number()  over (partition by company_division order by salary asc)
from
   staff_div_reg;
  
