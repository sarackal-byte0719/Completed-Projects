show databases;   
drop database if exists DBEx1; 
create database DBEx1; # Create the database named DBEx1  
show databases;
use DBEx1;  -- Use the database DBEx1 we just created
show tables; 

create table Employees(LName varchar(20), IDN int, Salary decimal(20, 2),  Deduction decimal(20, 2)); 
describe employees; 
insert into Employees values ('Peter', 1, 1000, 10), ('Mary', 12, 2000, 0),  ('Tony', 22, 4000, 32), ('Mike', 17, 4000, 10), ('John', 93, null, null); 
select * from employees; 

create table IRAs(IDN int, IRA_acct varchar(12), Balance decimal(20, 2)); 
describe iras; 
insert into IRAs values(1, 'A1', 100), (22, 'A2', 200), (22, 'A3', 400), (93, 'A4', 500);
select * from iras;   
 
create table AddressCity(IDN int, CompanyCity varchar(22),  HomeCity varchar(22) ); 
describe addresscity; 
insert into addresscity values (1, 'Saint Louis', 'Saint Louis'), (12, 'Saint Louis', 'Chesterfield'),  (22, 'Chesterfield', 'Saint Louis'), (93, 'Chesterfield', 'Chesterfield'), (17, 'Fenton', 'Fenton'); 
select * from addresscity; 

select * from employees; 
select * from iras; 
select * from addresscity;


SET SQL_SAFE_UPDATES = 0;

drop table if exists TEmployees;
CREATE TABLE Table2 AS SELECT * FROM IRAs i where balance >= 280; 
select * from Table2;
show tables;

INSERT INTO Table2 SELECT * FROM IRAs WHERE balance >= 200 and balance <=350; 
select * from Table2

drop table if exists TEmployees;
select * from Table2; 
update Table2 set balance = balance+25 where balance < 250; 
select * from Table2; 

drop table if exists TEmployees;
select LName, Salary from employees 
where salary >= (select avg(salary) from employees);

select LName, Salary from employees where salary >= (select max(salary) from employees);

select Homecity, count(LName) as NumofEmployees from employees e, addresscity a where e.idn = a.idn group by Homecity;

select LName, HomeCity from employees e, addresscity a where e.idn = a.idn and LName >= (select count(LName) from employees) group by Homecity;

select Homecity, count(LName) as NumofEmployees from employees e, addresscity a where e.idn = a.idn group by Homecity;
select Homecity, count(LName) as NumofEmployees 
from employees e, addresscity a where e.idn = a.idn and Homecity >= (select max(Homecity) from addresscity ) group by Homecity;

select Homecity, count(LName) as NumofEmployees from employees e, addresscity a where e.idn = a.idn group by Homecity;

select homecity, count(LName) as TotalE from employees e, addresscity a where e.idn = a.idn and Homecity >= (select max(Homecity) from addresscity )group by homecity;

select LName, sum(balance) as TotalB from employees e, iras I where e.idn = i.idn and balance <= (select min(balance) from iras ) group by LName, e.IDN;
select min(balance) from iras;

select LName, balance from employees e, iras i where e.idn = i.idn and balance <= (select min(balance) from iras);

select LName, balance from employees e, iras i
where e.idn = i.idn and balance <= (select min(balance) from iras) group by LName, e.IDN;

select LName, sum(balance) as TotalB, min(balance) as MinB from employees e, iras I where e.idn = i.idn and balance <= (select min(balance) from iras ) group by LName, e.IDN;

drop table if exists Table2;
CREATE TABLE Table2 AS SELECT * FROM IRAs i where balance >= 280;
select * from Table2;

INSERT INTO Table2 SELECT * FROM IRAs WHERE balance >= 200 and balance <=350;
select * from Table2;

select* from Table2;
update Table2 set balance = balance+25 where balance < 250;
select * from Table2;

select LName, Salary from employees
where salary >= (select avg(salary) from employees);

select LName, Salary from employees where salary >= (select max(salary) from employees);


select Homecity, count(LName) as NumofEmployees from employees e, addresscity a where e.idn = a.idn group by Homecity;

select Homecity, count(LName) as NumofEmployees
from employees e, addresscity a where e.idn = a.idn and Homecity >= (select max(Homecity) from addresscity ) group by Homecity;

select homecity, count(LName) as TotalE from employees e, addresscity a where e.idn = a.idn and Homecity >= (select max(Homecity) from addresscity ) group by homecity;

select LName, min(balance) as MinB from employees e, iras i
where e.idn = i.idn and balance <= (select min(balance) from iras) group by LName, e.IDN;

select LName, sum(balance) as TotalB, min(balance) as MinB from employees e, iras I where e.idn = i.idn and balance <= (select min(balance) from iras ) group by LName, e.IDN;



