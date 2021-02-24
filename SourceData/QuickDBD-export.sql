-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employee" (
    "EmployeeID" int   NOT NULL,
    "LastName" VARCHAR   NOT NULL,
    "FirstName" VARCHAR   NOT NULL,
    "Sex" VARCHAR   NOT NULL,
    "HireDate" date   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "EmployeeID"
     )
);

CREATE TABLE "Salaries" (
    "EmployeeID" int   NOT NULL,
    "Salary" money   NOT NULL
);

CREATE TABLE "Title" (
    "TitleID" int   NOT NULL,
    "JobTitle" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Title" PRIMARY KEY (
        "TitleID"
     )
);

CREATE TABLE "Department" (
    "DepartmentID" int   NOT NULL,
    "DepartmentName" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "DepartmentID"
     )
);

CREATE TABLE "DepartmentManager" (
    "DepartmentID" int   NOT NULL,
    "EmployeeID" int   NOT NULL
);

CREATE TABLE "DepartmentEmployees" (
    "DepartmentID" int   NOT NULL,
    "EmployeeID" int   NOT NULL
);

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_EmployeeID" FOREIGN KEY("EmployeeID")
REFERENCES "Employee" ("EmployeeID");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_DepartmentID" FOREIGN KEY("DepartmentID")
REFERENCES "Department" ("DepartmentID");

ALTER TABLE "DepartmentEmployees" ADD CONSTRAINT "fk_DepartmentEmployees_DepartmentID" FOREIGN KEY("DepartmentID")
REFERENCES "Department" ("DepartmentID");

ALTER TABLE "DepartmentEmployees" ADD CONSTRAINT "fk_DepartmentEmployees_EmployeeID" FOREIGN KEY("EmployeeID")
REFERENCES "Employee" ("EmployeeID");

