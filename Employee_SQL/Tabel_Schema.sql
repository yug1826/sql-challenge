CREATE TABLE IF NOT EXISTS Departments (
  Dept_No VARCHAR(10) PRIMARY KEY NOT NULL,
  Dept_Name VARCHAR(50) NOT NULL
);


SELECT * FROM Departments;


-- Create Titles Table and set Primary Key
CREATE TABLE IF NOT EXISTS Titles (
  Title_Id VARCHAR(10) PRIMARY KEY NOT NULL,
  Title VARCHAR(10) NOT NULL
);

-- Change Varchar limit to 50 to accomodate the data
ALTER TABLE Titles ALTER COLUMN Title TYPE VARCHAR(50);

SELECT * FROM Titles;


-- Create Employees Table and set Primary and Foreign Keys
CREATE TABLE IF NOT EXISTS Employees (
  Emp_No INT PRIMARY KEY NOT NULL,
  Title_Id VARCHAR(10) NOT NULL,
  Birth_Date VARCHAR(5) NOT NULL,
  First_Name VARCHAR(200)NOT NULL,
  Last_Name VARCHAR(200)NOT NULL,
  Sex VARCHAR(5) NOT NULL,
  Hire_Date VARCHAR(15) NOT NULL,
  FOREIGN KEY (Title_Id) REFERENCES Titles(Title_Id)
);

-- Change Varchar limit to 50 to accomodate the data
ALTER TABLE Employees ALTER COLUMN Birth_Date TYPE VARCHAR(20);

SELECT * FROM Employees;

-- Create Salaries Table and set Primary and Foreign Keys
CREATE TABLE IF NOT EXISTS Salaries (
  Emp_No INT PRIMARY KEY NOT NULL,
  Salary INT NOT NULL,
  FOREIGN KEY (Emp_No) REFERENCES Employees(Emp_No)
);

SELECT * FROM Salaries;


-- Create Department Manager Table and set Foreign Keys
CREATE TABLE IF NOT EXISTS Dept_Manager (
  Dept_No VARCHAR(10) NOT NULL,
  Emp_No INT NOT NULL,
  FOREIGN KEY (Emp_No) REFERENCES Employees(Emp_No),
  FOREIGN KEY (Dept_No) REFERENCES Departments(Dept_No)
);

SELECT * FROM Dept_Manager;


-- Create Department Employee Table and set Foreign Keys
CREATE TABLE IF NOT EXISTS Dept_Employee (
  Emp_No INT NOT NULL,
  Dept_No VARCHAR(10) NOT NULL,
  FOREIGN KEY (Emp_No) REFERENCES Employees(Emp_No),
  FOREIGN KEY (Dept_No) REFERENCES Departments(Dept_No)
);

SELECT * FROM Dept_Employee;
