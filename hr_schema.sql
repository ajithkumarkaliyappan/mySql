
drop database hr;
create database hr;
use hr;
create table employees( first_name varchar(20) , last_name varchar(25) not null, email varchar(50) not null, phone_number varchar(20),hire_date date not null, salary int , commission_pct int);
create table countries (country_id varchar(10) primary key, country_name varchar(40) );
create table departments(department_id int primary key, department_name varchar(10) not null, manager_id int);
create table jobs(job_id varchar(10) primary key, job_title varchar(35) not null, min_salary int, max_salary int);
create table job_history(employee_id int , start_date date , end_date date not null, primary key(employee_id, start_date));
create table locations(location_id int primary key, street_adress varchar(40), postal_code varchar(12),city varchar(30) not null,state_province varchar(25));
create table regions( region_id int primary key, region_name varchar(24));
show tables;
desc job_history;
insert into regions values(100,'asia');
insert into regions values(101, 'europe');
insert into countries values('ind','india');
insert into countries values('pak', 'pakistan');
insert into  locations values(1,'street adress 1','635202','dharmauri','dharmapuri');
insert into  locations values(2,'street adress 2','636701','salem','salem');
insert into departments values(1,'hr',100);
insert into departments values(2,'dev',200);
insert into job_history values(10, '2021-01-02', '2020-01-02');
insert into job_history values(20, '2010-01-01', '2022-02-02');
insert into jobs values('dev','developer',20000,50000);
insert into jobs values('tr','tester',15000,30000);
insert into employees values('ajith','kumar','ajith@gmail.com','9688566307', '2022-03-05', 35000, 2000);
insert into employees values('hari','krishna','hari@gmail.com','9384968856', '2021-02-25', 22000, 1000);

select *from countries;

alter table countries add region_id int;
alter table countries add constraint countries_region_id_foreignkey foreign key(region_id) references regions(region_id);
insert into countries values('chin','china',100);
insert into countries values('uk','united kingdom', 101);
alter table locations add country_id varchar(10);
alter table locations add constraint locations_country_id_foreginkey foreign key(country_id) references countries(country_id);
insert into locations values(3,'street adress 3','635203','london','london','uk');
insert into  locations values(4,'street adress 4','635232','beijing','beijing','chin');
alter table departments add location_id int;
alter table departments add constraint departments_location_id_foreginkey foreign key(location_id) references locations(location_id);
insert into departments values(3,'hr',100,3);
insert into departments values(4,'dev',200,4);
alter table job_history add department_id int;
alter table job_history add constraint job_history_department_id_foreginkey foreign key(department_id) references departments(department_id);
insert into job_history values(12,'2021-01-02', '2022-03-22',3);
insert into job_history values(11, '2022-01-02', '2022-02-02',4);
alter table job_history add job_id varchar(10);
alter table job_history add constraint job_history_job_id_foreginkey foreign key(job_id) references jobs(job_id);
insert into job_history values(13,'2010-02-22','2022-02-02',3,'dev');
insert into job_history values(14,'2011-02-22','2021-02-02',4,'tr');

alter table employees add employee_id int;
alter table employees add constraint employees_employee_id_foreginkey foreign key(employee_id) references job_history(employee_id);
alter table employees add job_ide varchar(10);
alter table employees add constraint employees_job_id_foreginkey foreign key(job_ide) references jobs(job_id);
alter table employees add department_id int;
alter table employees add constraint employees_department_id_foreginkey foreign key(department_id) references departments(department_id);
insert into employees values('rohit','sharma','rohit@gmail.com','9688', '2007-03-05', 3500000, 20000,15,'analyst',300);
insert into employees values('virat','kholi','virat@gmail.com','93849', '2011-02-25', 2200000, 10000,16,'hr',400);
alter table employees add manager_id int;
alter table employees add constraint employees_manager_id_foreginkey foreign key(manager_id) references departments(manager_id);

select r.region_id, c.country_id, l.location_id, j.department_id, jo.job_id
 from regions r
inner join countries c
on r.region_id = c.region_id
inner join locations l
on c.country_id = l.country_id
inner join departments d
on l.location_id = d.location_id
inner join job_history j
on d.department_id = j.department_id
inner join jobs jo
on jo.job_id = j.job_id;

