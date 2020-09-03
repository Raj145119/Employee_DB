CREATE TABLE departments (
	dept_no VARCHAR(255) NOT NULL,
	dept_name VARCHAR(255) NOT NULL,
	constraint DEPARTMENTS_PK PRIMARY KEY (dept_no));


CREATE TABLE dept_emp (
	emp_no DOUBLE PRECISION NOT NULL,
	dept_no VARCHAR(255) NOT NULL,
	constraint DEPT_EMP_PK PRIMARY KEY (emp_no,dept_no));


CREATE TABLE dept_manager (
	dept_no VARCHAR(255) NOT NULL,
	emp_no DOUBLE PRECISION NOT NULL,
	constraint DEPT_MANAGER_PK PRIMARY KEY (dept_no,emp_no));

CREATE TABLE employees (
	emp_no DOUBLE PRECISION NOT NULL,
	emp_title_id VARCHAR(255) NOT NULL,
	birth_date TIMESTAMP(0) NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	sex VARCHAR(255) NOT NULL,
	hire_date TIMESTAMP(0) NOT NULL,
	constraint EMPLOYEES_PK PRIMARY KEY (emp_no));


CREATE TABLE salaries (
	emp_no DOUBLE PRECISION NOT NULL,
	salary DOUBLE PRECISION NOT NULL,
	constraint SALARIES_PK PRIMARY KEY (emp_no));


CREATE TABLE titles (
	title_id VARCHAR(255) NOT NULL,
	title VARCHAR(255) NOT NULL,
	constraint TITLES_PK PRIMARY KEY (title_id));

ALTER TABLE dept_emp ADD CONSTRAINT dept_emp_fk0 FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
ALTER TABLE dept_emp ADD CONSTRAINT dept_emp_fk1 FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT dept_manager_fk0 FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
ALTER TABLE dept_manager ADD CONSTRAINT dept_manager_fk1 FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE employees ADD CONSTRAINT employees_fk0 FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);

ALTER TABLE salaries ADD CONSTRAINT salaries_fk0 FOREIGN KEY (emp_no) REFERENCES employees(emp_no);


insert into departments values('d001','Marketing');
insert into departments values('d002','Finance');
insert into departments values('d003','Human Resources');
insert into departments values('d004','Production');
insert into departments values('d005','Development');
insert into departments values('d006','Quality Management');
insert into departments values('d007','Sales');
insert into departments values('d008','Research');
insert into departments values('d009','Customer Service');

insert into titles values('s0001','Staff');
insert into titles values('s0002','Senior Staff');
insert into titles values('e0001','Assistant Engineer');
insert into titles values('e0003','Senior Engineer');
insert into titles values('e0004','Technique Leader');
insert into titles values('m0001','Manager');

insert into employees values('10001','s0001',DATE '1997-03-19','Arvind','Slobodova','M',DATE '2020-9-2');
insert into employees values('10002','s0001',DATE '1997-3-19','Arvind','Slobodova','M',DATE '2020-9-20');
insert into employees values('10003','s0002',DATE '1996-3-19','Raj','Anand','M',DATE '2020-7-20');
insert into employees values('10004','m0001',DATE '1997-3-19','Aditya','Singh','M',DATE '2020-9-27');
insert into employees values('10005','e0003',DATE '1999-3-19','Sanjeet','Slobodova','M',DATE '2019-4-22');
insert into employees values('10006','e0003',DATE '1999-3-19','Sanjeet','Slobodova','M','2019-4-13');

insert into dept_emp values('10001','d005');
insert into dept_emp values('10002','d001');
insert into dept_emp values('10003','d003');
insert into dept_emp values('10004','d004');
insert into dept_emp values('10005','d002');
insert into dept_emp values('10002','d005');
insert into dept_emp values('10004','d006');
insert into dept_emp values('10005','d007');

insert into dept_manager values ('d003','10003');
insert into dept_manager values ('d004','10004');
insert into dept_manager values ('d002','10005');
insert into dept_manager values ('d001','10003');
insert into dept_manager values ('d005','10001');
insert into dept_manager values ('d004','10003');
insert into dept_manager values ('d003','10002');
insert into dept_manager values ('d007','10005');

insert into salaries values(10001,20000);
insert into salaries values(10002,3400);
insert into salaries values(10003,20500);
insert into salaries values(10004,60000);
insert into salaries values(10005,12000);


1.select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name FROM departments JOIN dept_manager ON departments.dept_no = dept_manager.dept_no JOIN employees ON dept_manager.emp_no = employees.emp_no;

2.select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name from dept_emp JOIN employees ON dept_emp.emp_no = employees.emp_no JOIN departments ON dept_emp.dept_no = departments.dept_no;

3.select first_name,last_name,sex from employees where first_name='Sanjeet' AND last_name like 'S%';

4.select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name from dept_emp JOIN employees ON dept_emp.emp_no = employees.emp_no JOIN departments ON dept_emp.dept_no = departments.dept_no WHERE departments.dept_name = 'Sales';

5.select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name from dept_emp JOIN employees ON dept_emp.emp_no = employees.emp_no JOIN departments ON dept_emp.dept_no = departments.dept_no WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

6.select last_name, COUNT(last_name) AS "frequency" from employees GROUP BY last_name ORDER BY COUNT(last_name) DESC;