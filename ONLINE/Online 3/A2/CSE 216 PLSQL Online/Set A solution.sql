1.

CREATE OR REPLACE FUNCTION defaultCommissionPCT  (MID IN INT)
RETURN NUMBER IS
CMSNPCT NUMBER;
BEGIN
IF MID>=123 THEN
CMSNPCT :=.0001;
ELSIF MID>=110 AND MID<123 THEN
CMSNPCT:=.012;
ELSE
CMSNPCT:=.1;
END IF;
RETURN CMSNPCT;
EXCEPTION
--you must return value from this section also
WHEN NO_DATA_FOUND THEN
RETURN .1;
END ;

2.

CREATE OR REPLACE PROCEDURE changeAll IS
AVGVAL NUMBER;
BEGIN
FOR R IN (SELECT Manager_id,employee_id,commission_pct from emp)
LOOP
IF R.commission_pct is not null then
DBMS_OUTPUT.PUT_LINE('NO CHANGE') ;
ELSE
UPDATE EMP
SET COMMISSION_PCT=defaultCommissionPCT(R.Manager_id)
where employee_id=R.employee_id;
DBMS_OUTPUT.PUT_LINE('CHANGED') ;
END IF;

END LOOP ;
END ;

3.
CREATE OR REPLACE TRIGGER CheckConsistency
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
IF  :new.commission_pct is NULL THEN
 :new.COMMISSION_PCT := defaultCommissionPCT  (:new.manager_id);
ELSE
DBMS_OUTPUT.PUT_LINE('no change');
END IF;
EXCEPTION
--you must return value from this section also
WHEN NO_DATA_FOUND THEN
:new.COMMISSION_PCT :=.2;
END ;
/
