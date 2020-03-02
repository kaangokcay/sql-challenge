--Renamed all tables to make it easier to query and avoid problems with capitalization
Alter table "Department_Employees" rename to dept_emp
Alter table "Department_Manager" rename to dept_manager
Alter table "Departments" rename to departments
Alter table "Employees" rename to employees
Alter table "Salaries" rename to salaries
Alter table "Titles" rename to titles

--1.
select employees.emp_no as "Employee Number",
employees.last_name as "Last Name", 
employees.first_name as "First Name",
employees.gender as "Gender", 
salaries.salary as " Salary ($)"
from employees inner join salaries on employees.emp_no = salaries.emp_no;

--2. 
select emp_no as "Employee Number",
last_name as "Last Name",
first_name as "First Name",
hire_date as "Hire Date"
from employees where 
	hire_date >= '19860101' and
	hire_date <= '19861231'; 
	
--3. 
select departments.dept_no as "Department Number",
departments.dept_name as "Department Name",
dept_manager.emp_no as "Employee Number",
employees.last_name as "Last Name",
employees.first_name as "First Name",
dept_manager.from_date as "Start Date",
dept_manager.to_date as " End Date"
from departments inner join dept_manager on departments.dept_no = dept_manager.dept_no
inner join employees on dept_manager.emp_no = employees.emp_no;

--4. 
select employees.emp_no as "Employee Number",
employees.last_name as "Last Name",
employees.first_name as "First Name", 
departments.dept_name as "Department Name"
from employees inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no;

--5. 
select first_name as "First Name",
last_name as "Last Name"
from employees where first_name = 'Hercules' and last_name like 'B%';

--6. 
select employees.emp_no as "Employee Number",
employees.last_name as "Last Name",
employees.first_name as "First Name", 
departments.dept_name as "Department Name"
from employees inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no 
where departments.dept_name = 'Sales'; 

--7. 
select employees.emp_no as "Employee Number",
employees.last_name as "Last Name",
employees.first_name as "First Name", 
departments.dept_name as "Department Name"
from employees inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no 
where departments.dept_name = 'Sales' or departments.dept_name = 'Development'; 

--8. 
select last_name, count(last_name) as "Last Name count" from employees 
group by last_name order by "Last Name count" desc;



