/* Filter based on numeric values */
select
   last_name, department, salary
from
   staff
where
   salary > 100000;


/* Filter based on character values */
select
   last_name, department, salary
from
   staff
where
   department = 'Tools';



/* Filter based on multiple attributes, all filters must be met*/
select
   last_name, department, salary
from
   staff
where
   department = 'Tools'
and
   salary > 100000;

/* Filter based on multiple attributes, at least one filter must be met*/
select
   last_name, department, salary
from
   staff
where
   department = 'Tools'
or
   department = 'Books'


/* Filter based on patterns in character strings */
select
   department, sum(salary)
from
   staff
where
   department like 'B%'
group by
   department;


/* Filter based on patterns in character strings */
select
   department, sum(salary)
from
   staff
where
   department like 'Bo%'
group by
   department;


/* Filter based on patterns in character strings */
select
   department, sum(salary)
from
   staff
where
   department like 'B%y'
group by
   department;
