use university;
set autocommit = 0;
select @@autocommit;
select * from information_schema.tables where table_schema = 'university';
select * from information_schema.columns where table_schema = 'university';

create table DEPARTMENT
	   ( Name				varchar(10),
	     Descr          	varchar(50) NOT NULL,
		 Primary Key (Name));
         
create table EMPLOYEE
	   ( Fname				varchar(10) Not Null,
	     Minit				char,
		 Lname				varchar(20)	Not Null,
		 SSN				char(9),
		 Bdate				Date		Not Null,
		 Address			varchar(38),
		 Gender				char(1),
		 Salary				Decimal(5),
		 super_ssn			Char(9),
		 Department 		varchar(10)	Not Null,
		 Primary Key (ssn),
		 Foreign Key (Department) references Department(Name));
         
select table_name, count(*)
	     from information_schema.columns 
		where table_schema = 'university'
		group by table_name;
        
create table classification
	   (class				int,
	    description			varchar(25) Not Null,
		primary key (class));

create table student
		( name				varchar(10)	Not null,
		  student_number	int,
		  class				int 		not null,
		  major				varchar(3)	not null,
		  primary key (student_number),
		  foreign key (class) references classification(class));
          
# increase the column size for major
alter table student modify major varchar(20);
# run 5

create table course 
		( course_name			varchar(25)	not null,
		  course_number			varchar(10),
		  credit_hours			int			not null,
		  department			varchar(10)	not null,
		  primary key (course_number),
		  foreign key (deparment) references department(name));
		
create table section 
		( section_identifier	int,
		  course_number			varchar(10)	not null,
		  semester				varchar(7)	not null,
		  year					varchar(3)	not null,
		  instructor			char(9)		not null,
		  primary key (section_identifier),
		  foreign key (course_number) references course(course_number),
		  foreign key (instructor) references employee(ssn));
          
create table grade_report
		( student_number		int 		not null,
		  section_identifier	int			not null,
		  grade					varchar(2)	not null,
		  primary key(student_number, section_identifier),
		  foreign key (student_number) references student(student_number),
		  foreign key (section_identifier) references section(section_identifier));
          
create table prerequisite
		(course_number			varchar(10)	not null,
		 prerequisite_number	varchar(10) not null,
		 primary key (course_number, prerequisite_number),
		 foreign key (course_number) references course(course_number),
		 foreign key (prerequisite_number) references course(course_number));
         
