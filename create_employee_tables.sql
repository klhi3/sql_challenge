DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (
  dept_no char(4) PRIMARY KEY,
  dept_name varchar(45) NOT NULL
);

CREATE TABLE employees (
    emp_no integer PRIMARY KEY,
    birth_date date,
    first_name varchar(45),
    last_name varchar(45),
    gender char(1),
    hire_date date
);

CREATE TABLE dept_emp (
  emp_no integer REFERENCES employees (emp_no)  ON DELETE CASCADE,
  dept_no char(4) REFERENCES departments (dept_no),
  from_date date,
  to_date date DEFAULT '9999-01-01' NOT NULL 
);

CREATE TABLE dept_manager(
  dept_no char(4) REFERENCES departments (dept_no),
  emp_no integer REFERENCES employees (emp_no)  ON DELETE CASCADE,
  from_date date,
  to_date date DEFAULT '9999-01-01' NOT NULL
  CHECK (from_date < to_date)
);

CREATE TABLE salaries (
  emp_no integer REFERENCES employees (emp_no) ON DELETE CASCADE,
  salary money NOT NULL,
  from_date date,
  to_date date DEFAULT '9999-01-01' NOT NULL
);

CREATE TABLE titles (
  emp_no integer REFERENCES employees (emp_no)  ON DELETE CASCADE,
  title varchar(45) NOT NULL,
  from_date date,
  to_date date DEFAULT '9999-01-01' NOT NULL
);


