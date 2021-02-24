--Create list containing employee number, last name, first name, sex, and salary.
SELECT Employee.emp_no, Employee.last_name, Employee.first_name, Employee.sex, Salaries.salary
FROM Employee
JOIN salaries ON
Employee.emp_no=Salaries.emp_no;