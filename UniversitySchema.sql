select @@autocommit;
set autocommit = 0;

show databases;
create database university;
create user 'university'@'localhost' identified by 'university123';
