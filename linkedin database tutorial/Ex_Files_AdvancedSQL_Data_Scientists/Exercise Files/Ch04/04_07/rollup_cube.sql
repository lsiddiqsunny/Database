
/* Review the columns available in staff_div_reg view */
select
  *
from
  staff_div_reg
limit
  10;

/* Select nubmer of employees by company_region and country */
select
   company_region, country, count(*)
from
   staff_div_reg
group by
   company_region, country
order by
   country, company_region


/* Use rollup operation on the group by clause to create hierarchical sums */
select
   company_region, country, count(*)
from
   staff_div_reg
group by
   rollup (country, company_region)
order by
   country, company_region


/* Use cube operation on the group by clause to create all possible combination of sets of grouping columns */
select
   company_division, company_region,  count(*)
from
   staff_div_reg
group by
   cube (company_division, company_region);
