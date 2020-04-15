/* Simple select statement */
select * from employees;


/* Count rows */
select count(*) from employees;

/* Count employees by department */
select
   count(*)
from
   employees
group by
   department;


/* Count employees in each department */
select
   department, count(*)
from
   employees
group by
   department;


/* Query the max and min salaries */
select
   max(salary)
from
   employees;

select
   min(salary)
from
   employees;

select
   min(salary), max(salary)
from
   employees;


/* Query both the minimum and maximum salary in each department */
select
   department, min(salary), max(salary)
from
   employees
group by
   department;

/* Query the minimum and maximum salary in each department */
select
   department, min(salary), max(salary)
from
   employees
group by
   department;

/* Return the first 12 rows */
select * from employees limit 12;

/* Calculate the total amount of salary paid to all employees */
select sum(salary) from employees;

/* Calculate the total amount of salary */
select
  department, sum(salary)
from
  employees
group by
  department;

/* Calculate the total and mean amount of salaries */
select
   department, sum(salary), avg(salary)
from
  employees
group by
   department;

/* Calculate the total, mean, and variance of salary */
select
  department, sum(salary), avg(salary), var_pop(salary)
from
  employees
group by
  department;

/* Calculate the total, average, mean, variance and standard deviation of salary */
select
   department, sum(salary), avg(salary), var_pop(salary), stddev_pop(salary)
from
  employees
group by
  department;

/* Same as previous query but display only 2 decimal points*/
select
  department, sum(salary), avg(salary), round(var_pop(salary),2), round(stddev_pop(salary),2)
from
  employees
group by
  department;

/* Query with a condition on salary */
select
  last_name, department, salary
from
  employees
where
  salary > 100000;


/* Query with a condition on department */
select
    last_name, department, salary
from
    employees
where
    department = 'Games';


/* Query based on department and salary using, both must be true*/
select
  last_name, department, salary
from
  employees
where
  department = 'Games'
and
  salary > 100000;


select
  last_name, department, salary
from
  employees
where
  department = 'Games'
or
  department = 'Sports';


/* Query based on patterns in varchar columns, single character match */
select
  department, sum(salary)
from
  employees
where
  department like 'S%'
group by
  department;

/* Query based on patterns in varchar columns, 2 consecutive character match */
select
  department, sum(salary)
from
  employees
where
  department like 'Sp%'
group by
  department;


/* Query based on patterns in varchar columns, 2 character match */
select
  department, sum(salary)
from
  employees
where
  department like 'S%s'
group by
  department;
