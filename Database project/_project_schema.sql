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
Salary INT,
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
Location_id REFERENCES Location(Location_id),
Job_id REFERENCES Job(Job_id),
Book_storage_id REFERENCES Book_storage(Storage_id)
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
Commision Number(2,2),
Rating Number,
Total_in_storage INT,
Add_Date Date Default sysdate,
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



--Customer transaction
CREATE TABLE Customer_order(
Order_id INT PRIMARY KEY,
Time DATE,
Status INT,
Amount INT,
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
Birthday  date default sysdate,
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
CONSTRAINT CUSTOMER_PURCHASE_PK PRIMARY KEY (PURCHASE_ID,ORDER_ID)
);

--PUBLISHER PURCHASE
CREATE TABLE PUBLISHER_PURCHASE(
PURCHASE_ID  INT,
PUBLISHER_TRANSACTION_ID REFERENCES PUBLISHER_TRANSACTION(PUBLISHER_TRANSACTION_ID),
CONSTRAINT PUBLISHER_PURCHASE_PK PRIMARY KEY (PURCHASE_ID,PUBLISHER_TRANSACTION_ID)
);


--Offer_Details

CREATE TABLE Offer_Details(
Offer_Details_ID  INT,
Offer_Details VARCHAR2(1000) NOT NULL,
Offer_Start Date DEFAULT SYSDATE,
Offer_End Date DEFAULT  SYSDATE
);
