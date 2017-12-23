1.
SELECT E.LAST_NAME,E.DEPARTMENT_ID,E.SALARY,J.AVGSAL,J.CO
FROM EMPLOYEES E,(SELECT DEPARTMENT_ID,AVG(SALARY) AVGSAL,COUNT(*) CO FROM EMPLOYEES E GROUP BY DEPARTMENT_ID) J
WHERE E.DEPARTMENT_ID=J.DEPARTMENT_ID AND E.SALARY < J.AVGSAL;

2. select e.last_name,(select count(*) from employees e1 where e1.hire_date<e.hire_date) Before_the_employee,
(select count(*) from employees e1 where e1.hire_date>e.hire_date) After_the_employee
from employees e;

3.

4.
select e.last_name,e.salary
from employees e
where 4>=(
select count(*)
from employees e1
where e1.salary<e.salary
)
order by e.salary
;

5. SELECT E.LAST_NAME,E.SALARY
FROM EMPLOYEES E
where E.SALARY BETWEEN
((select avg(salary) from employees group by department_id having department_id=any
(select department_id from departments where department_name='IT'))-5000)
AND
((select avg(salary) from employees group by department_id
having department_id=any(select department_id from departments where department_name='IT'))
+5000);
