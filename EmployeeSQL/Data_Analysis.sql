--Data Analysis

--1) List the employee number, last name, first name, sex, and salary of each employee.
--Requires joining employees and salaries tables.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees as emp
JOIN salaries as sal
	ON emp.emp_no = sal.emp_no;

--2)List the first name, last name, and hire date for the employees who were hired in 1986.
--Requires selecting the year from hire_date to compare to 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986;

--3)List the manager of each department along with their department number, department name, employee number, last name, and first name.
--Requires joining dept_manager, departments, and employees tables. 
SELECT dm.dept_no, dept.dept_name, dm.emp_no, emp.last_name, emp.first_name
FROM dept_manager as dm
JOIN departments as dept
	ON dm.dept_no = dept.dept_no
JOIN employees as emp
	ON dm.emp_no = emp.emp_no;
	
--4)List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
--Requires joining employees, dept_emp, and departments tables. 
SELECT de.dept_no, emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees as emp
JOIN dept_emp as de
	ON emp.emp_no = de.emp_no
JOIN departments as dept
	ON de.dept_no = dept.dept_no;
	
--5)List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6)List each employee in the Sales department, including their employee number, last name, and first name.
--Requires joining employees, dept_emp, and departments tables. 
--I added the dept_name column to show table is filtered on 'Sales'.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees as emp
JOIN dept_emp as de
	ON emp.emp_no = de.emp_no
JOIN departments as dept
	ON de.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales';

--7)List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
--Requires joining employees, dept_emp, and departments tables. 
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees as emp
JOIN dept_emp as de
	ON emp.emp_no = de.emp_no
JOIN departments as dept
	ON de.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales' OR dept.dept_name = 'Development';

--8)List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
--I added a second sort to list names in alphabetical order after sorted by count.
SELECT last_name, COUNT(*) AS Num
FROM employees
GROUP BY last_name
ORDER BY Num DESC, last_name ASC;