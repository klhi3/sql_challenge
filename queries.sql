--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
-- details of each employee
-- last salary
select e.emp_no, last_name, first_name, gender, ss.salary
from employees e
left join(
select s.emp_no, s.salary 
from salaries s 
inner join
(select emp_no, max(to_date) as MAXDATE
from salaries 
group by emp_no
) sm 
on s.emp_no = sm.emp_no
and s.to_date = sm.MAXDATE
) ss
on e.emp_no = ss.emp_no
order by e.emp_no;

--2. List employees who were hired in 1986.
-- hired 1986
select emp_no, hire_date
from employees
where extract('year' from hire_date) = 1986
order by emp_no;

--3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
--dept : 9 , total_manager : 24  => find last manager
select dm.dept_no, dept_name, e.emp_no, last_name, first_name, dm.from_date, dm.to_date
from dept_manager dm, employees e, departments d
where dm.to_date > now()   -- current managers
and dm.emp_no = e.emp_no
and dm.dept_no = d.dept_no
order by dept_no

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
-- current employees : 240124
select e.emp_no, last_name, first_name, dept_name
from employees e, dept_emp de, departments d
where e.emp_no = de.emp_no
and de.to_date > now()  -- current employees
and de.dept_no = d.dept_no
order by de.dept_no, e.emp_no
;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
-- total = 20
select * 
from employees
where first_name = 'Hercules'
and last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- total of current employees = 37701
select e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de
inner join employees e
on de.emp_no = e.emp_no
and de.to_date > now()  -- current employees
inner join departments d
on de.dept_no = d.dept_no
and d.dept_name = 'Sales'
;

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- total of current employees = 99087
select e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de
inner join employees e
on de.emp_no = e.emp_no
and de.to_date > now()  -- current employees
inner join departments d
on de.dept_no = d.dept_no
and d.dept_name in ('Sales', 'Development')
;

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-- total of last_name = 1638
select last_name, count(*)
from employees
group by last_name
order by last_name DESC
;





