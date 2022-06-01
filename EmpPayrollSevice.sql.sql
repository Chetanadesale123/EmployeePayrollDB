--UC1 Create database
Create DATABASE Payroll_service;
Use Payroll_service;

--UC2
Create table Employee_Payroll(Id int primary key IDENTITY(101,1),Name varchar(70) NOT NULL,Salary int, StartDate Date,);

--UC3
insert into Employee_Payroll values
('seeta',30000,'2020.JUN.15'),
('raj',25000,'2018.JAN.15'),
('Anushka',28000,'2019.APR.12'),
('Geeta',60000,'2022.feb.01'),
('chetana',22000,'2021.sep.15'),
('neha',24000,'2021.Jan.01'),
('rohit',30000,'2020.May.20'),
('vishal',50000,'2019.july.21'),
('Ajinky',26000,'2018.MARCH.13');

--UC4

select *from Employee_Payroll;

--UC5

select Salary from Employee_Payroll where name='chetana';
select salary from Employee_Payroll where Name like 'A%';

select StartDate  from Employee_Payroll WHERE (StartDate BETWEEN '2018.MARCH.13' AND GETDATE());
select * from Employee_Payroll where StartDate between CAST('2019.APR.12'As date) And GETDATE();
 
 --UC6
 Alter table Employee_Payroll Add Gender varchar(1) ;

 Update Employee_Payroll set Gender='M' where Id in(102,107,108,109);

 Update Employee_Payroll set Gender='F' where Id in(101,103,104,105,106);

 --UC7
 select SUM(salary)from Employee_Payroll;

 select count(*)from Employee_Payroll group by Gender;
 select count(*),Gender from Employee_Payroll group by Gender;


 select AVG(salary)from Employee_Payroll group by Gender;
 select MIN(salary) from Employee_Payroll;
 select MAX(salary) from Employee_Payroll;
 
 --UC8
 

Alter table Employee_Payroll Add PhoneNumber varchar(10);

Update Employee_Payroll Set PhoneNumber='1234567891' where Id=101;

ALTER TABLE Employee_Payroll ADD Address varchar(250) not null default 'pune';

ALTER TABLE Employee_Payroll ADD Department varchar(150);

Update Employee_Payroll Set Department='production' where Name='Ajinky';

---UC9

ALTER TABLE Employee_Payroll ADD Basic_Pay float not null default 0 ;
ALTER TABLE Employee_Payroll ADD Deduction float not null default 0 ;
ALTER TABLE Employee_Payroll ADD Taxable_Pay float not null default 0 ;
ALTER TABLE Employee_Payroll ADD Tax float not null default 0 ;
ALTER TABLE Employee_Payroll ADD Income_Tax int not null default 0 ;
ALTER TABLE Employee_Payroll ADD Net_Pay float not null default 0 ;

---UC10

Insert into Employee_Payroll
(Name,Salary,StartDate,Gender,PhoneNumber,Department,Deduction,Taxable_Pay,Net_Pay,Address) Values
('Terisa',35000,'2018.jun.10','F','7875278951','Sales&Marketing',1000,2000,18000,'mumbai');

select * from Employee_Payroll;




