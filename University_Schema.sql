use university;
set autocommit = 0;
select @@autocommit;
select * from information_schema.tables where table_schema = 'university';
select * from information_schema.columns where table_schema = 'university';

create table DEPARTMENT
(Name				varchar(10),
Descr				varchar(50) NOT NULL,
Primary Key (Name));

create table EMPLOYEE
(Fname				varchar(10) NOT NULL,
Minit				char,
Lname				varchar(20) NOT NULL,
SSN					char(9),
Bdate				Date		NOT NULL,
Address				varchar(38),
Gender				char(1),
Salary				Decimal(5),
Super_ssn			char(9),
Department			varchar(10)	NOT NULL,
Primary Key(SSN),
Foreign Key(Department) references Department(Name));

select table_name, count(*) 
	from information_schema.columns
    where table_schema = 'university'
    group by table_name;

create table Classification
(Class				int,
Description			varchar(25)	NOT NULL,
Primary Key(Class));

create table Student
(Name				varchar(10) NOT NULL,
Student_Number		int,
Class				int			NOT NULL,
Major				varchar(3)	NOT NULL,
Primary Key(Student_Number),
Foreign Key(class) references classification(Class));

# increase the column size for Major
alter table student modify major varchar(20);
# run line 5
commit;

create table Course
(Course_Name		varchar(25)	NOT NULL,
Course_Number		varchar(10),
Credit_Hours		int			NOT NULL,
Department			varchar(10)	NOT NULL,
Primary Key(Course_Number),
Foreign Key(Department) references department(Name));

#run 8
create table Section
(section_identifier	int,
course_number		varchar(10)	not null,
semester			varchar(7)	not null,
year				varchar(3)	not null,
instructor			char(9)		not null,
primary key(section_identifier),
foreign key(course_number) references course(course_number),
foreign key(instructor) references employee(ssn));

#run 8
create table grade_report
(student_number		int			not null,
section_identifier	int			not null,
grade				varchar(2)	not null,
primary key(student_number, section_identifier),
foreign key(student_number) references student(student_number),
foreign key(section_identifier) references section(section_identifier));

#run 8
create table prerequisite
(course_number			varchar(10)	not null,
prerequisite_number	varchar(10) not null,
primary key (course_number, prerequisite_number),
foreign key (course_number) references course(course_number),
foreign key (prerequisite_number) references course(course_number));

#run 4 -> 8 rows, 5 -> 32 rows, and 8 -> 8 rows


