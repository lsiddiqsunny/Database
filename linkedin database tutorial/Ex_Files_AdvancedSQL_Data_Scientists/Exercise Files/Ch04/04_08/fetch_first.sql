/* Review a few columns from the staff table */
select
   last_name, job_title, salary
from
   staff;

/*  Use order by and fetch first to limit the number of rows returned */
select
   last_name, job_title, salary
from
   staff
order by
   salary desc
fetch first
   10 rows only;

/* Select a simple column - aggregrate combination */
select
   company_division, count(*)
from
   staff_div_reg
group by
   company_division;

/* Select with a sort order */
select
   company_division, count(*)
from
   staff_div_reg
group by
   company_division
order by
   count(*);

/* Set the sort order to descending */
select
   company_division, count(*)
from
   staff_div_reg
group by
   company_division
order by
   count(*) desc;

/* Use fetch first with order by to select top 5 divisions by staff count */
select
   company_division, count(*)
from
   staff_div_reg
group by
   company_division
order by
   count(*) desc
fetch first
   5 rows only;
