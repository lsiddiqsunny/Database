/* List average salaries by department */
select
   department, avg(salary)
from
   staff
group by
    department;

/* Truncate decimal values toward zero */
select
   department, avg(salary), trunc(avg(salary))
from
   staff
group by
    department;

/* Truncate decimal values toward zero and round up when decimal portion > .5 */
select
   department, avg(salary), trunc(avg(salary)), round(avg(salary))
from
   staff
group by
    department;


/* Ceiling function returns smallest integer larger than it's input value */
select
   department, avg(salary), trunc(avg(salary)), ceil(avg(salary))
from
   staff
group by
    department;

/* Round can be used to round to a number of decimal places */
select
   department, avg(salary), round(avg(salary), 2)
from
   staff
group by
    department;

/* Trunc can be used to truncate to a number of decimal places */
select
   department, avg(salary), round(avg(salary), 2), trunc(avg(salary), 2)
from
   staff
group by
    department;

/* Both round and trunc can be used to truncate to a variable number of decimal places */
select
   department, avg(salary), round(avg(salary), 3), trunc(avg(salary), 4)
from
   staff
group by
    department;
