/* Select name, salary and department from staff table */
select
   last_name,
   salary,
   department
from
   staff;

/* Use an alias on table names so that one table can be queried in */
/* subqueries and top level queries */
select
   s1.last_name,
   s1.salary,
   s1.department
from
   staff s1;

/* Include department's average salary in each row with staff */
/* Use an alias on table names so that one table can be queried in */
/* subqueries and top level queries */
select
  s1.last_name,
  s1.salary,
  s1.department,
  (select round(avg(salary)) from staff s2 where s1.department = s2.department) dept_avg
from
  staff s1;

/* Select columns from a subquery instead of a table */
/* Find the average of executive salaries, defined as salaries > 100,000 */
select
   department,
   round(avg(salary))
from
    (select
         s2.department,
         s2.salary
     from
         staff s2
     where
         salary > 100000) s1
group by
    department;


/* Select the department that has the employee with the highest salary */
select
  s1.department
from
  staff s1
where
  (select max(salary) from staff s2) = salary;
