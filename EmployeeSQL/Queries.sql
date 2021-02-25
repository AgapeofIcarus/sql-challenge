--Create list containing employee number, last name, first name, sex, and salary.
SELECT Employee.emp_no, Employee.last_name, Employee.first_name, Employee.sex, Salaries.salary
FROM Employee
JOIN salaries ON
Employee.emp_no=Salaries.emp_no;

--Create list containing first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employee
WHERE hire_date between '1986-01-01' and '1986-12-31'
