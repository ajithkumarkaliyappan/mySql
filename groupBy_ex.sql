show databases;
create database assignments;
-- drop database assignments;
use assignments;
create table employees(employee_id int primary key, first_name varchar(20), last_name varchar(20), email varchar(30),
 phone_number varchar(15), hire_date date,job_id varchar(20), salary float, commission_pct float default 0.00 ,
 manager_id int not null,department_id int not null );
insert into employees values(100,'steven','king','sking', '515_123_4567' , '1987-06-17','ad_pres',24000.00,0,0,90);
insert into employees values(101,'neena','kochhar','nkochhar', '515_123_4568' , '1987-06-18','ad_vp',17000.00,0,100,90);
insert into employees values(102,'lex','de haan','ldehaan', '515_123_4569' , '1987-06-19','ad_vp',17000.00,0,100,90);
insert into employees values(103,'alexander','hunold','ahunold', '515_123_4567' , '1987-06-20','it_prog',9000.00,0,102,60);
insert into employees values(104,'bruce','ernst','bernst', '515_123_4568' , '1987-06-21','it_prog',6000.00,0,103,60);
insert into employees values(105,'david','austin','daustin', '515_123_4569' , '1987-06-22','it_prog',4800.00,0,103,60);
insert into employees values(106,'valli','pataballa','vpatabal', '515_123_4560' , '1987-06-23','it_prog',4800.00,0,103,60);
insert into employees values(107,'diana','lorentz','dlorentz', '515_123_5567' , '1987-06-24','it_prog',4200.00,0,103,60);
insert into employees values(108,'nancy','greenberg','ngreenbe', '515_123_4569' , '1987-06-25','fi_mgr',12000.00,0,101,100);
insert into employees values(109,'daniel','faviet','dfaviet', '515_123_4169' , '1987-06-26','fi_account',9000.00,0,108,100);
insert into employees values(110,'john','chen','jchen', '515_123_4269' , '1987-06-27','fi_account',8200.00,0,108,100);
insert into employees values(111,'ismael','sciarra','isciarra', '515_123_4369' , '1987-06-28','fi_account',7700.00,0,108,100);
insert into employees values(112,'jose manuel','urman','jmurman', '515_123_4469' , '1987-06-29','fi_account',7800.00,0,108,100);
insert into employees values(113,'luis','popp','lpopp', '515_123_4567' , '1987-06-30','fi_account',6900.00,0,108,100);
insert into employees values(114,'den','raphaely','drapheal', '515_123_4561' , '1987-07-01','pu_man',11000.00,0,100,30);
insert into employees values(115,'alexander','khoo','akhoo', '515_123_4562' , '1987-07-02','pu_clerk',3100.00,0,114,30);
select *from employees;
-- 1. Write a query to list the number of jobs available in the employees table
select job_id from employees group by job_id;
-- 2. Write a query to get the total salaries payable to employees.
select sum(salary) as total_salary from employees group by commission_pct;     
-- 3. Write a query to get the minimum salary from employees table.     
select min(salary) as minimum_salary from employees;
-- 4. Write a query to get the maximum salary of an employee working as a Programmer.  
   select max(salary) as maximum_salary from employees where job_id='it_prog';
-- 5. Write a query to get the average salary and number of employees working the department 90.     
select avg(salary) as avg_salary, count(employee_id) from employees where department_id = 90;
-- 6. Write a query to get the highest, lowest, sum, and average salary of all employees. 
select max(salary), min(salary), sum(salary), avg(salary) from employees;    
-- 7. Write a query to get the number of employees with the same job.    
select job_id, count(employee_id) from employees group by job_id;
-- 8. Write a query to get the difference between the highest and lowest salaries. 
select max(salary), min(salary), max(salary)-min(salary) as diff_salary from employees;    
-- 9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.  
select manager_id, salary from employees where salary=(select min(salary) from employees) ;    
-- 10. Write a query to get the department ID and the total salary payable in each department.   
select sum(salary) , department_id from employees group by department_id;
-- 11. Write a query to get the average salary for each job ID excluding programmer. 
select sum(salary) , job_id from employees where job_id != 'it_prog' group by job_id     ;
-- 12. Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
select sum(salary), max(salary), min(salary), avg(salary) , job_id from employees where department_id = 90 group by job_id;    
-- 13. Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000. 
select job_id, max(salary) from employees where salary >= 4000;    
-- 14. Write a query to get the average salary for all departments employing more than 10 employees. 
select avg(salary), department_id from employees where  10 <any (select count(employee_id) from employees group by job_id);
           