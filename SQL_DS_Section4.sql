
/* Review the columns available in employees_cat_reg view */
select
  *
from
  employees_cat_reg
limit
  10;

/* Select nubmer of employees by region_name and country */
select
   region_name, country, count(*)
from
   employees_cat_reg
group by
   region_name, country
order by
   country, region_name;


/* Use rollup operation on the group by clause to create hierarchical sums */
select
   region_name, country, count(*)
from
   employees_cat_reg
group by
   rollup (country, region_name)
order by
   country, region_name;


/* Use cube operation on the group by clause to create all possible combination of sets of grouping columns */
select
   category, region_name,  count(*)
from
   employees_cat_reg
group by
   cube (category, region_name);


/* Review a few columns from the employees table */
select
   last_name, job_title, salary
from
   employees;

/*  Use order by and fetch first to limit the number of rows returned */
select
   last_name, job_title, salary
from
   employees
order by
   salary desc
fetch first
   10 rows only;

/* Select a simple column - aggregrate combination */
select
   category, count(*)
from
   employees_cat_reg
group by
   category;

/* Select with a sort order */
select
   category, count(*)
from
   employees_cat_reg
group by
   category
order by
   count(*);

/* Set the sort order to descending */
select
   category, count(*)
from
   employees_cat_reg
group by
   category
order by
   count(*) desc;

/* Use fetch first with order by to select top 5 divisions by employees count */
select
   category, count(*)
from
   employees_cat_reg
group by
   category
order by
   count(*) desc
fetch first
   5 rows only;

/*  highest salary by department in each row */
select
   department,
   last_name,
   salary,
   first_value(salary) over (partition by department order by salary desc)
from
   employees;

/* ...  order by last_name*/
select
  department,
  last_name,
  salary,
  first_value(salary) over (partition by department order by last_name)
from
  employees;

/* Use ntiles to assign bucket to rows */
select
   department,
   salary,
   ntile(4) over (partition by department order by salary desc) as quartile
from
   employees;

/* Select individual salary and average department salary */
select
   department,
   last_name,
   salary,
   avg(salary) over (partition by department)
from
   employees;

/* Use a windowing operation with max and min functions */
select
   department,
   last_name,
   salary,
   max(salary) over (partition by department)
from
   employees;

select
   region_name,
   last_name,
   salary,
   min(salary) over (partition by region_name)
from
   employees_cat_reg;


