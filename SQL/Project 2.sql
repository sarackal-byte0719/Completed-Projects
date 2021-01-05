#Employee Table

show databases; 
drop database if exists DBEx1; 
create database DBEx1; # Create the database named DBEx1 
show databases; 
use DBEx1;  # Use the database DBEx1 we just created
show tables; 

drop table if exists employees; 
create table Employees(LName varchar(20), IDN int, Salary decimal(20, 2),  Deduction decimal(20, 2)); 
describe employees; 
insert into Employees values ('Peter', 1, 1000, 10), ('Mary', 12, 2000, 0),  ('Tony', 22, 4000, 32), ('Mike', 17, 4000, 10), ('John', 93, null, null); 
select * from employees;

#IRA Table

drop table if exists IRAs; 
create table IRAs(IDN int, IRA_acct varchar(12), Balance decimal(20, 2)); 
describe iras; 
insert into IRAs values(1, 'A1', 100), (22, 'A2', 200), (22, 'A3', 400), (93, 'A4', 500); 
select * from iras; 
 
#AddressCity Table

drop table if exists addresscity; 
create table AddressCity(IDN int, CompanyCity varchar(22),  HomeCity varchar(22) );
describe addresscity; 
insert into addresscity values (1, 'Saint Louis', 'Saint Louis'), (12, 'Saint Louis', 'Chesterfield'),  (22, 'Chesterfield', 'Saint Louis'), (93, 'Chesterfield', 'Chesterfield'), (17, 'Fenton', 'Fenton'); 
select * from addresscity; 
#It looks like your MySql session has the safe-updates option set. This means that you can't update or delete records without specifying a key (ex. primary key) in the where clause.
#Try:
SET SQL_SAFE_UPDATES = 0;
 
#Question 1
#Write a query to create a table named TEmployees containing all records in the table Employees.
drop table if exists TEmployees;
CREATE TABLE TEmployees AS  SELECT * FROM Employees e where e.IDN = e.IDN;
select * from TEmployees;
show tables;



Create table TEmployees (LName varchar(20), IDN int, Salary decimal(20, 2),  Deduction decimal(20, 2)); 
describe TEmployees; 
insert into TEmployees values ('Peter', 1, 1000, 10), ('Mary', 12, 2000, 0),  ('Tony', 22, 4000, 32), ('Mike', 17, 4000, 10), ('John', 93, null, null); 
select * from TEmployees;
show tables; 

#Question 2 	                                                                                              
#Write a query update statement to give a 15% raise for those employees in the table TEmployees with salary between $1000 and $3000.

select * from TEmployees; 
update TEmployees set salary = salary*(1.15) where Salary >= 1000 and Salary <= 3000 and salary is not null;  
select * from TEmployees;

#Question 3                                                                                                   
#For the records in the table TEmployees, write a delete statement to delete the records with deductions no more than $20.
delete from TEmployees where deduction >=20;
select * from TEmployees;


CREATE TABLE TEmployees2 SELECT * FROM Employees;
insert into TEmployees2 
select * from TEmployees2;
SELECT LName , IDN int, Salary,  Deduction from employees e where t2. idn=e.idn;

CREATE TABLE TEmployees3 AS  SELECT * FROM Employees;
select * from TEmployees3;

CREATE TABLE TEmployees5 AS  SELECT LName, IDN, Salary, Deduction FROM Employees;
select * from TEmployee5;

CREATE TABLE TEmployeesA SELECT * FROM Employees;
select * from TEmployeesA;
show tables; 

CREATE TABLE TEmployees25;
select LName, e.IDN, Salary, homecity  from employees e FROM employees;
select * from TEmployees25;

Create table TempTable6 
select LName, e.IDN, Salary, Deduction from employees e where e.IDN = e.IDN;
select * from TempTable6;

Create table TEmployees26 
select LName, e.IDN, Salary, Deduction from employees e where e.IDN = e.IDN;
select * from TEmployees26;

Create table TEmployees86 
select * from employees e where e.IDN = e.IDN;
select * from TEmployees86;
show tables;

Create table TEmployees9 
select * from employees;
select * from TEmployees9;
show tables;

Create table TEmployeesAB 
INSERT INTO TEmployeesAB 
SELECT * FROM employees

Create table TEmployeesAB 
SELECT * INTO TEmployeesAB 
  FROM employees;