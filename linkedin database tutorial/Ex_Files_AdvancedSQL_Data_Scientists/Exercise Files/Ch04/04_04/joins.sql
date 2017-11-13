/* Select all columns in the company_division table to review contents of the table */
select
  *
from
  company_divisions;


/* And get a count to understand the size of the table */
select
  count(*)
from
  company_divisions;


/* Join staff and department. If the staff department is not found in */
/* company_divisions, then no row will be returned. */
select
   s.last_name, s.department, cd.company_division
from
   staff s
join
   company_divisions cd
on
   s.department = cd.department;

/* The previous query did not return 1,000 rows. What rows are missing? */
select distinct
   department
from
   staff
where
   department not in
     (select
         department
      from
         company_divisions);

/* Use an outer join to return all rows, even it a corresponding row in */
/* company_divsion does not exist. */

select
   s.last_name, s.department, cd.company_division
from
   staff s
left join
   company_divisions cd
on
   s.department = cd.department;

/* This will generate an ERROR */
/* Perform 3 table join without alias to generate error */
/* Since department occurs in both staff and company_divisions */
/* we need to use an alias to specify which table should be use */
select
  last_name, department, company_division, company_region
from
   staff s
join
   company_divisions cd
on
   s.department = cd.department
join
   company_regions cr
on
   s.region_id = cr.region_id;




/* ... now wiht alias, and there is no error */
select
  s.last_name, s.department, cd.company_division, cr.company_region
from
   staff s
join
   company_divisions cd
on
   s.department = cd.department
join
   company_regions cr
on
   s.region_id = cr.region_id;

   
