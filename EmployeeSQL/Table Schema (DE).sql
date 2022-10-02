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