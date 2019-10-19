-- DATA ANALYSIS --


--1. List the following details of each employee: employee number, last name, first name, gender, and salary. 

SELECT Employees.emp_no
	, Employees.last_name
	, Employees.first_name
	, Employees.gender
	, Salaries.salary 
FROM Employees
JOIN Salaries 
	ON Employees.emp_no = Salaries.emp_no;

-- 2. List employees who were hired in 1986. 

-- Change the data types of columns if necessary
ALTER TABLE Employees
ALTER COLUMN hire_date TYPE DATE USING TO_DATE(hire_date, 'YYYY-MM-DD');

SELECT * 
FROM Employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- Another way to achieve the above
SELECT * 
FROM Employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment(hire) dates.

SELECT D.dept_no
	, D.dept_name
	, DM.emp_no
	, E.last_name
	, E.first_name
	, DM.from_date
	, E.hire_date 
FROM Department AS D
JOIN Dept_Manager AS DM
	ON D.dept_no = DM.dept_no
JOIN Employees AS E
	ON DM.emp_no = E.emp_no
ORDER BY emp_no ASC;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT E.emp_no
	, E.last_name
	, E.first_name
	, DE.dept_no
FROM Employees AS E
JOIN Dept_Emp AS DE
	ON E.emp_no = DE.emp_no
ORDER BY emp_no ASC;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * 
FROM Employees
WHERE first_name = 'Hercules' 
	AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.

SELECT E.emp_no
	, E.last_name
	, E.first_name
	, D.dept_name 
	FROM Dept_Emp AS DE			-- Call from the junction between Department and Employees
JOIN Employees AS E
	ON E.emp_no = DE.emp_no
JOIN Department as D
	ON D.dept_no = DE.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT E.emp_no
	, E.last_name
	, E.first_name
	, D.dept_name
	FROM Dept_Emp AS DE		
JOIN Employees AS E
	ON E.emp_no = DE.emp_no
JOIN Department as D
	ON D.dept_no = DE.dept_no
WHERE dept_name = 'Sales'
	OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name
	, COUNT(last_name) AS freq_cnt
FROM Employees
GROUP BY last_name
ORDER BY freq_cnt DESC;




