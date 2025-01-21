create database projects;
use projects;

select * from hr limit 10;

/*Data Cleaning*/
alter table hr
change column ï»¿id emp_id varchar(20) null;

describe hr;

select birthdate from hr;

set sql_safe_updates = 0;

update hr
set birthdate = case
	when birthdate like '%/%' then
	date_format(str_to_date(birthdate, '%m/%d/%Y'),'%Y-%m-%d')
	when birthdate like '%-%' then
	date_format(str_to_date(birthdate, '%m-%d-%Y'),'%Y-%m-%d')
	else null
end;

alter table hr
modify column birthdate DATE;

select birthdate from hr limit 10;


update hr
set hire_date = case
	when hire_date like '%/%' then
	date_format(str_to_date(hire_date, '%m/%d/%Y'),'%Y-%m-%d')
	when hire_date like '%-%' then
	date_format(str_to_date(hire_date, '%m-%d-%Y'),'%Y-%m-%d')
	else null
end;


select hire_date from hr limit 10;

alter table hr
modify column hire_date DATE;



UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate from hr limit 30;

SET sql_mode = 'ALLOW_INVALID_DATES';

alter table hr
modify column termdate DATE;

describe hr;
select * from hr limit 10;

## Calculating Age Column
alter table hr add column age int;

update hr
set age = timestampdiff(year, birthdate, CURDATE());

select birthdate, age from hr limit 10;

select
min(age) as youngest,
max(age) as oldest
from hr limit 10;


SELECT COUNT(*) from hr
where age < 18;
	