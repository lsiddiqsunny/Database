1.
CREATE OR REPLACE TRIGGER Updaterating
BEFORE INSERT
ON REVIEW
FOR EACH ROW
DECLARE
CO number;
Total Number;
BEGIN
CO:=1;
Total:= :NEW.RATING;
FOR R IN (SELECT RATING FROM REVIEW WHERE BOOK_ID= :NEW.BOOK_ID)
LOOP
CO :=CO+1;
Total:= Total+R.Rating;
END LOOP;
Update Book
Set Rating=(Total/CO)
Where Book_id= :NEW.BOOK_ID;
END ;
/
2.
CREATE OR REPLACE TRIGGER Updatestatus
AFTER INSERT
ON CUSTOMER_PURCHASE
FOR EACH ROW
DECLARE
BEGIN
UPDATE CUSTOMER_ORDER
SET STATUS=1
WHERE ORDER_ID= :NEW.ORDER_ID;
END ;
/

3.
CREATE OR REPLACE TRIGGER Updatebookamount
AFTER INSERT
ON CUSTOMER_ORDER
FOR EACH ROW
DECLARE

BEGIN
UPDATE BOOK
SET TOTAL_IN_STORAGE=TOTAL_IN_STORAGE- :NEW.AMOUNT
WHERE BOOK_ID= :NEW.BOOK_ID;
UPDATE BOOK
SET TOTAL_SOLD=TOTAL_SOLD+ :NEW.AMOUNT
WHERE BOOK_ID= :NEW.BOOK_ID;
END ;
/
4.

CREATE OR REPLACE TRIGGER NoticeAll
BEFORE INSERT
ON Notice
FOR EACH ROW
DECLARE

BEGIN
IF :NEW.JOB_ID IS NULL THEN
FOR R IN (select distinct JOB_ID from employee e where manager_id= :NEW.GIVENBY)
LOOP
INSERT INTO NOTICE VALUES((SELECT COUNT(*) FROM NOTICE)+1,:NEW.NOTICE,SYSDATE,:NEW.GIVENBY,:NEW.BRANCH_ID,R.JOB_ID,1);
END LOOP;
END IF;

END ;
/

5.



CREATE OR REPLACE TRIGGER notification_after_order
AFTER UPDATE
   ON CUSTOMER_ORDER
   FOR EACH ROW

DECLARE


BEGIN

IF :OLD.ASSIGNEDTO IS NULL AND :OLD.STATUS=1 THEN
   INSERT INTO NOTIFICATION
   VALUES
   ( (SELECT COUNT(*) FROM NOTIFICATION)+1,
     'Your purchase order is assigned to our supplier.You will recieve your product soon.Thank You.',
     (SELECT MANAGER_ID FROM EMPLOYEE WHERE EMPLOYEE_ID=:new.ASSIGNEDTO),
     :NEW.CUSTOMER_ID,
     NULL,
     NULL,
     SYSDATE,
     1);
 ELSIF :OLD.STATUS=2 THEN
   INSERT INTO NOTIFICATION
   VALUES
   ( (SELECT COUNT(*) FROM NOTIFICATION)+1,
     'You have recieved your book. If it is not true please connect with our helpline: 123. Thank You.',
     (SELECT MANAGER_ID FROM EMPLOYEE WHERE EMPLOYEE_ID=:new.ASSIGNEDTO),
     :NEW.CUSTOMER_ID,
     NULL,
     NULL,
     SYSDATE,
     1);

END IF;
END;

/

6.
CREATE OR REPLACE TRIGGER notification_after_update_book
AFTER UPDATE ON BOOK FOR EACH ROW

BEGIN
IF :OLD.PRICE<>:NEW.PRICE THEN
INSERT INTO NOTIFICATION VALUES
((SELECT COUNT(*) FROM NOTIFICATION)+1,'The Price of the book is Updated',
(select e.employee_id from employee e where e.book_storage_id=:NEW.storage_id), null, null, :NEW.PUBLISHER_ID, SYSDATE,1);
END IF;
END;
/
7.
CREATE OR REPLACE TRIGGER notification_after_insert_book
AFTER INSERT ON BOOK FOR EACH ROW

BEGIN
INSERT INTO NOTIFICATION VALUES
((SELECT COUNT(*) FROM NOTIFICATION)+1,'The Price of the book is inserted',
(select e.employee_id from employee e where e.book_storage_id=:NEW.storage_id), null, null, :NEW.PUBLISHER_ID, SYSDATE,1);

END;

8.
CREATE OR REPLACE TRIGGER notification_before_publisher_transaction
AFTER UPDATE
   ON Bookrequest
   FOR EACH ROW

DECLARE


BEGIN

IF :OLD.STATUES=1 THEN
   INSERT INTO NOTIFICATION
   VALUES
   ( (SELECT COUNT(*) FROM NOTIFICATION)+1,
       'The order is assigned to our agent.You will be paid  soon.Thank You.',
     null,
     null,
     NULL,
    :OLD.publisher_id,
     SYSDATE,
     1);


END IF;
END;
9.

CREATE OR REPLACE TRIGGER notification_after_publisher_transaction
AFTER UPDATE
   ON PUBLISHER_TRANSACTION
   FOR EACH ROW

DECLARE


BEGIN

IF :OLD.STATUS=0 THEN
   INSERT INTO NOTIFICATION
   VALUES
   ( (SELECT COUNT(*) FROM NOTIFICATION)+1,
       'You are paid and recieved books.If it is an error,please call our help center-123.Thank You',
     :old.assignedto,
     null,
     NULL,
    :OLD.publisher_id,
     SYSDATE,
     1);


END IF;
END;
