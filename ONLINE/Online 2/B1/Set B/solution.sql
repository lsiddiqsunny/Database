1.
SELECT L.CITY,COUNT(EMPLOYEE_ID)
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID
GROUP BY L.CITY
UNION
SELECT L.CITY,0
FROM LOCATIONS L
WHERE L.CITY not  in(
SELECT L.CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID
)
;

2.
SELECT L.CITY,COUNT(EMPLOYEE_ID)
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID RIGHT OUTER  JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID
GROUP BY L.CITY;

3.
SELECT E.LAST_NAME,E.DEPARTMENT_ID,E.SALARY,J.AVGSAL,J.CO
FROM EMPLOYEES E,(SELECT DEPARTMENT_ID,AVG(SALARY) AVGSAL,COUNT(*) CO FROM EMPLOYEES E GROUP BY DEPARTMENT_ID) J
WHERE E.DEPARTMENT_ID=J.DEPARTMENT_ID AND E.SALARY BETWEEN (J.AVGSAL-1000) AND (J.AVGSAL+1000);

4.
SELECT e.last_name
from employees e
where 3<=(SELECT count(*)
from employees e2
where e2.salary<e.salary and e.JOB_ID=e2.JOB_ID)
;