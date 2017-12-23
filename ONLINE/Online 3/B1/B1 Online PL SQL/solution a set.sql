1. CREATE OR REPLACE FUNCTION default_working_project (MID IN VARCHAR2)
RETURN VARCHAR2 IS

MSG VARCHAR2(100) ;
AVGSAL NUMBER;
BEGIN
select avg(salary) INTO AVGSAL
FROM EMP
GROUP BY MANAGER_ID
HAVING MANAGER_ID=MID;
IF  AVGSAL>10000 THEN
MSG:='GRAND';
ELSIF AVGSAL>8000 AND AVGSAL<10000 THEN
MSG:='MEDIUM';
ELSE
MSG:='SMALL';
END IF;

RETURN MSG ;
EXCEPTION
--you must return value from this section also
WHEN NO_DATA_FOUND THEN
RETURN 'No manager' ;
END ;
/
2. CREATE OR REPLACE FUNCTION default_salary  (MID IN VARCHAR2,Wproject IN VARCHAR2)
RETURN VARCHAR2 IS

MSG VARCHAR2(100) ;
SAL NUMBER;
BEGIN
IF Wproject IS NULL THEN
MSG:=default_working_project(MID);
END IF;
IF MSG ='GRAND' THEN
SAL:=15000;
ELSIF MSG = 'MEDIUM' THEN
SAL:=9000;
ELSE
SAL:=5000;
END IF;
RETURN SAL ;
END ;
/
3.
CREATE OR REPLACE TRIGGER check_entry
BEFORE INSERT
ON EMP
FOR EACH ROW
DECLARE
CO number;
BEGIN
select count(*) into CO
from EMP
WHERE MANAGER_ID= :new.MANAGER_ID
GROUP BY MANAGER_ID;
IF  :new.salary is Null THEN
 :new.SALARY := default_salary (:new.manager_id,:new.working_project);
ELSIF :new.salary is not Null THEN
:new.working_project :=default_working_project (:new.manager_id);
ELSE
DBMS_OUTPUT.PUT_LINE('no change');
END IF;
EXCEPTION
--you must return value from this section also
WHEN NO_DATA_FOUND THEN
 DBMS_OUTPUT.PUT_LINE('DO NOTHING');
END ;
/
