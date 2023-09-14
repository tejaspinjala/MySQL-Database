use university;
insert into classification
	values	(1, 'Freshman'),
			(2, 'Sophomore'),
            (3, 'Junior'),
            (4, 'Senior');

select * from classification order by class;
select count(*) from classification;

insert into department 
	values 	('CS', 'Computer Science'),
			('Math', 'Mathematical Science');
            
select * from department order by name;
select count(*) from department;
            
alter table employee modify bdate date null;

insert into employee 
		values 	('Professor', null, 'King', 1, null, null, 'M', null, null, 'Math'),
				('Professor', null, 'Anderson', 2, null, null, 'F', null, null, 'CS'),
				('Professor', null, 'Knuth', 3, null, null, 'M', null, 2, 'CS'),
				('Professor', null, 'Chang', 4, null, null, 'M', null, 1, 'Math'),
				('Professor', null, 'Stone', 5, null, null, 'F', null, 2, 'CS');

select * from employee order by lname;
select count(*) from employee;
select department, count(*) from employee group by department;

insert into course
		values 	('Intro to Computer Science', 'CS1310', 4, 'CS'),
				('Data Structures', 'CS3320', 4, 'CS'),
				('Discrete Mathematics', 'Math2410', 3, 'Math'),
				('Database Management', 'CS3380', 3, 'CS');
                
insert into course
		values 	('Intro to Computer Science II', 'CS1311', 4, 'CSX');

alter table course modify course_name varchar(50);

insert into course
		values 	('Intro to Computer Science II', 'CS1311', 4, 'CSX');
        
## Error Code: 1452. Cannot add or update a child row: 
## a foreign key constraint fails (`university`.`course`, CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Department`) REFERENCES `department` (`Name`))
insert into course
		values 	('Intro to Computer Science II', 'CS1311', 4, 'CS');

select * from information_schema.columns where table_schema = 'university' and table_name = 'section';
select * from employee;

insert into section
		values	(85, 'Math2410', 'Fall', '07', '1'),
				(92, 'CS1310', 'Fall', '07', '2'),
				(102, 'CS3320', 'Spring', '08', '3'),
				(112, 'Math2410', 'Fall', '08', '4'),
				(119, 'CS1310', 'Fall', '08', '2'),
				(135, 'CS3380', 'Fall', '08', '5');
			
insert into student
		values	('Smith', 17, 1, 'CS'),
				('Brown', 8, 2, 'CS');
                
insert into grade_report
		values	(17, 112, 'B'),
				(17, 119, 'C'),
				(8, 85, 'A'),
				(8, 92, 'A'),
				(8, 102, 'B'),
				(8, 135, 'A');
                
insert into prerequisite 
		values 	('CS3380', 'CS3320'),
				('CS3380', 'Math2410'),
				('CS3320', 'CS1310');
                