--Create list containing employee number, last name, first name, sex, and salary.
SELECT Employee.emp_no, Employee.last_name, Employee.first_name, Employee.sex, Salaries.salary
FROM Employee
JOIN salaries ON
Employee.emp_no=Salaries.emp_no;

--Create list containing first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employee
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

--Create list containing manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
SELECT departmentmanager.dept_no, department.dept_name, departmentmanager.emp_no, employee.last_name, employee.first_name
FROM departmentmanager
   INNER JOIN department ON departmentmanager.dept_no = department.dept_no
   INNER JOIN employee ON departmentmanager.emp_no = employee.emp_no
   
--Create list containing employee number, last name, first name, and department name.
SELECT departmentemployees.emp_no, employee.last_name, employee.first_name, department.dept_name
FROM employee
   INNER JOIN departmentemployees ON employee.emp_no = departmentemployees.emp_no
   INNER JOIN department ON departmentemployees.dept_no = department.dept_no
   
--Create list containing first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."
SELECT employee.first_name, employee.last_name, employee.sex
FROM employee
WHERE employee.first_name = 'Hercules' AND employee.last_name LIKE 'B%'