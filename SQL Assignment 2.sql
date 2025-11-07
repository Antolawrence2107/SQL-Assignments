Create database if not exists Employee_DB;

Use Employee_DB;

Create Table if not exists Departments(
	Department_ID int Primary key,
    Department_Name Varchar(100) not null unique
    );

Create Table if not exists location(
	Location_ID int auto_increment primary key,
    Location_Name varchar(30) not null unique
    );
    

Create table if not exists Employees(
	Employee_ID int Primary key,
    Employee_Name Varchar(50) not null,
    Gender enum('M','F'),
    age int check(age>18),
    Hire_Date date default (current_date()),
    Designation Varchar(100),
    Department_ID int,
    Location_ID int,
    Salary decimal(10,2),
	foreign key (department_id) references departments(department_id),
    foreign key (Location_id) references location(location_id)
    );


Alter Table Employees Rename Column Hire_Date to Date_of_Joining;

Alter Table Location Rename To Locations;

Select * from Employees;
Select * from departments;
select * from locations;

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Software Development'),
(2, 'Marketing'),
(3, 'Data Science'),
(4, 'Human Resources'),
(5, 'Product Management'),
(6, 'Content Creation'),
(7, 'Finance'),
(8, 'Design'),
(9, 'Research and Development'),
(10, 'Customer Support'),
(11, 'Business Development'),
(12, 'IT'),
(13, 'Operations');

INSERT INTO locations  VALUES 
(1,'Chennai'),
(2,'Bangalore'),
(3,'Hyderabad'),
(4,'Pune');

INSERT INTO employees (employee_id, employee_name, gender, age, Date_of_Joining, designation, department_id, location_id, salary) VALUES
(5001, 'Vihaan Singh', 'M', 27, '2015-01-20', 'Data Analyst', 3, 4, 60000),
(5002, 'Reyansh Singh', 'M', 31, '2015-03-10', 'Network Engineer', 12, 1, 80000),
(5003, 'Aaradhya Iyer', 'F', 26, '2015-05-20', 'Customer Support Executive', 10, 2, 45000),
(5004, 'Kiara Malhotra', 'F', 29, '2015-07-05', NULL, 8, 3, 70000),
(5005, 'Anvi Chaudhary', 'F', 25, '2015-09-11', 'Business Development Executive', 11, 1, 55000),
(5006, 'Dhruv Shetty', 'M', 28, '2015-11-20', 'UI Developer', 8, 2, 65000),
(5007, 'Anushka Singh', 'F', 32, '2016-01-15', 'Marketing Manager', 2, 3, 90000),
(5008, 'Diya Jha', 'F', 27, '2016-03-05', 'Graphic Designer', 8, 4, 70000),
(5009, 'Kiaan Desai', 'M', 30, '2016-05-20', 'Sales Executive', 11, 3, 55000),
(5010, 'Atharv Yadav', 'M', 29, '2016-07-10', 'Systems Administrator', 12, 4, 80000),
(5011, 'Saanvi Patel', 'F', 28, '2016-09-20', 'Marketing Analyst', 2, 1, 60000),
(5012, 'Myra Verma', 'F', 26, '2016-11-05', 'Operations Manager', 13, 2, 95000),
(5013, 'Arnav Rao', 'M', 33, '2017-01-20', 'Customer Success Manager', 10, 3, 75000),
(5014, 'Vihaan Mohan', 'M', 30, '2017-03-10', 'Supply Chain Analyst', 10, 2, 60000),
(5015, 'Ishaan Kumar', 'M', 27, '2017-05-20', 'Financial Analyst', 7, 1, 85000),
(5016, 'Zoya Khan', 'F', 31, '2017-07-05', 'Legal Counsel', 4, 4, 100000),
(5017, 'Kabir Nair', 'M', 28, '2017-09-11', 'IT Support Specialist', 12, 2, 80000),
(5018, 'Ishan Mishra', 'M', 25, '2017-11-20', 'Research Scientist', 9, 3, 75000),
(5019, 'Ishika Patel', 'F', 29, '2018-01-15', 'Talent Acquisition Specialist', 4, 4, 55000),
(5020, 'Aarav Nair', 'M', 32, '2018-03-05', 'Software Engineer', 1, 1, 90000),
(5021, 'Advik Kapoor', 'M', 26, '2018-05-20', 'Finance Analyst', 7, 3, 85000),
(5022, 'Aadhya Iyengar', 'F', 28, '2018-07-10', 'HR Specialist', 4, 4, 60000),
(5023, 'Anika Paul', 'F', 30, '2018-09-20', 'Public Relations Specialist', 2, 2, 70000),
(5024, 'Aryan Shetty', 'M', 27, '2018-11-05', 'Product Manager', 5, 1, 95000),
(5025, 'Avni Iyengar', 'F', 31, '2019-01-20', 'Data Scientist', 3, 4, 100000),
(5026, 'Vivaan Singh', 'M', 29, '2019-03-10', 'Business Analyst', 3, 2, 75000),
(5027, 'Ananya Paul', 'F', 32, '2019-05-20', 'Content Writer', 6, 3, 60000),
(5028, 'Anaya Kapoor', 'F', 26, '2019-07-05', 'Event Coordinator', 6, 1, 60000),
(5029, 'Arjun Kumar', 'M', 33, '2019-09-11', 'Quality Assurance Analyst', 12, 2, 80000),
(5030, 'Sara Iyer', 'F', 28, '2019-11-20', 'Project Manager', 5, 1, 90000);


Select * from Employees;
Select * from departments;
select * from locations;

-- distinct
select distinct designation , salary from employees;

-- alais
Select age as Employee_Age, Salary as employee_salary from employees;

-- where & operators
select employee_Name, Date_of_Joining, salary from employees
where salary>50000
and Date_of_Joining < '2016-01-01';

SET SQL_SAFE_UPDATES = 0;

Update employees 
set designation="Data Scientist"
where designation is null or designation='';

Select * from Employees;


-- ORDER BY
select * from employees
order by Department_ID Asc, salary desc;


-- limit
select * from employees 
where year(Date_of_Joining)='2018'  limit 5;

-- Aggregate Functions
SELECT SUM(Salary) AS finance_Salary
FROM Employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.Department_Name = 'Finance';

select min(age) as youngest_employee from employees;


-- GROUP BY
select l.location_name,max(salary) as maximum_salary from employees e
join locations l on e.location_id=l.location_id
group by location_name;

select Designation, avg(salary) as Average_Salary from employees e
where Designation like '%Analyst%'
group by Designation;


-- Having --- 
select d.department_name, count(*) as employee_count from employees e
join departments d on e.department_id=d.department_id
group by department_name
having employee_count<3;


SELECT l.Location_Name, round(avg(e.Age),0) AS Average_Age
FROM Employees e
JOIN Locations l ON e.Location_ID = l.Location_ID
WHERE e.Gender = 'F'
GROUP BY l.Location_Name
HAVING AVG(e.Age) < 30;


-- Inner JOIN 
select Employee_name, Designation, d.Department_Name, Salary from employees e 
inner join Departments d on e.department_id = d.department_id;

-- left Join
select d.department_name, count(e.employee_id) as count_of_employee from departments d
left join employees e on d.department_id = e.department_id
Group by d.department_name;

-- right Join
SELECT 
    e.Employee_Name, 
    l.Location_Name
FROM Employees e
RIGHT JOIN Locations l
    ON e.Location_ID = l.Location_ID;

