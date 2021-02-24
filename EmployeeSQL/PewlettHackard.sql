-- Create title table and import data to the table.
CREATE TABLE Title (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    CONSTRAINT pk_Title PRIMARY KEY (title_id)
);

COPY Title(title_id, title)
FROM 'C:\Users\Captain\Documents\GitHub\sql-challenge\SourceData\titles.csv'
DELIMITER ','
CSV HEADER;

-- Create employee table and import data to the table.
CREATE TABLE Employee (
    emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
    first_name VARCHAR   NOT NULL,
	last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
	CONSTRAINT pk_Employee PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES Title(title_id)
);

COPY Employee(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM 'C:\Users\Captain\Documents\GitHub\sql-challenge\SourceData\employees.csv'
DELIMITER ','
CSV HEADER;

-- Create salaries table and import data to the table.
CREATE TABLE Salaries (
    emp_no int,
    salary int NOT NULL,
	CONSTRAINT pk_Salaries PRIMARY KEY (emp_no, salary)
);

COPY Salaries(emp_no, salary)
FROM 'C:\Users\Captain\Documents\GitHub\sql-challenge\SourceData\salaries.csv'
DELIMITER ','
CSV HEADER;

-- Create department table and import data to the table.
CREATE TABLE Department (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_Department PRIMARY KEY (dept_no)
);

COPY Department(dept_no, dept_name)
FROM 'C:\Users\Captain\Documents\GitHub\sql-challenge\SourceData\departments.csv'
DELIMITER ','
CSV HEADER;

-- Create departmentmanager table and import data to the table.
CREATE TABLE DepartmentManager (
    dept_no VARCHAR   NOT NULL,
    emp_no int   NOT NULL
);

COPY DepartmentManager(dept_no, emp_no)
FROM 'C:\Users\Captain\Documents\GitHub\sql-challenge\SourceData\dept_manager.csv'
DELIMITER ','
CSV HEADER;

-- Create department employees table and import data to the table.
CREATE TABLE DepartmentEmployees (
    emp_no int   NOT NULL,
	dept_no VARCHAR   NOT NULL
);

COPY DepartmentEmployees(emp_no, dept_no)
FROM 'C:\Users\Captain\Documents\GitHub\sql-challenge\SourceData\dept_emp.csv'
DELIMITER ','
CSV HEADER;

-- Add foreign key to salaries from employee table.
ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employee (emp_no);

-- Add foreign key to department manager from department table.
ALTER TABLE DepartmentManager ADD CONSTRAINT fk_DepartmentManager_dept_no FOREIGN KEY(dept_no)
REFERENCES Department (dept_no);

-- Add foreign key to department employees from department table.
ALTER TABLE DepartmentEmployees ADD CONSTRAINT fk_DepartmentEmployees_dept_no FOREIGN KEY(dept_no)
REFERENCES Department (dept_no);

-- Add foreign key to department employees from employee table.
ALTER TABLE DepartmentEmployees ADD CONSTRAINT fk_DepartmentEmployees_emp_no FOREIGN KEY(emp_no)
REFERENCES Employee (emp_no);