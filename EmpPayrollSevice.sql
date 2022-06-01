--UC1 Create database
Create DATABASE Payroll_service;
Use Payroll_service;
--UC2
Create table Employee_Payroll(Id int  NOT NULL primary key IDENTITY(101,1),Name varchar(35) NOT NULL,Salary Money NOT NULL, StartDate Date NOT NULL
);
--UC3
insert into Employee_Payroll 
values
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
select StartDate  from Employee_Payroll
 WHERE (StartDate BETWEEN '2018.MARCH.13' AND GETDATE());
 
 --UC6
 Alter table Employee_Payroll Add Gender varchar(1) AFTER name;

 Update Employee_Payroll set Gender='M' where Id in(102,107,108,109);

 Update Employee_Payroll set Gender='F' where Id in(101,103,104,105,106);

 --UC7
 select SUM(salary)from Employee_Payroll;

 select count(*)from Employee_Payroll group by Gender;

 select AVG(salary)from Employee_Payroll group by Gender;

