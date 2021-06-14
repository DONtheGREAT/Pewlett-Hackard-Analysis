-- Creating tables for PH-EmployeeDB.
--data type for varchar includes how many charcaters allowed.
--not null meaning no null fields will be allowed.
--unique constraint ensures that if the table were to be updated in the future, nothing will be duplicated.
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
	-- ); indicates that create table is complete.
	-- You can run code once, then highlight the exact code you want to run to avoid errors.
);
CREATE TABLE employees (
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);
CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	-- PRIMARY KEY (emp_no)
  --Primary key had to be removed from titles because emp_no column had duplicates due to employees having worked multiple positions since being with the company.
  --Therefore the titles table will not used as a primary key for any other table because it does not have unique values.
  --The table had to be removed and created again becaue SQL doesnt allow for duplicates or overrides. THANKFULLY!
  --DROP TABLE 'table_name' CASCADE; cascade inidicates remove the connections to other tables in database.
);
CREATE TABLE dept_employees (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);
--SELECT statement tells Postgres that we're about to query the database.
--asterisk tells Postgres that we're looking for every column in a table.
--FROM departments tells pgAdmin which table to search
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM dept_employees;
SELECT * FROM titles;
