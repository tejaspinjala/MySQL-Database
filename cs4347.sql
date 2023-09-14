drop database university;
drop user 'university'@'localhost';
drop database cs43470u2s23;
commit;
show databases;
create database university;
create user 'cs43470u2s23'@'localhost' identified by 'cs4347khan';
grant all on university.* to 'cs43470u2s23'@'localhost';
commit;