use company;

select * 
	from information_schema.table_constraints
    where constraint_schema = 'company'
    order by table_name

alter table Employee add CONSTRAINT EMPPK Primary Key (ssn);
alter table Employee add CONSTRAINT EMPSUPERFK foreign key (super_ssn)
			References Employee (ssn) on DELETE set Default on update cascade;
            
alter table Employee drop constraint EMPSUPERFK;

alter table Employee add CONSTRAINT EMPSUPERFK foreign key (super_ssn)
			References Employee (ssn) on DELETE set null on update cascade;
            
alter table department modify column mgr_ssn char(9) not null default '888665555';
alter table department add CONSTRAINT DEPTPK Primary Key (dno);
alter table department add CONSTRAINT DEPTSK UNIQUE (dname);
alter table department add CONSTRAINT DEPTMGRMGRFK Foreign Key (mgr_ssn)
			References Employee (ssn) on DELETE set Default on update cascade;

# ignore the warning for now

alter table employee add constraint EMPDEPTFK Foreign Key (dno)
			References Department (dno) on DELETE set default on update cascade;

# ignore the warning for now

alter table dept_location add constraint DEPTLOCPK Primary Key (dno, location);
alter table dept_location add constraint Foreign Key (dno) References department (dno) ;
			
# will come back on DELETE set null on update cascade;

select * 
	from information_schema.table_constraints
    where constraint_schema = 'company'
    order by table_name

select table_name, count(*) 
	from information_schema.table_constraints
    where constraint_schema = 'company'
    group by table_name
    order by table_name;

alter table dept_location drop constraint dept_location_ibfk_1;
alter table dept_location drop primary key;

select table_name, count(*) 
	from information_schema.columns
    where table_schema = 'company'
		and table_name = 'employee'
    group by table_name;
    
select *
	from information_schema.columns
    where table_schema = 'company'
		and table_name = 'works_on';


alter table employee add column mi char(1);
alter table employee add column address varchar(100);
alter table employee add column gender char(1);

alter table employee drop constraint EMPDEPTFK;

INSERT INTO EMPLOYEE (fname, mi, lname, ssn, bdate, address, gender, salary, super_ssn, dno)
VALUES		('James','E','Borg',888665555,'1937-11-10','450 Stone, Houston TX','M',55000,null,1);

INSERT INTO EMPLOYEE (fname, mi, lname, ssn, bdate, address, gender, salary, super_ssn, dno)
VALUES		('Franklin','T','Wong',333445555,'1965-12-08','638 Voss, Houston TX','M',40000,888665555,5);

INSERT INTO EMPLOYEE (fname, mi, lname, ssn, bdate, address, gender, salary, super_ssn, dno)
VALUES		('Jennifer','S','Wallace',987654321,'1941-06-20','291 Berry, Bellaire TX','F',43000,888665555,4);

INSERT INTO EMPLOYEE (fname, mi, lname, ssn, bdate, address, gender, salary, super_ssn, dno)
VALUES      ('John','B','Smith',123456789,'1965-01-09','731 Fondren, Houston TX','M',30000,333445555,5),
            ('Alicia','J','Zelaya',999887777,'1968-01-19','3321 Castle, Spring TX','F',25000,987654321,4),
            ('Ramesh','K','Narayan',666884444,'1962-09-15','975 Fire Oak, Humble TX','M',38000,333445555,5),
            ('Joyce','A','English',453453453,'1972-07-31','5631 Rice, Houston TX','F',25000,333445555,5),
            ('Ahmad','V','Jabbar',987987987,'1969-03-29','980 Dallas, Houston TX','M',25000,987654321,4);

select * from employee;
select count(*) from employee;
select count(*) from department;
alter table employee add constraint EMPDEPTFK Foreign Key (dno) References Department (dno);
alter table employee drop constraint EMPDEPTFK;

INSERT INTO EMPLOYEE (fname, mi, lname, ssn, bdate, address, gender, salary, super_ssn)
VALUES      ('Test','B','Smith',123456780,'1965-01-09','731 Fondren, Houston TX','M',30000,333445555);

delete from employee where ssn = 123456780;

alter table employee modify dno int not null default 1;


INSERT INTO DEPARTMENT (dname, dno, mgr_ssn, mgr_start_date)
VALUES      ('Research',5,333445555,'1988-05-22'),
            ('Administration',4,987654321,'1995-01-01'),
            ('Headquarters',1,888665555,'1981-06-19');

alter table PROJECT add constraint PROJDEPTFK Foreign Key (dno) References Department (dno);

delete from project;
INSERT INTO PROJECT (name, pno, location, dno)
VALUES      ('ProductX',1,'Bellaire',5),
            ('ProductY',2,'Sugarland',5),
            ('ProductZ',3,'Houston',5),
            ('Computerization',10,'Stafford',4),
            ('Reorganization',20,'Houston',1),
            ('Newbenefits',30,'Stafford',4);


alter table project add CONSTRAINT PROJPK Primary Key (pno);
alter table WORKS_ON add constraint WORKSONPROJECTFK Foreign Key (pno) References PROJECT (pno);

select * from works_on
INSERT INTO WORKS_ON
VALUES     (123456789,1,32.5),
           (123456789,2,7.5),
           (666884444,3,40.0),
           (453453453,1,20.0),
           (453453453,2,20.0),
           (333445555,2,10.0),
           (333445555,3,10.0),
           (333445555,10,10.0),
           (333445555,20,10.0),
           (999887777,30,30.0),
           (999887777,10,10.0),
           (987987987,10,35.0),
           (987987987,30,5.0),
           (987654321,30,20.0),
           (987654321,20,15.0),
           (888665555,20,16.0);

INSERT INTO DEPENDENT
VALUES      (333445555,'Alice','F','1986-04-04','Daughter'),
            (333445555,'Theodore','M','1983-10-25','Son'),
            (333445555,'Joy','F','1958-05-03','Spouse'),
            (987654321,'Abner','M','1942-02-28','Spouse'),
            (123456789,'Michael','M','1988-01-04','Son'),
            (123456789,'Alice','F','1988-12-30','Daughter'),
            (123456789,'Elizabeth','F','1967-05-05','Spouse');

alter table DEPT_LOCATION add constraint DEPTLDEPTFK Foreign Key (dno) References Department (dno);

INSERT INTO DEPT_LOCATION
VALUES      (1,'Houston'),
            (4,'Stafford'),
            (5,'Bellaire'),
            (5,'Sugarland'),
            (5,'Houston');

select count(*) from information_schema.tables where table_schema = 'company'; 				# 6
select count(*) from information_schema.columns where table_schema = 'company'; 			# 28
select count(*) from information_schema.table_constraints where table_schema = 'company';	# 11
# know this query
select table_name, constraint_type, count(*)
	from information_schema.table_constraints
    where table_schema = 'company'
    group by table_name, constraint_type
    order by table_name;
    
    # 10 rows

select *
	from information_schema.table_constraints
    where table_schema = 'company'
    order by table_name, constraint_type;

	# 11 rows

select table_name, constraint_type
	from information_schema.table_constraints
    where table_schema = 'company'
    order by table_name, constraint_type;

alter table DEPT_LOCATION drop constraint dept_location_ibfk_1;

select * 
	from information_schema.table_constraints_extensions
    where constraint_schema = 'company'

	# 12 rows
    
# know this
select constraint_name, column_name, table_name, referenced_table_name
	from information_schema.key_column_usage
    where constraint_schema = 'company'
		and referenced_table_name is not null
	order by table_name;
    # 6 rows
    
use university;
select * 
	from 	student s,
			classification c
    # 8 rows - cartesian product, not optimal

select * 
	from 	student s,
			classification c
	where 	s.class = c.class;
    
select COLUMN_NAME FROM  
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE  
CONSTRAINT_TYPE='PRIMARY KEY'   
