--Create list containing employee number, last name, first name, sex, and salary.
SELECT Employee.emp_no, Employee.last_name, Employee.first_name, Employee.sex, Salaries.salary
FROM Employee
JOIN salaries ON
Employee.emp_no=Salaries.emp_no;

--Create list containing first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employee
WHERE hire_date between '1986-01-01' and '1986-12-31'

--Create list containing manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
SELECT departmentmanager.dept_no, department.dept_name, departmentmanager.emp_no, employee.last_name, employee.first_name
from departmentmanager
   inner join department on departmentmanager.dept_no = department.dept_no
   inner join employee on departmentmanager.emp_no = employee.emp_no
   
--Create list containing employee number, last name, first name, and department name.
SELECT departmentemployees.emp_no, employee.last_name, employee.first_name, department.dept_name
from employee
   inner join departmentemployees on employee.emp_no = departmentemployees.emp_no
   inner join department on departmentemployees.dept_no = department.dept_no