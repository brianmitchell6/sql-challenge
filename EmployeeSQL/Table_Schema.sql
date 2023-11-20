--Create department table.  Department Number is Primary Key
DROP TABLE IF EXISTS departments CASCADE;

CREATE TABLE departments (
	dept_no CHAR(4) NOT NULL,
	dept_name VARCHAR,
	PRIMARY KEY(dept_no));


--Create titles table.  Title ID is Primary Key	
DROP TABLE IF EXISTS titles CASCADE;

CREATE TABLE titles (
	title_id CHAR(5) NOT NULL,
	title VARCHAR(255),
	PRIMARY KEY(title_id));


--Create employees table.  Employee Number is Primary Key.  
--Foreign Key of emp_title_id references titles table. 
DROP TABLE IF EXISTS employees CASCADE;

CREATE TABLE employees (
	emp_no CHAR(7) NOT NULL,
	emp_title_id CHAR(5),
	birth_date DATE,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex CHAR(1),
	hire_date DATE,
	PRIMARY KEY (emp_no),
	CONSTRAINT fk_title
      FOREIGN KEY(emp_title_id) 
	  REFERENCES titles(title_id)
	  ON DELETE CASCADE);
	  
	  
--Create salaries table.  No Primary Key.  
--Foreign Key emp_no references employees table. 
DROP TABLE IF EXISTS salaries CASCADE; 

CREATE TABLE salaries (
	emp_no CHAR(7),
	salary INT,
	CONSTRAINT fk_employee
		FOREIGN KEY(emp_no)
		REFERENCES employees(emp_no)
		ON DELETE CASCADE);


--Create dept_emp table to link employees table to department table.
--Foreign Key emp_no references employees table.
--Foreign Key dept_no references department table. 
DROP TABLE IF EXISTS dept_emp CASCADE;

CREATE TABLE dept_emp (
	emp_no CHAR(7),
	dept_no char(4), 
	CONSTRAINT fk_emp_no
		FOREIGN KEY(emp_no)
		REFERENCES employees(emp_no)
		ON DELETE CASCADE,
	CONSTRAINT fk_dept_no
		FOREIGN KEY(dept_no)
		REFERENCES departments(dept_no)
		ON DELETE CASCADE);


--Create dept_manager table to link department table to employees table.
--Foreign Key dept_no references department table.
--Foreign Key emp_no references employees table. 
DROP TABLE IF EXISTS dept_manager CASCADE;

CREATE TABLE dept_manager (
	dept_no CHAR(4),
	emp_no CHAR(7),
	CONSTRAINT fk_dept_no_manager
		FOREIGN KEY(dept_no)
		REFERENCES departments(dept_no)
		ON DELETE CASCADE,
	CONSTRAINT fk_emp_no_manager
		FOREIGN KEY(emp_no)
		REFERENCES employees(emp_no)
		ON DELETE CASCADE);

