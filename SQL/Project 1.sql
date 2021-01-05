show databases; 
drop database if exists DBEx1; 
create database DBEx1; # Create the database named DBEx1
show databases; 
use DBEx1;  -- Use the database DBEx1 we just created 
show tables;

drop table if exists employees; 
create table Employees(LName varchar(20), IDN int, Salary decimal(20, 2),  Deduction decimal(20, 2)); 
describe employees; 
insert into Employees values ('Peter', 1, 1000, 10), ('Mary', 12, 2000, 0) ; 
select * from employees;

drop table if exists IRAs; 
create table IRAs(IDN int, IRA_acct varchar(12), Balance decimal(20, 2));
describe iras; 
insert into IRAs values(1, 'A1', 100), (22, 'A2', 200), (22, 'A3', 400);
select * from iras; 

drop table if exists addresscity; 
create table AddressCity(IDN int, CompanyCity varchar(22),  HomeCity varchar(22) );
describe addresscity; 
insert into addresscity values (1, 'Saint Louis', 'Saint Louis'), (12, 'Saint Louis', 'Chesterfield'); 
select * from addresscity;

select * from employees; 
select * from iras; 
select * from addresscity; 

#Question 1 
#Find the last name and deduction of each employee with deduction at least $20.00.

select LName, deduction from employees where deduction >= 20; 



#Question 2 
#Find the last name, deduction, and balance of each employee with a balance of at least $300.00.


select LName, deduction, IRA_acct, Balance from employees, iras where Balance >= 300 and employees.IDN = iras.IDN;



#Question 3  
#Find the last name, salary, IRA account balance, and the city name of the living address of each employee with a salary of at least $2,000.00.

select Lname, Salary, IRA_acct, Balance, Homecity from employees e, iras i, addresscity a where salary >= 2000 and e.IDN = i.IDN and i.IDN = a.IDN;



#Question 4   
#Find the last name, salary, IRA account balance, and the city name of the living address of each employee with a balance between $100 and $400 and a salary of less than $3,000.00.

select LName, Salary, IRA_acct, Balance, homecity from employees e, iras i, addresscity a where (Balance between 100 and 400) and salary < 3000 and e.idn = i.idn and i.idn = a.idn;


#Question 5 
# Find the total amount of deduction of all people who work in each city and the city name of the working address.

select distinct Companycity, sum(Deduction) as TotalDeduction from employees, addresscity where addresscity.IDN = employees.IDN group by Companycity;



#Question 6   
#Find the last name, deduction, and total amount of ira balance for each employee.

select LName, deduction, Sum(Balance) as Total_Balance from iras, employees where employees.IDN = iras.IDN group by LName, iras.IDN;


#Question 7  
#Find the last name, salary, number of ira accounts, and the city name of the living address for each employee.
select Lname, Salary, count(IRA_Acct) as Num_of_Accts, homecity from employees e, iras i, addresscity a where e.idn = i.idn and i.idn = a.idn group by LName, e.IDN;




#Question 8    
#Find the total amount of salary of all people who work in each city together with the working city name.

select distinct Companycity,  sum(salary) as TotalSalary  from employees, addresscity  where addresscity.IDN = employees.IDN  group by Companycity;


#Question 9   
#Find the total amount of balance and the total number of all IRA accounts of those who live in each city together with the living address city name.

select homecity, Sum(balance) as Total_Balance, count(IRA_Acct) as Num_of_Accts from iras i, addresscity a where i.IDN = a.IDN  group by homecity;     


#Question 10  
#Find the last name, total amount of ira balance, and total number of ira accounts for each employee with at least $300 of the total amount of ira balance.
select LName, Sum(Balance) as Total_Balance, count(ira_acct) as NumofAccts from employees,  iras  where employees.idn = iras.idn group by LName, iras.idn having Total_Balance >= 300; 





