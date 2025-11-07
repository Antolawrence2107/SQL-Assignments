Create database if not exists Employee_DB;

Use Employee_DB;

Create Table if not exists Departments(
	Department_ID int Primary key,
    Department_Name Varchar(100) not null unique
    );

Create Table if not exists location(
	Location_ID int primary key,
    Location_Name varchar(30) not null unique
    );
    

Create table if not exists Employees(
	Employee_ID int Primary key,
    Employee_Name Varchar(50) not null,
    Gender enum('M','F'),
    age int check(age>18),
    Hire_Date date default (current_date()),
    Designation Varchar(100),
	Salary decimal(10,2),
    Department_ID int,
    Location_ID int,
	foreign key (department_id) references departments(department_id),
    foreign key (Location_id) references location(location_id)
    );

Alter table Employees Add Column Email varchar(20) not null unique after employee_Name;

Select * from Employees;

Alter Table Employees Modify Designation varchar(150);

Alter Table Employees drop Age;

Alter Table Employees Rename Column Hire_Date to Date_of_Joining;

Alter Table Departments Rename To Department_info;

Alter Table Location Rename To Locations;

Select * from Employees;
Select * from department_info;
select * from locations;

Truncate Employees;

Drop table if exists employees;

Drop Database if exists employee_db;

