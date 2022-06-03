--UC1 Create database
Create DATABASE Payroll_service;
Use Payroll_service;

--UC2
Create table EmployeePayroll(Id int primary key IDENTITY(101,1),Name varchar(70) NOT NULL,Salary int, StartDate Date,);

--UC3
insert into EmployeePayroll values
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

select *from EmployeePayroll;

--UC5

select Salary from EmployeePayroll where name='chetana';
select salary from EmployeePayroll where Name like 'A%';

select StartDate  from EmployeePayroll WHERE (StartDate BETWEEN '2018.MARCH.13' AND GETDATE());
select * from EmployeePayroll where StartDate between CAST('2019.APR.12'As date) And GETDATE();
 
 --UC6
 Alter table EmployeePayroll Add Gender varchar(1) ;

 Update EmployeePayroll set Gender='M' where Id in(102,107,108,109);

 Update EmployeePayroll set Gender='F' where Id in(101,103,104,105,106);

 --UC7
 select SUM(salary)from Employee_Payroll;

 select count(*)from EmployeePayroll group by Gender;
 select count(*),Gender from EmployeePayroll group by Gender;


 select AVG(salary)from EmployeePayroll group by Gender;
 select MIN(salary) from EmployeePayroll;
 select MAX(salary) from EmployeePayroll;
 
 --UC8
 
 Alter table EmployeePayroll Add PhoneNumber varchar(10);

Update EmployeePayroll Set PhoneNumber='1234567891' where Id=101;

ALTER TABLE EmployeePayroll ADD Address varchar(250) not null default 'pune';

ALTER TABLE EmployeePayroll ADD Department varchar(150);

Update EmployeePayroll Set Department='production' where Name='Ajinky';

---UC9
select * from EmployeePayroll;
ALTER TABLE EmployeePayroll ADD Basic_Pay float not null default 0 ;
ALTER TABLE EmployeePayroll ADD Deduction float not null default 0 ;
ALTER TABLE EmployeePayroll ADD Taxable_Pay float not null default 0 ;
ALTER TABLE EmployeePayroll ADD Tax float not null default 0 ;
ALTER TABLE EmployeePayroll ADD Income_Tax int not null default 0 ;
ALTER TABLE EmployeePayroll ADD Net_Pay float not null default 0 ;
update EmployeePayroll set PhoneNumber='7875278951',Address='Amalner',Department='sales',Basic_Pay=25000,Deduction=700,Taxable_Pay=500,Income_Tax=800,Net_Pay=23000 where Id=103;

---UC10

Insert into EmployeePayroll
(Name,Salary,StartDate,Gender,PhoneNumber,Deduction,Taxable_Pay,Net_Pay,Address) Values
('Terisa',35000,'2018.jun.10','F','7875278951',1000,2000,18000,'mumbai');

select * from EmployeePayroll;

--UC11

alter table EmployeePayroll Drop column Department;
Create table Department( Deptid int primary key Identity(101,101),DeptName varchar(10));
Create table Employee_PayrollMapping( MappingID int primary key Identity (101,101),
EmpId int,
Employee_PayrollID int,
Deptid int,
);

alter table Employee_PayrollMapping ADD Foreign key (Employee_PayrollID) References EmployeePayroll(Id);
alter table Employee_PayrollMapping ADD Foreign key (Deptid) References Department(Deptid);
select * from Department;
select * from Employee_PayrollMapping;

Insert into Department values('Production'),('Sales'),('Marketing'),('Design'),('Quality'),('Others');

Insert into Employee_PayrollMapping values(101,101,101),(101,102,103);

select * from EmployeePayroll INNER JOIN Employee_PayrollMapping ON Employee_PayrollID=Employee_PayrollMapping.Employee_PayrollID 
INNER JOIN Department ON Department.Deptid=Employee_PayrollMapping.Deptid;


--store procedure

Create proc spGetAllEmployees
As
Begin
Select *from Employee_Payroll;
End




