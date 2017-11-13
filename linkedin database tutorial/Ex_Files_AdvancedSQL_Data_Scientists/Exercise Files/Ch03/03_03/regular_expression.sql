/* Select list of unique job titles */
select distinct
    job_title
from
    staff;

/* Select lis of job titles that begin wiht Assistant */
select distinct
    job_title
from
    staff
where
   job_title like 'Assistant%';


/* Select a list of job titles that include Assistant I, II or III but not IV*/
/* | is the regular expression OR operator */
select distinct
    job_title
from
    staff
where
   job_title similar to '%Assistant%(I)*';


/* Select a list of job titles that include Assistant II or IV*/
/* | is the regular expression OR operator */
select distinct
    job_title
from
    staff
where
   job_title similar to '%Assistant%(II|IV)';



/* Select a list of job titles that include Assistant II, IV or any other 2 character starting with I */
/* | is the regular expression OR operator */
select distinct
    job_title
from
    staff
where
   job_title similar to '%Assistant I_';

/* Select a list of job titles that begin with E, P, or S */
/* |[] are used to list characters that can match */
select distinct
    job_title
from
    staff
where
   job_title similar to '[EPS]%';
