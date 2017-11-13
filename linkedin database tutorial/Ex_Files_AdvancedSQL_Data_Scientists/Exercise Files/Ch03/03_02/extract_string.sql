/* Use a string of 12 characters for experimenting with string extraction */
select
   'abcdefghijkl' test_string;

/* Extract the frist 3 characters of a string */
select
    substring('abcdefgh' from 1 for 3);

/* Select the first three characters of the string */
select
   substring('abcdefghijkl' from 1 for 3) test_string;

/* Select a subset from the middle of the string */
select
   substring('abcdefghijkl' from 5 for 3) test_string;

/* Select a substring starting in the middle and going for the lenght of the string */
select
   substring('abcdefghijkl' from 5) test_string;


/* Select Assistant job tiltles, and extract the main job category */
select
   job_title, substring(job_title from 10) asst_category
from
   staff
where
   job_title like 'Assistant%';


/* Replace a substring with another string using overlay */
select
   overlay('abcdefghijkl' placing 'CDEF' from 3 for 4);


/* Change Assistant to Asst in job title */
select
   job_title, overlay(job_title placing 'Asst. ' from 1 for 10)
from
   staff
where
   job_title like 'Assistant%';


/* Select staff wtih job titles that start with Assistant */
select
    job_title, position('Assistant' in job_title)
from
    staff
where
    job_title like '%Assistant%';

/* Replace a substring with another string using overlay */
select
   overlay('abcdefghijkl' placing 'CDEF' from 3 for 4);


/* Change Assistant to Asst in job title */

select
    job_title, overlay(job_title placing 'Asst. ' from position('Assistant' in job_title) for 10)
from
    staff
where
    job_title like '%Assistant%';
