/* Show the first 10 rows of the staff table */
select * from staff limit 10;

/* Sum the total amount of salary paid to staff */
select sum(salary) from staff;

/* Sum the total amount of salary paid to staff by department */
select
  department, sum(salary)
from
   staff
group by
    department;

/* Sum the total, and average (or mean) amount of salary paid to staff by department */
select
  department, sum(salary), avg(salary)
from
   staff
group by
    department;

/* Sum the total, average (or mean) and variance of salary paid to staff by department */
select
  department, sum(salary), avg(salary), var_pop(salary)
from
   staff
group by
    department;

/* Sum the total, average (or mean), variance and standard deviation of salary paid to staff by department */
select
  department, sum(salary), avg(salary), var_pop(salary), stddev_pop(salary)
from
   staff
group by
    department;

/* Use round function to round to 2 decimal places */
select
  department, sum(salary), avg(salary), round(var_pop(salary),2), round(stddev_pop(salary),2)
from
   staff
group by
    department;
