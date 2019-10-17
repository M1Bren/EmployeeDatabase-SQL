-- DATA ENGINEERING --

CREATE TABLE Department (
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE Employees (
	emp_no INT PRIMARY KEY,
	birth_date DATE(20) NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	gender VARCHAR(5) NOT NULL,
	hire_date DATE(20) NOT NULL
);

CREATE TABLE Salaries (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	salary INT NOT NULL,
	from_date DATE(20) NOT NULL,
	to_date DATE(20) NOT NULL
);

CREATE TABLE Titles (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	title VARCHAR(50) NOT NULL,
	from_date DATE(20) NOT NULL,
	to_date DATE(20) NOT NULL
);

CREATE TABLE Dept_Emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Department(dept_no),
	from_date DATE(20) NOT NULL,
	to_date DATE(20) NOT NULL
);

CREATE TABLE Dept_Manager (
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Department(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	from_date DATE(20) NOT NULL,
	to_date DATE(20) NOT NULL
);