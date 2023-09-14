describe employee
alter table employee rename column mi to minit;

# Q0: retrive the birth date and address of the employee whose name is 'John B smith'. 1 rows
select 		bdate, address
	from	employee
    where	fname = 'John'
		and	minit = 'B'
        and lname = 'Smith'
        
# Q1: retireve the name and address of all employees who work for the 'research' department. 4 rows
select		fname, lname, address
	from 	employee e, department d
    where	d.dname = 'research'
		and	e.dno = d.dno;

# Q2: for every project located in 'stafford', list the project nu,ber, the controlling
# department number, and the department manager's last name, address and birth date. 2 rows
select		p.pno, p.dno, e.lname, e.address, e.bdate
	from	project p, department d, employee e
    where	p.dno = d.dno
		and	d.mgr_ssn = e.ssn
        and p.location = 'stafford';

# Q4A: make a list of all project numbers for projects that involve an employee whose last
# name is 'Smith', either as a worker or as a manager of the department that controls 
# the project. 2 rows
(select		distinct p.pno
	from 	project p, department d, employee e
    where	p.dno = d.dno
		and d.mgr_ssn = e.ssn
        and e.lname = 'Smith'
)
union
(select		distinct p.pno
	from	project p, works_on w, employee e
    where 	p.pno = w.pno
		and w.essn = e.ssn
        and e.lname = 'Smith'
)

# Q12: retrieve all employees whose address is in houston, texas.
select		fname, lname
	from	employee
    where	address like '%houston,tx%'

select		fname, lname
	from	employee
    where	address like '%houston tx%'

# Q13: show the resulting salaries if every employee working on the 'ProductX' project
# is given a 10% raise
select		e.fname, e.lname, 1.1 * e.salary as increased_sal
	from	employee as e, works_on as w, project as p
    where	e.ssn = w.essn
		and	w.pno = p.pno
        and p.name = 'ProductX'
        and p.name = 'ProductX'
        

# Q14: Retrieve all employees in department 5 whose salary is between $30,000 and $40,000
select *
	from	employee
    where	(salary between 30000 and 40000)select *
	from	employee
    where	(salary between 30000 and 40000)
		and dno = 5;
# the condition (salary between 30000 and 40000) in Q14 is equivalent to the condition
# ((Salary >= 30000) and (salary <= 40000))

# Q15: retireve a list of employees and the projects they are working on, ordered by department
# and, within each department, ordered alphabetically by last name, then first name
select		d.dno, e.lname, e.fname, p.name
	from	department as d, employee as e, works_on as w, project as p
    where	d.dno = e.dno
		and e.ssn = w.essn
        and w.pno = p.pno
	order by d.dname, e.lname, e.fname
    
select		d.dno, e.lname, e.fname, p.name
	from	department as d, employee as e, works_on as w, project as p
    where	d.dno = e.dno
		and e.ssn = w.essn
        and w.pno = p.pno
	order by d.dname desc, e.lname asc, e.fname

create table D5EMPS
(select 	e.*
	from	employee as e
    where	e.dno = 5)
commit


select		*
	from 	employee
    where	lname = 'smith'
# 1 row
   
select count(*) from employee
# 8 rows

select @@autocommit;
set autocommit = 0;

delete
	from	employee
    where 	lname = 'Smith'

select		*
	from 	employee
    where	lname = 'smith'
# 0 row
   
select count(*) from employee
# 7 rows

commit

update project
	set		location = 'Bellaire', Dno = 5
    where	pno = 10

select * from project where location = 'Bellaire' and dno = 5 # 1 rows
select count(*) from project # 6 rows
update project
	set		location = 'Bellaire', Dno = 5
    where	pno = 10
select * from PROJECT where location = 'Bellaire' and Dno = 5 # 2 rows
select count(*) from PROJECT # 6 rows
commit #1 & #2 matches with #5 & #6


    


