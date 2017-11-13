/* List departments in each row */
select
   department
from
   staff;

/* List each department name once */
select distinct
  department
from
  staff;


/* Convert the names of departments to upper case */
select distinct
   upper(department)
from
   staff;

/* Convert the names of departments to lower case */
select distinct
  lower(department)
from
  staff;




/* Concatenate two character strings */
select
  job_title || '-' || department
from
  staff;

/* Use alias to rename concatenated column */
select
   job_title || '-' || department  title_dept
from
   staff;

select distinct
   job_title
from
  staff;

/* Concatenate two character strings */
select
   job_title || '-' || department
from
   staff;

/* Use alias to rename concatenated column */
select
   job_title || '-' || department  title_dept
from
   staff;

/* Use trim to remove trailing and leading spaces */
select
   trim('  Software Engineer  ');

/* Verify length of string with leading and trailing spaces */
select
  length('   Software Engineer   ');

/*  ... and now verify length is shorter when leading and trailing spaces are removed */
select
   length(trim('   Software Engineer   '));

/* Show all job titles that start wtih Assistant */
select
   job_title
from
   staff
where
  job_title like 'Assistant%'


/* Create a new boolean column indicating if a staff person has the term Assistant
  anywhere in their title.  */
select
   job_title, (job_title like '%Assistant%') is_asst
from
   staff;
