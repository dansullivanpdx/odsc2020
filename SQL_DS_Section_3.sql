/* Select name, salary and department from employees table */
select
   last_name,
   salary,
   department
from
   employees;

/* Use an alias on the table name */
select
   e.last_name,
   e.salary,
   e.department
from
   employees e;

/* Calculate department's average salary in each row with employees */
 select
  e1.last_name,
  e1.salary,
  e1.department,
  (select round(avg(salary)) from employees e2 where e1.department = e2.department) dept_avg
from
  employees e1;

/* Find the average of executive salaries, defined as salaries > 125,000 */
select
   department,
   round(avg(salary))
from
    (select
         e2.department,
         e2.salary
     from
         employees e2
     where
         salary > 125000) e1
group by
    department;


/* Select the department that has the employee with the highest salary */
select
  e1.department
from
  employees e1
where
  (select max(salary) from employees e2) = salary;


/* Select all columns in the category table to review contents of the table */
select
  *
from
  dept_category;


/* And get a count to understand the size of the table */
select
  count(*)
from
  dept_category;


/* Join employees and department. If the employees department is not found in */
/* dept_category, then no row will be returned. */
select
   s.last_name, s.department, dc.category
from
   employees s
join
   dept_category dc
on
   s.department = dc.department;

/* The previous query did not return 1,000 rows. What rows are missing? */
select distinct
   department
from
   employees
where
   department not in
     (select
         department
      from
         dept_category);

/* Use an outer join to return all rows, even it a corresponding row in */
/* company_divsion does not exist. */

select
   s.last_name, s.department, dc.category
from
   employees s
left join
   dept_category dc
on
   s.department = dc.department;


   
/* Create a view joining employees and dept_category */
create or replace view employees_cat_reg as
   select
     s.*, dc.category, r.region_name, r.country
   from
     employees s
   left join
     dept_category dc
   on
     s.department = dc.department
   left join
     regions r
   on
      s.region_id = r.region_id;

/* Verify the results of the view */
select
  count(*)
from
  employees_cat_reg;


/* Get the number of employees in each division within each region */
select
   category, region_name, count(*)
from
   employees_cat_reg
group by
   category, region_name;


/* Add an order by clause to make it easier to read */
select
   category, region_name, count(*)
from
   employees_cat_reg
group by
   category, region_name
order by
   category, region_name;

/* Get employee counts by division and by region */
select
  category, region_name, count(*)
from
   employees_cat_reg
group by
   grouping sets (category, region_name)
order by
   category, region_name;


   
