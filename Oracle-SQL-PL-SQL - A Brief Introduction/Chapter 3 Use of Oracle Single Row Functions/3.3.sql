# Solution 3.3
1.
SELECT FIRST_NAME,ROUND((SYSDATE-HIRE_DATE)/365,0) "NUMBER OF YEARS EMPLOYEED"
FROM EMPLOYEES;

2.
select last_name , abs ( round ( hire_date , 'month' ) - hire_date ) "First month work days"
 from employees; 
