/* Start with a simple select statement */
select * from staff;


/* Show the number of rows in the table staff */
select count(*) from staff;

/* Show the number of staff members by gender */
select
   count(*)
from
   staff
group by
   gender;

/* Now, show the number of staff member by gender and include the name of the gender */
select
  gender, count(*)
from
   staff
group by
   gender;

/* Show the number of staff members in each department */
select
   department, count(*)
from
   staff
group by
   department;


/* Show the maximum salary of all staff member */
select
   max(salary)
from
   staff;

select
   min(salary)
from
   staff;


/* Show the minimum salary of all staff member */
select
   min(salary), max(salary)
from
   staff;


/* Show the minimum and maximum salary in each department */
select
   department, min(salary), max(salary)
from
   staff
group by
   department;

/* Show the minimum and maximum salary by gender */
select
   gender, min(salary), max(salary)
from
   staff
group by
   gender;
   
