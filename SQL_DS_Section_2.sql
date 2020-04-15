/* List departments in each row */
select
   department
from
   employees;

/* List each department name once */
select distinct
  department
from
  employees;


/* Change case of column value */
select distinct
   upper(department)
from
   employees;

select distinct
  lower(department)
from
  employees;


/* Manipulate Strings */

/* Concatenate two character strings */
select
  job_title || ':' || department
from
  employees;

/* Use alias to rename concatenated column */
select
   job_title || ':' || department  job_dept
from
   employees;


/* Use trim to remove trailing and leading spaces */
select
   trim('  Manager  ');

/* Show all job titles that start with Senior */
select
   job_title
from
   employees
where
  job_title like 'Senior%'


/* Create a new boolean column indicating if title includes 'Senior'*/
select
   job_title, (job_title like '%Senior%') is_senior
from
   employees;



/* Use a string of 12 characters for experimenting with string extraction */
   select
      'this is a test' test_string;

   /* Extract the first 5 characters */
   select
       substring('this is a test' from 1 for 5);


   /* Select a subset from the middle of the string */
   select
      substring('this is a test' from 5 for 3) test_string;

   /* Select a substring starting from the middle to the end of the string */
   select
      substring('this is a test' from 5) test_string;


   /* Select Senior job titles, and extract the main job category */
   select
      job_title, substring(job_title from 7) senior_employees
   from
      employees
   where
      job_title like 'Senior%';


   /* Replace a substring with another string using overlay */
   select
      overlay('this is a test' placing 'ABCD' from 3 for 4);


/* Query with regular expressions */

       /* Select list of unique job titles */
       select distinct
           job_title
       from
           employees;

       /* Select lis of job titles that begin with Assistant */
       select distinct
           job_title
       from
           employees
       where
          job_title like 'Assistant%';


       /* Select a list of job titles that include Assistant I, II or III but not IV*/
       /* | is the regular expression OR operator */
       select distinct
           job_title
       from
           employees
       where
          job_title similar to '%Assistant%(I)*';


       /* Select a list of job titles that include Assistant II or IV*/
       /* | is the regular expression OR operator */
       select distinct
           job_title
       from
           employees
       where
          job_title similar to '%Assistant%(II|IV)';



       /* Select a list of job titles that include Assistant II, IV or any other 2 character starting with I */
       /* | is the regular expression OR operator */
       select distinct
           job_title
       from
           employees
       where
          job_title similar to '%Assistant I_';

       /* Select a list of job titles that begin with E, P, or S */
       /* |[] are used to list characters that can match */
       select distinct
           job_title
       from
           employees
       where
          job_title similar to '[EPS]%';
          /* List average salaries by department */
          select
             department, avg(salary)
          from
             employees
          group by
              department;


/*  Reformatting numbers */

          /* Truncate decimal values toward zero */
          select
             department, avg(salary), trunc(avg(salary))
          from
             employees
          group by
              department;

          /* Truncate decimal values toward zero and round up when decimal portion > .5 */
          select
             department, avg(salary), trunc(avg(salary)), round(avg(salary))
          from
             employees
          group by
              department;


          /* Ceiling function returns smallest integer larger than it's input value */
          select
             department, avg(salary), trunc(avg(salary)), ceil(avg(salary))
          from
             employees
          group by
              department;

          /* Round can be used to round to a number of decimal places */
          select
             department, avg(salary), round(avg(salary), 2)
          from
             employees
          group by
              department;

          /* Trunc can be used to truncate to a number of decimal places */
          select
             department, avg(salary), round(avg(salary), 2), trunc(avg(salary), 2)
          from
             employees
          group by
              department;

          /* Both round and trunc can be used to truncate to a variable number of decimal places */
          select
             department, avg(salary), round(avg(salary), 3), trunc(avg(salary), 4)
          from
             employees
          group by
              department;
