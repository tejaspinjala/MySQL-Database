use SemesterProject;

insert into ADDRESS (Address_ID, Address_Line_1, Address_Line_2, City, State, Zipcode) values
(3, '2073 Main Street', 'Apt 335', 'Chicago', 'CA', 38587),
(13, '7423 Main Street', 'Apt 169', 'Seattle', 'FL', 28867),
(18, '4552 Main Street', '', 'Seattle', 'TX', 43186),
(22, '3029 Main Street', 'Apt 363', 'Chicago', 'TX', 47726),
(26, '9198 Main Street', 'Apt 58', 'Houston', 'MA', 79064),
(27, '637 Main Street', '', 'Boston', 'CO', 38908),
(28, '8669 Main Street', '', 'Boston', 'TX', 49816),
(30, '1304 Main Street', 'Apt 195', 'San Francisco', 'NY', 76057),
(32, '2710 Main Street', '', 'Dallas', 'TX', 36514),
(43, '7358 Main Street', '', 'Chicago', 'WA', 80602),
(50, '899 Main Street', 'Apt 41', 'Seattle', 'MA', 33499),
(52, '2166 Main Street', '', 'Houston', 'CA', 93531),
(61, '6328 Main Street', 'Apt 102', 'Chicago', 'IL', 77198),
(67, '3674 Main Street', '', 'Miami', 'MA', 39471),
(81, '8263 Main Street', 'Apt 428', 'Miami', 'IL', 15301),
(85, '7303 Main Street', 'Apt 31', 'New York', 'IL', 43543),
(86, '3495 Main Street', '', 'San Francisco', 'TX', 10360),
(88, '8818 Main Street', '', 'Miami', 'NY', 23032),
(89, '633 Main Street', 'Apt 95', 'Chicago', 'WA', 66606),
(94, '5323 Main Street', '', 'Chicago', 'IL', 71896);

insert into DEPARTMENT values
(1, 'Sales'),
(2, 'Marketing'),
(3, 'Engineering'),
(4, 'HR'),
(5, 'Finance');

insert into PERSON (Personal_ID, Fname, Lname, Age, Gender, Pno, Address_ID) values 	
('209929522', 'Michael', 'Doe', 25, 'M', 6857433394, 67),
('122074499', 'John', 'White', 38, 'F', 809524189, 3),
('245874304', 'James', 'White', 28, 'F', 173402385, 22),
('325836101', 'John', 'Brown', 34, 'F', 246232180, 13),
('050680327', 'Laura', 'Brown', 50, 'M', 478580984, 50),
('708360317', 'James', 'Smith', 45, 'M', 191887766, 27),
('322293991', 'Sarah', 'Johnson', 34, 'M', 367267546, 94),
('914030895', 'James', 'Brown', 23, 'F', 986128686, 28),
('564853426', 'John', 'Taylor', 53, 'M', 294913565, 89),
('670101575', 'Chris', 'Brown', 51, 'F', 427577158, 18),
('894809846', 'James', 'Thomas', 22, 'M', 554651142, 86),
('175505138', 'John', 'Johnson', 31, 'F', 525044274, 85),
('942761895', 'James', 'Smith', 53, 'F', 944502801, 30),
('174494078', 'Chris', 'Smith', 31, 'F', 263999675, 88),
('665759324', 'David', 'Brown', 54, 'F', 792255720, 43),

('465544417', 'Ashley', 'White', 24, 'F', 167360916, 61),
('965785720', 'James', 'Lewis', 41, 'F', 916311165, 81),

('968338466', 'Sarah', 'Smith', 50, 'F', 892520803, 26),
('473016605', 'Emily', 'Davis', 46, 'M', 245450781, 52),
('911552968', 'Ashley', 'White', 52, 'F', 279316055, 32),
('923231421', 'Hellen', 'Cole', 20, 'F', 279316059, 32);

insert into EMPLOYEE values
('209929522', 6, 'CEO', NULL, 3),
('122074499', 9, 'Salesperson', '209929522', 5),
('245874304', 6, 'HR Specialist', '209929522', 2),
('325836101', 10, 'Manager', '209929522', 5),
('050680327', 2, 'Salesperson', '209929522', 5),
('708360317', 3, 'Analyst', '325836101', 1),
('322293991', 7, 'Engineer', '209929522', 2),
('914030895', 7, 'Manager', '209929522', 5),
('564853426', 9, 'Manager', '209929522', 1),
('670101575', 3, 'Engineer', '325836101', 4),
('894809846', 9, 'HR Specialist', '209929522', 1),
('175505138', 10, 'Manager', '209929522', 5),
('942761895', 4, 'HR Specialist', '209929522', 5),
('174494078', 6, 'HR Specialist', '209929522', 3),
('665759324', 3, 'Salesperson', '209929522', 3);

INSERT INTO EMPLOYEE_DEPARTMENT (Employee_ID, Department_ID, Start_Time, End_Time) VALUES
('245874304', 1, '2020-01-01', '2020-12-31'),
('245874304', 2, '2021-01-01', '2021-12-31'),
('245874304', 3, '2022-01-01', '2022-12-31'),
('245874304', 4, '2020-01-01', '2020-12-31'),
('245874304', 5, '2021-01-01', '2021-12-31'),
('942761895', 2, '2020-01-01', '2021-12-31'),
('942761895', 3, '2022-01-01', '2022-12-31'),
('174494078', 1, '2020-01-01', '2022-12-31');

insert into CUSTOMER values
('465544417', '245874304'),
('965785720', '942761895');

insert into POTENTIAL_EMPLOYEE values
('968338466'),
('473016605'),
('911552968'),
('923231421');

insert into JOB_POSITION values
('11111', 'Software Developer Intern', '2011-03-01', 3),
('22222', 'Finance Analyst', '2011-01-19', 2),
('33333', 'Accountant', '2011-01-23', 2),
('4444', 'HR Specialist', '2023-08-03', 1),
('12345', 'Senior Engineer', '2022-08-03', 3); 

insert into INTERVIEW_DETAILS values
(123231421, '923231421', '174494078', '11111'),
(223231421, '911552968', '245874304', '22222'),
(332314214, '473016605', '174494078', '33333'),
(123412353, '923231421', '245874304', 4444),
(523412353, '670101575', '245874304', '12345');

insert into INTERVIEW_ROUNDS values 
(123412353, 1, 80, TRUE),
(123412353, 2, 70, TRUE),
(123412353, 3, 60, TRUE),
(123412353, 4, 40, FALSE),
(223231421, 1, 80, TRUE),
(223231421, 2, 70, TRUE),
(223231421, 3, 60, TRUE),
(223231421, 4, 40, FALSE),
(332314214, 1, 85, TRUE),
(332314214, 2, 75, TRUE),
(332314214, 3, 55, FALSE),
(332314214, 4, 45, FALSE);

INSERT INTO 	SELECTED_CANDIDATES (Candidate_ID, Job_ID)
	SELECT 		id.Candidate_ID, id.Job_ID
	FROM 		INTERVIEW_ROUNDS ir
	JOIN 		INTERVIEW_DETAILS id ON ir.Interview_ID = id.Interview_ID
	GROUP BY 	id.Candidate_ID, id.Job_ID
	HAVING 		SUM(ir.Pass_Round = TRUE) >= 3;

select * from selected_candidates;

INSERT INTO SALARY (Transaction_Number, Employee_ID, Pay_Date, Amount) VALUES
(1, '708360317', '2023-01-01', 5000.00),
(2, '708360317', '2023-02-01', 5200.00),
(3, '894809846', '2023-01-01', 4500.00),
(4, '894809846', '2023-02-01', 4600.00),
(5, '175505138', '2023-01-01', 6000.00),
(6, '175505138', '2023-02-01', 6100.00);

INSERT INTO PRODUCT (Product_ID, Product_Type, Size, List_Price, Weight, Style) values
(1, 'Laptop', 'Large', 1200.00, 2.35, 'Black'),
(2, 'Monitor', '16-inch', 250.00, 3.54, 'Black'),
(3, 'Pen', '', 2.00, 0.10, 'Blue');

INSERT INTO MARKETING_SITE (Site_ID, Site_Name, Site_location) values
(111, 'Facebook', 'Houston'),
(222, 'Amazon', 'California');

INSERT INTO SALE (Sale_ID, Salesman_ID, Customer_ID, Product_ID, Sale_time, Site_ID, Quantity_sold) values
(11, '245874304', '465544417', 1, '2023-08-07 12:00:00', 111, 6),
(22, '942761895', '965785720', 2, '2023-08-06 1:00:00', 222, 18),
(33, '245874304', '465544417', 1, '2011-03-07 12:00:00', 111, 3),
(44, '245874304', '465544417', 3, '2023-08-07 2:30:00', 111, 2),
(55, '122074499', '965785720', 3, '2023-08-07 2:00:00', 222, 4);

INSERT INTO SALESMAN_SITE (Salesman_ID, Site_ID, Start_Date, End_Date) VALUES
('245874304', 111, '2022-01-01', '2022-12-31'),
('942761895', 222, '2022-02-01', '2022-12-31'),
('174494078', 111, '2022-03-01', '2022-12-31');

INSERT INTO VENDOR_ADDRESS (Address_ID, Address_Line_1, Address_Line_2, City, State, Zipcode) VALUES 
(1, '123 Main St', '', 'New York', 'NY', '10001');

INSERT INTO VENDOR (Vendor_ID, Name, Address_ID, Account_Number, Credit_Rating, URL) VALUES 
(1, 'TechSupplier', 1, '123456789', 5, 'www.techsupplier.com');

INSERT INTO PART_TYPE (Part_Type_ID, Part_Type_Name, Weight) VALUES 
(1, 'CPU', 5.35),
(3, 'RAM', 1.20),
(4, 'SSD', 4.25),
(5, 'Cup', 2.50);

INSERT INTO VENDOR_PART (Vendor_ID, Part_Type_ID, Price) VALUES 
(1, 1, 100),
(1, 3, 80),
(1, 4, 65),
(1, 5, 65);

INSERT INTO PRODUCT_PART (Product_ID, Part_Type_ID, Quantity) VALUES 
(1, 1, 1),
(1, 3, 2),
(1, 4, 1);