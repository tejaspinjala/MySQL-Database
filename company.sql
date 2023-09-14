use company;

create table employee 
	(	ssn				char(9),
		fname			varchar(15)	not null,
		lname			varchar(25) not null,
		bdate			date,
		salary			decimal(10,2),
		super_ssn		char(9),
		dno				int			not null default 1
	)


create table department
	(	dno				int,
		dname			varchar(25) not null,
		mgr_ssn			char(9),
		mgr_start_date	date
	)

create table dept_location
	(	dno				int,
		location		varchar(15)
	)
    
create table project
	(	pno				int,
		name			varchar(25) not null,
        location		varchar(25),
        dno				int not null
	)
    
create table works_on
	(	essn			char(9),
		pno				int,
        hours			decimal(3,1) not null
	)
    
create table dependent
	(	essn			char(9) not null,
		name			varchar(25) not null,
        gender			char(1),
        bdate			date,
        relationship	varchar(10)
	)










