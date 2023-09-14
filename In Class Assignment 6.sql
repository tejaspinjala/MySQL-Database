# Chapter 7
# Q18: retireve the name of all employees who do not have supervisors
select		fname, lname
	from	employee
    where	super_ssn is NULL;
    
select distinct pno
	from	project p
    where 	pno in
			(select 	pno
				from	project p1, department d, employee e
                where	p1.dno = d.dno
					and d.mgr_ssn = e.ssn
                    and e.lname = 'Wong')
			OR
			pno in
            (select 	pno
				from	works_on w, employee e
                where	w.essn = e.ssn
                    and e.lname = 'Wallace');

select distinct essn
	from	WORKS_ON
    where	(pno, hours) in (select 	pno, hours
								from	works_on
                                where 	essn = '123456789');

select		lname, fname
	from 	employee
    where	salary > all (SELECT 	Salary
							FROM 	EMPLOYEE
							WHERE 	Dno = 5);
                                
# Q16: Retrieve the name of each employee who has a dependent with the
# same first name and is the same sex as the employee.
SELECT 		E.Fname, E.Lname
	FROM 	EMPLOYEE AS E
	WHERE 	E.Ssn IN (SELECT 		D.Essn
						FROM 		DEPENDENT AS D
						WHERE 		E.Fname = D.name
							AND 	E.gender = D.gender );
                            
                            
insert into DEPENDENT (essn, name, gender, bdate, relationship)
	values (453453453, 'Bob', 'M', '1972-07-31', 'Son')
    
INSERT INTO employee (ssn, fname, lname, gender)
VALUES ('123456780', 'John', 'Doe', 'M');

INSERT INTO dependent (essn, name, gender)
VALUES ('123456780', 'John', 'M');

delete from employee where ssn = 123456780;
delete from dependent where essn = 123456780;
select * from dependent

# Q16 is an alternative form that uses EXISTS as in Q16B
# Q16B
SELECT 		E.Fname, E.Lname
	FROM 	EMPLOYEE AS E
	WHERE EXISTS ( SELECT *
					FROM 	DEPENDENT AS D
					WHERE 	E.Ssn = D.Essn AND E.gender = D.gender
						AND E.Fname = D.name);
                        
#Q6. Retrieve the names of employees who have no dependents
SELECT 		Fname, Lname
	FROM 	EMPLOYEE
	WHERE NOT EXISTS ( SELECT *
						FROM 	DEPENDENT
						WHERE 	Ssn = Essn );

#Q6B
SELECT 		e.Fname, e.Lname
	FROM 	EMPLOYEE as e
	WHERE EXISTS ( SELECT *
						FROM 	DEPENDENT as d
						WHERE 	e.Ssn = d.Essn );

#Q7: List the names of managers who have at least one dependent.
SELECT 		Fname, Lname
	FROM 	EMPLOYEE
	WHERE EXISTS ( SELECT *
					FROM 	DEPENDENT
					WHERE 	Ssn = Essn )
						AND	EXISTS ( SELECT *
										FROM 	DEPARTMENT
										WHERE 	Ssn = Mgr_ssn );

# skip Q3A, Q3b, Q1A, Q1B, Q8B, Q2A

# Q17: Retrieve the Social Security numbers of all employees who work on
# project numbers 1, 2, or 3.
SELECT DISTINCT Essn
	FROM 		WORKS_ON
	WHERE Pno IN (1, 2, 3);

# Q8A.
SELECT 		E.Lname AS Employee_name, S.Lname AS Supervisor_name
	FROM 	EMPLOYEE AS E, EMPLOYEE AS S
	WHERE 	E.Super_ssn = S.Ssn;
    
#Q8B. Outer Join
SELECT 		E.Lname AS Employee_name,
			S.Lname AS Supervisor_name
	FROM 	(EMPLOYEE AS E LEFT OUTER JOIN EMPLOYEE AS S
		ON 	E.Super_ssn = S.Ssn);


# Q8C. Research outer join syntax for mysql
SELECT 		E.Lname, S.Lname
	FROM 	EMPLOYEE E, EMPLOYEE S
	WHERE 	E.Super_ssn += S.Ssn;

# Q19: Find the sum of the salaries of all employees, the maximum salary,
# the minimum salary, and the average salary.
SELECT SUM(Salary), MAX(Salary), MIN(Salary), AVG(Salary)
	FROM EMPLOYEE;
# This query returns a single-row summary of all the rows in the EMPLOYEE table.
# We could use AS to rename the column names in the resulting single-row table; for
# example, as in Q19A.
# Q19A:
SELECT SUM(Salary) AS Total_Sal, MAX(Salary) AS Highest_Sal,
 MIN(Salary) AS Lowest_Sal, AVG(Salary) AS Average_Sal
	FROM EMPLOYEE;

    





