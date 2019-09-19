--Question #1 - List the following details of each employee: employee number, last name, first name, gender, and salary.
-- Perform an INNER JOIN on the employees and salaries tables
Select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

--Question #2 - List employees who were hired in 1986.
SELECT hire_date, emp_no, last_name, first_name
FROM employees
where hire_date >= '1986-01-01'
    and hire_date <= '1986-12-31'
	ORDER BY last_name, first_name ASC;
            
--Question #3 - List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
-- Perform an INNER JOIN on the dept_manager, departments and employees tables.
SELECT DM.dept_no, D.dept_name, DM.emp_no, E.last_name, E.first_name, DM.from_date, DM.to_date
FROM dept_manager as DM
  JOIN departments as D ON DM.dept_no = D.dept_no
  JOIN employees as E ON DM.emp_no = E.emp_no; 


--Question #4 - List the department of each employee with the following information: employee number, last name, first name, and department name.
--employees, dept_emp, and departments
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
	FROM dept_emp as DE
		JOIN employees as E ON DE.emp_no=E.emp_no
		JOIN departments as D ON D.dept_no=DE.dept_no
		ORDER BY dept_name, last_name, first_name ASC;


--Question #5 - List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Question #6 - List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as DE
INNER JOIN employees as E ON DE.emp_no=E.emp_no
INNER JOIN departments as D ON D.dept_no=DE.dept_no
WHERE dept_name='Sales'
ORDER BY last_name, first_name ASC;

--Question #7 - List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
--join data from employees, dept_emp and departments tables. filter on Sales and Development department.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as DE
INNER JOIN employees as E ON DE.emp_no=E.emp_no
INNER JOIN departments as D ON D.dept_no=DE.dept_no
WHERE dept_name='Sales'
OR dept_name='Development'
ORDER BY last_name, first_name ASC;


--Question #8 - In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "last name count"
FROM employees
GROUP BY last_name
ORDER BY "last name count" DESC;

