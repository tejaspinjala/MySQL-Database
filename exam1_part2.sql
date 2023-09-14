use company;
select @@autocommit;
set autocommit = 0;

# 7.5a
select d.dname, count(*)  
	from	employee e,
			department d
    where 	e.dno = d.dno
		and salary > 30000
    group by dname;
    
# 7.5b: Yes we can specify this query and add a condition 
# gender = 'M' in the where clause to only get the male employees
# that make more than $30,000
select d.dname, count(*)  
	from	employee e,
			department d
    where 	e.dno = d.dno
		and e.gender = 'M'
		and salary > 30000
    group by dname;
    
# 9.3

