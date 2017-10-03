# Solution set A
<ol type= '1'>
<li>SELECT FIRST_NAME<br>
FROM EMPLOYEES<br>
WHERE SUBSTR(FIRST_NAME,2,1)<>'a' and SUBSTR(FIRST_NAME,2,1)<>'e' and SUBSTR(FIRST_NAME,2,1)<>'i' and<br> SUBSTR(FIRST_NAME,2,1)<>'o' and SUBSTR(FIRST_NAME,2,1)<>'u';</li>
<li>select (FIRST_NAME||' '||LAST_NAME) NAME,HIRE_DATE<br>
FROM EMPLOYEES<br>
WHERE UPPER(FIRST_NAME) NOT LIKE '%A%' AND LAST_NAME NOT LIKE '%m%' OR HIRE_DATE > 	TO_DATE ('03-OCT-2003', 'DD-MON-YYYY');</li>
<li> SELECT department_id,job_id,min(hire_date),max(hire_date),avg(salary)<br>
from employees<br>
group by DEPARTMENT_ID,JOB_ID<br>
having avg(salary)>6000 AND DEPARTMENT_ID IS NOT NULL AND JOB_ID IS NOT NULL;
<br></li>
<li>SELECT COUNTRY_ID,COUNT(CITY)<br>
from LOCATIONS <br>
GROUP BY COUNTRY_ID<br>
order by COUNTRY_ID;</li>
<li>SELECT REGION_ID,COUNTRY_NAME<br>
FROM COUNTRIES<br>
WHERE LENGTH(COUNTRY_NAME)>8;<br></li>
</ol>
