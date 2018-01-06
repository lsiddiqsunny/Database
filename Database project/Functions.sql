1.
create or replace FUNCTION GET_AUTHOR_NAME(EID IN VARCHAR2)
RETURN VARCHAR2 IS
MSG VARCHAR2(100) ;
COUNTER NUMBER;
BEGIN
MSG:='';
COUNTER:=0;
FOR R IN (Select AUTHOR_NAME from AUTHOR WHERE BOOK_ID=EID)
LOOP
COUNTER:=COUNTER+1;
IF COUNTER>1 THEN
MSG:=MSG||',';
END IF;
MSG:=MSG||R.AUTHOR_NAME;
END LOOP ;
RETURN MSG ;
END;

2.

create or replace FUNCTION GET_STATUS(EID IN VARCHAR2)
RETURN VARCHAR2 IS
MSG VARCHAR2(100) ;
BEGIN
IF EID=0 THEN
MSG:='UNPAID';
ELSIF EID=1 THEN
MSG:='DUE';
ELSIF EID=2 THEN
MSG:='ASSIGNED';
ELSE
MSG:='PAID';
END IF;
RETURN MSG;
END;
/

3.
create or replace FUNCTION ENOUGH_IN_STORE(EID IN NUMBER,BID IN VARCHAR2)
RETURN VARCHAR2 IS
MSG VARCHAR2(100) ;
CO NUMBER;
BEGIN
SELECT TOTAL_IN_STORAGE INTO CO
FROM BOOK B
WHERE B.BOOK_ID=BID;
IF EID>CO THEN
MSG:='N';
ELSE
MSG:='Y';
END IF;
RETURN MSG;
END;
/

4.
create or replace FUNCTION GET_STATUS_EDIT(EID IN VARCHAR2)
RETURN VARCHAR2 IS
MSG VARCHAR2(100) ;
BEGIN
IF EID=0 THEN
MSG:='IN QUEUE';
ELSIF EID=1 THEN
MSG:='CONFIRMED';
ELSIf EID=2 THEN
MSG:='ASSIGNED';
ELSE
MSG:='PAID';
END IF;
RETURN MSG;
END;


5.
create or replace FUNCTION GET_STATUS_WORK(EID IN VARCHAR2)
RETURN VARCHAR2 IS
MSG VARCHAR2(100) ;
BEGIN
IF EID=0 THEN
MSG:='IN QUEUE';
ELSIF EID=1 THEN
MSG:='DONE';
ELSE
MSG:='CONFIRMED';
END IF;
RETURN MSG;
END;
6.
create or replace FUNCTION GET_STATUS_NOTICE(EID IN VARCHAR2)
RETURN VARCHAR2 IS
MSG VARCHAR2(100) ;
BEGIN
IF  EID=1 THEN
MSG:='ACTIVE';
ELSE
MSG:='INACTIVE';
END IF;
RETURN MSG;
END;

7.
create or replace FUNCTION GET_AMOUNT(EID IN NUMBER)
RETURN VARCHAR2 IS
Amount Number ;
COUNTER NUMBER;
BEGIN

Amount:=0;
FOR R IN (Select order_id from customer_purchase WHERE purchase_id=EID)
LOOP
 select o.amount into COUNTER
 from customer_order o
 where o.order_id=R.order_id;

Amount:= Amount+COUNTER;
END LOOP ;
RETURN Amount;
END;

8.

create or replace FUNCTION GET_Price(EID IN NUMBER)
RETURN VARCHAR2 IS
Amount Number ;
COUNTER NUMBER;
Price NUMBER;
BEGIN

Amount:=0;
FOR R IN (Select order_id from customer_purchase WHERE purchase_id=EID)
LOOP
select b.price-b.price*NVL(o.Applied_offer,0)*.01 into Price
from Book b,Customer_order o where o.book_id=b.book_id and o.order_id=R.order_id;


Amount:= Amount+Price;
END LOOP ;
RETURN Amount;
END;

9.
create or replace PROCEDURE SET_SUPPLIERANDSTATUS(EID IN INT,ID IN INT)
IS

BEGIN


FOR R IN (Select order_id from customer_purchase WHERE purchase_id=EID)
LOOP
UPDATE CUSTOMER_ORDER
SET ASSIGNEDTO=ID
WHERE ORDER_ID=R.ORDER_ID;
UPDATE CUSTOMER_ORDER
SET STATUS=2
WHERE ORDER_ID=R.ORDER_ID;
END LOOP ;

END;

10.
create or replace PROCEDURE SET_STATUS(EID IN INT)
IS

BEGIN
FOR R IN (Select order_id from customer_purchase WHERE purchase_id=EID)
LOOP
UPDATE CUSTOMER_ORDER
SET STATUS=2
WHERE ORDER_ID=R.ORDER_ID;
END LOOP ;

END;

11.

create or replace FUNCTION GET_NEW_AUTHOR_NAME(EID IN VARCHAR2)
RETURN VARCHAR2 IS
MSG VARCHAR2(100) ;
COUNTER NUMBER;
BEGIN
MSG:='';
COUNTER:=0;
FOR R IN (Select (select a.AUTHOR_NAME from authorlist a where a.listedauthorid=p.author_id) AUTHOR_NAME from PENDINGBOOKINSERT p WHERE p.PENDINGBOOKINSERTID=EID)
LOOP
COUNTER:=COUNTER+1;
IF COUNTER>1 THEN
MSG:=MSG||',';
END IF;
MSG:=MSG||R.AUTHOR_NAME;
END LOOP ;
RETURN MSG ;
END;
