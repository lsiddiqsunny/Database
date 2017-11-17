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



--Employee
CREATE TABLE Employee(
Employee_id INT PRIMARY KEY,
Employee_name VARCHAR2(255),
Email VARCHAR2(255),
Phone_number VARCHAR2(30),
Password VARCHAR2(100),
Location_id REFERENCES Location(Location_id),
Job_id REFERENCES Job(Job_id)
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

--Book storage
CREATE TABLE Book_storage(
Storage_id INT PRIMARY KEY,
Book_Capacity INT,
Location_id REFERENCES Location(Location_id),
Employee_id REFERENCES Employee(Employee_id),
Branch_id REFERENCES Branch(Branch_id)
);


--Publisher
CREATE TABLE Publisher(
Publisher_id INT PRIMARY KEY,
Publisher_name VARCHAR2(255),
Location_id REFERENCES Location(Location_id)
);

--Book
CREATE TABLE Book(
Book_id INT PRIMARY KEY,
Book_name VARCHAR2(500),
Price Number,
Commision Number(2,2),
Total_in_storage INT,
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
