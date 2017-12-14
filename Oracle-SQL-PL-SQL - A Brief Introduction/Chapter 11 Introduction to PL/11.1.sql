-- solution 11.1
1. DECLARE
JDATE DATE ;
YEARS NUMBER ;
BEGIN
--first retrieve hire_date and store the value into JDATE variable
SELECT HIRE_DATE INTO JDATE
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 10000 ;
--calculate years from the hire_date field
YEARS := (MONTHS_BETWEEN(SYSDATE, JDATE) / 12) ;
IF YEARS >= 10 THEN
DBMS_OUTPUT.PUT_LINE('The employee worked 10 years or more') ;
ELSE
DBMS_OUTPUT.PUT_LINE('The employee worked less than 10 years') ;
END IF ;
EXCEPTION
--handle exceptions one by one here
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Employee is not present in database.') ;
WHEN TOO_MANy_ROWS THEN
DBMS_OUTPUT.PUT_LINE('Too many rows found') ;
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('I dont know what happened!') ;
END ;
/
2. DECLARE
BEGIN
INSERT INTO COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID)
VALUES ( 'AR','Argentina',2);

EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
DBMS_OUTPUT.PUT_LINE('Duplicate value found') ;
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('I dont know what happened!') ;
END ;
/
