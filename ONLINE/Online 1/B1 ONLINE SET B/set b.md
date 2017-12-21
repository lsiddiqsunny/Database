# Solution set B
<ol type= '1'>
<li>SELECT LAST_NAME<br>
FROM EMPLOYEES<br>
WHERE SUBSTR(LAST_NAME,2,1)='a' and SUBSTR(LAST_NAME,2,1)='e' and SUBSTR(LAST_NAME,2,1)='i' and<br> SUBSTR(LAST_NAME,2,1)='o' and SUBSTR(LAST_NAME,2,1)='u';</li>
<li>select (FIRST_NAME||' '||LAST_NAME) NAME,HIRE_DATE<br>
FROM EMPLOYEES<br>
WHERE (UPPER(FIRST_NAME) NOT LIKE '%I%' OR LAST_NAME NOT LIKE '%S%') AND HIRE_DATE > 	TO_DATE ('03-OCT-2003', 'DD-MON-YYYY');</li>
<li> SELECT department_id,min(hire_date),max(hire_date),avg(salary)<br>
from employees<br>
group by DEPARTMENT_ID<br>
having (avg(salary) BETWEEN 6000 AND 12000) AND DEPARTMENT_ID IS NOT NULL;
<br></li>
<li>SELECT LOCATION_ID,COUNT(* )<br>
from EMPLOYEES<br>
GROUP BY LOCATION_ID<br>
order by LOCATION_ID;</li>
<li>SELECT COUNTRY_ID,COUNTRY_NAME<br>
FROM COUNTRIES<br>
WHERE LENGTH(COUNTRY_NAME)>8;<br></li>
</ol>
