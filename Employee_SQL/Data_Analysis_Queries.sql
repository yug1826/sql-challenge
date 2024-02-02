-- SCHEMA: Data_Analysis_Queries


	
-- DATA ANALYSIS

-- List the employee number, last name, first name, sex, and salary of each employee
SELECT Employees.Emp_No, Employees.Last_Name, Employees.First_Name, Employees.Sex, Salaries.Salary
FROM Employees
JOIN Salaries ON Employees.Emp_No = Salaries.Emp_No;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT First_Name, Last_Name, hire_date
FROM Employees 
WHERE EXTRACT(YEAR FROM hire_date::date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT Departments.Dept_No, Departments.Dept_Name, Employees.Emp_No, Employees.Last_Name, Employees.First_Name
FROM Departments
JOIN Dept_Manager ON Departments.Dept_No = Dept_Manager.Dept_No
JOIN Employees ON Dept_Manager.Emp_No = Employees.Emp_No;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT Departments.Dept_Name, Employees.Emp_No, Employees.Last_Name, Employees.First_Name
FROM Departments
JOIN Dept_Employee ON Departments.Dept_No = Dept_Employee.Dept_No
JOIN Employees ON Dept_Employee.Emp_No = Employees.Emp_No;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT Employees.First_Name, Employees.Last_Name, Employees.Sex
FROM Employees
WHERE First_Name = 'Hercules'
AND Last_Name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT Employees.Emp_No, Employees.Last_Name, Employees.First_Name
FROM Employees
JOIN Dept_Employee ON Employees.Emp_No = Dept_Employee.Emp_No
WHERE Dept_No = 'd007';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT Employees.Emp_No, Departments.Dept_Name, Employees.Last_Name, Employees.First_Name
FROM Departments
JOIN Dept_Employee ON Departments.Dept_No = Dept_Employee.Dept_No
JOIN Employees ON Dept_Employee.Emp_No = Employees.Emp_No
WHERE Dept_Employee.Dept_No = 'd007' 
OR Dept_Employee.Dept_No = 'd005';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT Last_Name, COUNT(Emp_No) AS frequency
FROM Employees
GROUP BY Last_Name
ORDER BY COUNT(Emp_No) DESC;
