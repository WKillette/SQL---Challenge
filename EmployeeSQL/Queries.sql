-- Database: EmployeeSQL

-- DROP DATABASE IF EXISTS "EmployeeSQL";

CREATE DATABASE "EmployeeSQL"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	
DROP TABLE departments;
	

CREATE TABLE departments (
	dept_no VARCHAR(10),
	dept_name VARCHAR (30) NOT NULL,
);

SELECT * from departments;	


DROP TABLE dept_emp;
	

CREATE TABLE dept_emp (
	dept_no VARCHAR(10) NOT NULL,
	emp_no VARCHAR NOT NULL
);

SELECT * from dept_emp;	


DROP TABLE dept_manager;
	
CREATE TABLE dept_manager (
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL
);

SELECT * from dept_manager;


DROP TABLE employees;

CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title VARCHAR NOT NULL,
    birth_date VARCHAR NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    sex VARCHAR(2) NOT NULL,
    hire_date DATE NOT NULL
);

SELECT * from employees;


DROP TABLE salaries;
	
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL
);

SELECT * from salaries;

DROP TABLE titles;
	
CREATE TABLE titles (
	title_id VARCHAR (5) NO NULL,
	title VARCHAR (20) NO NULL
);

SELECT * from titles;

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, 
  employees.last_name, 
  employees.first_name, 
  employees.sex,
  salaries.salary  
FROM employees
LEFT JOIN salaries ON employees.emp_no_code = salaries.emp_no_code;

-- Perform an INNER JOIN on the two tables  based on employee number -- 
SELECT employees.emp_no, employees.last_name,employees.first_name , employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no=employees.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT * FROM employees WHERE hire_date = 1986
ORDER BY emp_no;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no,
deparements.dept_name,
dept_manager.emp_no,
employees.last_name,
employees.first_name
FROM dept_manager
LEFT JOIN departments ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees ON dept_manager.emp_no = employees.emp_no
ORDER BY emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT 
employees.emp_no,
employees.last_name,
employees.first_name,
dept_emp.dept_no,
departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON deparements.dept.no=dept_emp.dept_no
ORDER BY emp_no;



--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees 
WHERE first_name = 'Hercules' AND last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
employee.emp_no,
employee.last_name,
employee.first_name,
dept_emp.dept_no,
FROM employees
LEFT JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name=('Sales');

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
employee.emp_no,
employee.last_name,
employee.first_name,
dept_emp.dept_no,
FROM employees
LEFT JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name= ('Sales', 'Development');


--8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT last_name, COUNT(*) AS f_count
FROM employees
GROUP BY last_name
ORDER BY f_count DESC; 