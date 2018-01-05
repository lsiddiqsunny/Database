--Location

CREATE TABLE Location(
Location_id INT PRIMARY KEY,
Street_address VARCHAR2(255),
Post_code INT,
City VARCHAR2(255)
);

--Department
CREATE TABLE Department(
Department_id INT PRIMARY KEY,
Department_name VARCHAR2(255)
);

--Job
CREATE TABLE Job(
Job_id INT PRIMARY KEY,
Job_name VARCHAR2(255),
Max_Salary NUMBER,
MIN_SALARY NUMBER,
Department_id REFERENCES Department(Department_id)
);

--Branch
CREATE TABLE Branch(
Branch_id INT PRIMARY KEY,
Branch_name VARCHAR2(255)
);


--Book storage
CREATE TABLE Book_storage(
Storage_id INT PRIMARY KEY,
Book_Capacity INT,
Location_id REFERENCES Location(Location_id),
Branch_id REFERENCES Branch(Branch_id)
);


--Employee
CREATE TABLE Employee(
Employee_id INT PRIMARY KEY,
Employee_name VARCHAR2(255),
Email VARCHAR2(255),
Phone_number VARCHAR2(30),
Password VARCHAR2(100),
Salary NUMBER,
Commission_pct number(2,2),
Location_id REFERENCES Location(Location_id),
Job_id REFERENCES Job(Job_id),
Book_storage_id REFERENCES Book_storage(Storage_id),
Join_date date default sysdate,
Branch_id REFERENCES Branch(Branch_id),
MANAGER_ID references Employee(EMPLOYEE_ID)
);

--Job history
CREATE TABLE Job_history(
Employee_id  REFERENCES Employee(Employee_id),
Start_date DATE DEFAULT SYSDATE,
End_date DATE DEFAULT SYSDATE,
Job_id  REFERENCES Job(Job_id),
Department_id  REFERENCES Department(Department_id),
Branch_id  REFERENCES Branch(Branch_id),
CONSTRAINT JOB_HSITORY_PK PRIMARY KEY (Employee_id,Job_id,Department_id,Branch_id)
);


--Transport
CREATE TABLE Transport(
Transport_id INT PRIMARY KEY,
License VARCHAR2(255),
Weight_Capacity INT,
Driver_id REFERENCES Employee(Employee_id),
Branch_id REFERENCES Branch(Branch_id)
);


--Publisher
CREATE TABLE Publisher(
Publisher_id INT PRIMARY KEY,
Publisher_name VARCHAR2(255),
Location_id REFERENCES Location(Location_id)
);
--Book_type
CREATE TABLE Book_type(
Book_type_id INT PRIMARY KEY,
Book_type_name VARCHAR2(255),
);
--Book
CREATE TABLE Book(
Book_id INT PRIMARY KEY,
Book_name VARCHAR2(500),
ISBN VARCHAR2(45),
Book_type_id REFERENCES Book_type(Book_type_id),
Price Number,
Rating Number,
Total_in_storage INT,
Add_Date Date Default sysdate,
Publisher_price number,
Publisher_id REFERENCES Publisher(Publisher_id),
Storage_id REFERENCES Book_storage(Storage_id)
);

--Publisher Transaction
CREATE TABLE Publisher_Transaction(
Publisher_Transaction_id INT PRIMARY KEY,
Amount INT,
Time Date,
Book_id REFERENCES book(Book_id),
Publisher_id REFERENCES Publisher(Publisher_id)
);

--Customer
CREATE TABLE Customer(
Customer_id INT PRIMARY KEY,
Customer_name VARCHAR2(255),
Email VARCHAR2(255),
Phone_number VARCHAR2(30),
Password VARCHAR2(100),
Location_id REFERENCES Location(Location_id),
Branch_id REFERENCES Branch(Branch_id)
);

--Offer_Details

CREATE TABLE Offer_Details(
Offer_Details_ID  INT,
Offer_Details VARCHAR2(1000) NOT NULL,
percentage NUMBER,
Offer_Start Date DEFAULT SYSDATE,
Offer_End Date DEFAULT  SYSDATE
);


--Customer transaction
CREATE TABLE Customer_order(
Order_id INT PRIMARY KEY,
Time DATE,
Status INT,
Amount INT,
Applied_offer REFERENCES Offer_Details(Offer_Details_ID),
Customer_id REFERENCES Customer(Customer_id),
Book_id REFERENCES Book(Book_id)
);

--Customer Review
CREATE TABLE Review(
Review_id INT PRIMARY KEY,
Time DATE,
Review VARCHAR2(1000),
Rating INT,
Customer_id REFERENCES Customer(Customer_id),
Book_id REFERENCES Book(Book_id)
);



--Office material
CREATE TABLE Office_material(
Material_id INT PRIMARY KEY,
Type VARCHAR2(100)
);

--Office material amount
CREATE TABLE material_amount(
Branch_id  REFERENCES Branch(Branch_id),
Material_id  REFERENCES Office_material(Material_id),
Amount INT,
CONSTRAINT material_amount_PK PRIMARY KEY (Branch_id,Material_id)

);

--Author
CREATE TABLE Author(
Author_id  INT not null,
Book_id  REFERENCES Book(Book_id) not null,
Author_name varchar2(100),
CONSTRAINT  Author_PK PRIMARY KEY (Author_id,Book_id)
);

--Working Details
CREATE TABLE Workinfo(
Work_id INT PRIMARY KEY,
Work_Order_Time DATE,
Work_Details VARCHAR2(1000),
Employee_id REFERENCES Employee(Employee_id),
OrderedBy REFERENCES Employee(Employee_id),
Work_Status INT DEFAULT 0
);

--CUSTOMER PURCHASE
CREATE TABLE CUSTOMER_PURCHASE(
PURCHASE_ID  INT,
ORDER_ID REFERENCES CUSTOMER_ORDER(ORDER_ID),
PURCHASE_TIME DATE,
CONSTRAINT CUSTOMER_PURCHASE_PK PRIMARY KEY (PURCHASE_ID,ORDER_ID)
);

--PUBLISHER PURCHASE
CREATE TABLE PUBLISHER_PURCHASE(
PURCHASE_ID  INT,
PUBLISHER_TRANSACTION_ID REFERENCES PUBLISHER_TRANSACTION(PUBLISHER_TRANSACTION_ID),
Total_Payment Number,
CONSTRAINT PUBLISHER_PURCHASE_PK PRIMARY KEY (PURCHASE_ID,PUBLISHER_TRANSACTION_ID)
);

--Pending Book Insert
CREATE TABLE PendingBookInsert(
PendingBookInsertId int,
Publisher_id References Publisher(Publisher_Id),
Book_name VARCHAR2(500),
ISBN VARCHAR2(45),
Book_type_id REFERENCES Book_type(Book_type_id),
Price Number,
Total_in_storage INT,
Status int default 0,
Author_id references authorlist(listedauthorid),
CONSTRAINT PendingBookInsert_PK PRIMARY KEY (PendingBookInsertId,Author_id)
);

--Pending Book Update
CREATE TABLE PendingBookUpdate(
PendingBookUpdate INT primary key,
Publisher_id REFERENCES Publisher(Publisher_id),
Book_id references Book(book_id),
Price Number,
Status int default 0
);

--Listed AUTHOR
CREATE TABLE AUTHORLIST(
LISTEDAUTHORID INT PRIMARY KEY,
AUTHOR_NAME VARCHAR2(100)
);

--Request for Book
CREATE TABLE BookRequest(
REQUEST_ID INT PRIMARY KEY,
EMPLOYEE_ID REFERENCES EMPLOYEE(EMPLOYEE_ID),
Book_id REFERENCES BOOK(BOOK_ID),
Publisher_id REFERENCES Publisher(Publisher_id),
Amount INT,
STATUES INT
);


--Notice
CREATE TABLE Notice(
Notice_id INT PRIMARY KEY,
Notice VARCHAR2(1000),
NOTICE_TIME DATE,
GivenBy REFERENCES EMPLOYEE(EMPLOYEE_ID),
BRANCH_ID REFERENCES BRANCH(BRANCH_ID),
JOB_ID REFERENCES JOB(JOB_ID)

);

-- Notification
CREATE TABLE Notification(
Notification_id INT PRIMARY KEY,
Notification_massage Varchar2(1000),
NotifiedBy  References EMPLOYEE (EMPLOYEE_ID),
NotifiedToCustomer References CUSTOMER(CUSTOMER_ID),
NOTIFIEDTOEMPLOYEE REFERENCES EMPLOYEE(EMPLOYEE_ID),
NOTIFIEDTOPUBLISHER REFERENCES PUBLISHER(PUBLISHER_ID),
NOTIFICATION_TIME DATE DEFAULT SYSDATE,
Status INT
);
