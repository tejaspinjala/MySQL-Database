show databases;
create database SemesterProject;
drop database SemesterProject;
use SemesterProject;

set autocommit = 0;
select @@autocommit;

create table ADDRESS
    (	Address_ID 		int not null,
		Address_Line_1 	varchar(255),
		Address_Line_2 	varchar(255),
		City 			varchar(255),
		State 			varchar(50),
		Zipcode 		int(5),
		PRIMARY KEY(Address_ID)
	);

create table DEPARTMENT
	(	Department_ID	int not null,
		Department_Name	varchar(25) not null,
        PRIMARY KEY(Department_ID)
    );

create table PERSON 
	(	Personal_ID		char(9) not null,
		Fname			varchar(15)	not null,
		Lname			varchar(25) not null,
		Age				int(2) not null,
		Gender			char(1),
		Pno				char(10),
        Address_ID 		int,
        PRIMARY KEY(Personal_ID),
        FOREIGN KEY (Address_ID) REFERENCES ADDRESS(Address_ID)
	);
    
create table EMPLOYEE
	(	Employee_ID		char(9) not null,
		Ranks			int,
        Title			varchar(15),
		Super_ID		char(9),
        Department_ID	int,
        PRIMARY KEY(Employee_ID),
        FOREIGN KEY(Employee_ID) references PERSON(Personal_ID),
        FOREIGN KEY(Super_ID) references EMPLOYEE(Employee_ID),
        FOREIGN KEY(Department_ID) references Department(Department_ID)
    );
    
create table EMPLOYEE_DEPARTMENT
    (	Employee_ID 	char(9) not null,
		Department_ID 	int not null,
		Start_Time 		timestamp,
		End_Time 		timestamp,
		PRIMARY KEY (Employee_ID, Department_ID, Start_Time),
		FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE(Employee_ID),
		FOREIGN KEY (Department_ID) REFERENCES DEPARTMENT(Department_ID)
	);

create table CUSTOMER
	(	Customer_ID		char(9) not null,
		Salesman_ID		char(9),
        PRIMARY KEY(Customer_ID),
        FOREIGN KEY(Customer_ID) references PERSON(Personal_ID),
        FOREIGN KEY(Salesman_ID) references EMPLOYEE(Employee_ID)
    );

create table POTENTIAL_EMPLOYEE
	(	Potential_Employee_ID		char(9) not null,
		FOREIGN KEY(Potential_Employee_ID) references PERSON(Personal_ID)
    );
    
create table JOB_POSITION
	(	Job_ID 			int not null,
		Job_Desc 		text,
		Job_pdate	 	date,
		Department_ID 	int,
		PRIMARY KEY(Job_ID),
		FOREIGN KEY(Department_ID) REFERENCES DEPARTMENT(Department_ID)
	);
    
create table INTERVIEW_DETAILS
	(	Interview_ID 	int not null,
		Candidate_ID 	char(9),
		Interviewer_ID 	char(9),
		Job_ID 			int,
		PRIMARY KEY(Interview_ID),
		FOREIGN KEY (Candidate_ID) REFERENCES PERSON(Personal_ID),
		FOREIGN KEY (Interviewer_ID) REFERENCES EMPLOYEE(Employee_ID),
		FOREIGN KEY (Job_ID) REFERENCES JOB_POSITION(Job_ID)
	);

create table INTERVIEW_ROUNDS
    (	Interview_ID 	int not null,
		Round_Number 	int not null,
		Grade 			int CHECK (Grade BETWEEN 0 AND 100),
		Pass_Round 		boolean,
		PRIMARY KEY(Interview_ID, Round_Number),
		FOREIGN KEY (Interview_ID) REFERENCES INTERVIEW_DETAILS(Interview_ID)
	);

CREATE TABLE SELECTED_CANDIDATES (
		Candidate_ID 	char(9) NOT NULL,
		Job_ID 			int,
		Email			varchar(255),
		PRIMARY KEY(Candidate_ID, Job_ID),
		FOREIGN KEY(Candidate_ID) REFERENCES INTERVIEW_DETAILS(Candidate_ID),
		FOREIGN KEY(Job_ID) REFERENCES JOB_POSITION(Job_ID)
	);

create table SALARY
    (Transaction_Number int,
		Employee_ID 	char(9),
		Pay_Date 		date,
		Amount 			decimal(10, 2),
		PRIMARY KEY (Transaction_Number, Employee_ID),
		FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE(Employee_ID)
	);
    
create table PRODUCT
    (	Product_ID 		int not null,
		Product_Type 	varchar(255),
		Size 			varchar(50),
		List_Price 		decimal(10, 2),
		Weight 			decimal(10, 2),
		Style 			varchar(50),
		PRIMARY KEY(Product_ID)
	);

create table MARKETING_SITE
    (	Site_ID 		int not null,
		Site_Name 		varchar(255),
		Site_Location 	varchar(255),
		PRIMARY KEY(Site_ID)
	);

create table SALE
	(	Sale_ID 		int not null,
		Salesman_ID 	char(9),
		Customer_ID 	char(9),
		Product_ID 		int,
		Sale_Time 		timestamp,
		Site_ID 		int,
        Quantity_Sold	int,
		PRIMARY KEY(Sale_ID),
		FOREIGN KEY (Salesman_ID) REFERENCES EMPLOYEE(Employee_ID),
		FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID),
		FOREIGN KEY (Product_ID) REFERENCES PRODUCT(Product_ID),
		FOREIGN KEY (Site_ID) REFERENCES MARKETING_SITE(Site_ID)
	);

create table SALESMAN_SITE
    (	Salesman_ID 	char(9) not null,
		Site_ID 		int not null,
		Start_Date 		date,
		End_Date 		date,
		PRIMARY KEY(Salesman_ID, Site_ID),
		FOREIGN KEY (Salesman_ID) REFERENCES EMPLOYEE(Employee_ID),
		FOREIGN KEY (Site_ID) REFERENCES MARKETING_SITE(Site_ID)
	);

create table VENDOR_ADDRESS
    (	Address_ID 		int not null,
		Address_Line_1 	varchar(255),
		Address_Line_2 	varchar(255),
		City 			varchar(255),
		State 			varchar(50),
		Zipcode 		int(5),
		PRIMARY KEY(Address_ID)
	);

create table VENDOR
    (	Vendor_ID 		int not null,
		Name 			varchar(255),
		Address_ID 		int,
		Account_Number 	varchar(50),
		Credit_Rating 	int,
		URL 			varchar(255),
		PRIMARY KEY(Vendor_ID),
		FOREIGN KEY (Address_ID) REFERENCES VENDOR_ADDRESS(Address_ID)
	);
    
create table PART_TYPE
    (	Part_Type_ID 	int not null,
		Part_Type_Name 	varchar(255),
        Weight		decimal(10, 2),
		PRIMARY KEY(Part_Type_ID)
	);

create table VENDOR_PART
    (	Vendor_ID 		int not null,
		Part_Type_ID 	int not null,
		Price 			decimal(10, 2),
		PRIMARY KEY(Vendor_ID, Part_Type_ID),
		FOREIGN KEY (Vendor_ID) REFERENCES VENDOR(Vendor_ID),
		FOREIGN KEY (Part_Type_ID) REFERENCES PART_TYPE(Part_Type_ID)
	);

create table PRODUCT_PART 
    (	Product_ID 		int,
		Part_Type_ID 	int,
		Quantity 		int,
		PRIMARY KEY (Product_ID, Part_Type_ID),
		FOREIGN KEY (Product_ID) REFERENCES PRODUCT(Product_ID),
		FOREIGN KEY (Part_Type_ID) REFERENCES PART_TYPE(Part_Type_ID)
	);
    