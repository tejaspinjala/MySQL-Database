select @@autocommit;
set autocommit = 0;

drop database university;
drop user 'university'@'localhost';
commit;

show databases;
create database university;
create user 'university'@'localhost' identified by 'university123';
grant all on university.* to 'university'@'localhost';
commit;
