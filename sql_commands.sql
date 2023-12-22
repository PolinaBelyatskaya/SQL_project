use it_company;
insert into companies(name, field) values ('Google', 'IT'), ('Yandex', 'IT');
insert into companies (name, field) values ('Instagram', 'social network');

select id as company_id, name as company_name, field as field_name from companies;

alter table offices rename column adress_id to address_id;


insert into countries (name) values ('USA'), ('GB'), ('Poland');
insert into addresses (street, building, appartment, country_id) values ('Main', 5, 25, 2), ('5th Ave', 34, 2, 1), ('Central', 7, 44, 3);
insert into offices (area, address_id, companies_id) values (40.345, 2, 3), (200.123, 3, 1), (150.343, 1, 2);
insert into departments (name, offices_id) values ('QA', 1), ('AQA', 1), ('Development', 1), ('QA', 2), ('AQA', 2), ('Development', 2), ('QA', 3), ('AQA', 3), ('Development', 3);
insert into work_record_books (start_date, end_date, companies_id) values ('2018-01-01 08:00:00', '2025-01-01 08:00:00', 2), ('2015-02-10 09:00:00', '2020-01-01 08:00:00', 3), ('2020-07-26 11:34:45', '2024-01-01 08:00:00', 1);
insert into passes (number) values (123), (234), (345);
insert into salaries (amount) values (1500), (2000), (3500);
insert into positions (name, salaries_id) values ('QA engenier', 1), ('AQA engenier', 2), ('Developer', 3);
insert into employees (first_name, last_name, work_record_book_id, department_id, position_id, passes_id) values ('John', 'Smith', 2, 3, 1, 3), ('Jack', 'Johnsin', 3, 1, 2, 2), ('Ella', 'Snow', 1, 2, 3, 1);
insert into devices (brand, os, employees_id) values ('Apple', 'Mac OS', 1), ('Samsung' , 'Android', 3), ('HP', 'Windows', 2);
insert into credentials (email, password, employees_id) values ('jjohnsin@gmail.com', '12345', 2), ('jsmith@gmail.com', '54321', 1), ('esnow@gmail.com', '98765', 3);
insert into projects (name) values ('A&A'), ('T&M'), ('YTaxi');
insert into offers (employees_id, projects_id) values (2, 1), (3, 2), (1, 3);

update offers set employees_id = 1 where employees_id = 2;


select d.id as department_id, d.name as department_name,
e.id as employee_id, e.first_name as employee_first_name, e.last_name as employee_last_name
from departments d inner join employees e on e.department_id = d.id
inner join offers o on o.employees_id = e.id
inner join projects p on p.id = o.projects_id;

select e.id as employee_id, e.first_name as employee_first_name, e.last_name as employee_last_name,
p.id as project_id, p.name as project_name
from employees e left join offers o on e.id = o.employees_id
left join projects p on p.id = o.projects_id
order by employee_first_name;

select e.id as employee_id, e.first_name as employee_first_name, e.last_name as employee_last_name,
p.id as project_id, p.name as project_name
from employees e right join offers o on e.id = o.employees_id
right join projects p on p.id = o.projects_id;

insert into projects (name) values ('A&A');
insert into offers (employees_id, projects_id) values (3, 4);

select e.first_name as employee_first_name, e.last_name as employee_last_name,
count(p.name) as project_number from employees e left join offers o on e.id = o.employees_id
left join projects p on p.id = o.projects_id where e.first_name like 'J%' group by e.first_name, e.last_name having project_number < 2;

select s.id, s.amount as salary, p.name as position, count(p.name) as position_count from salaries s
left join positions p on p.salaries_id = s.id group by s.id, s.amount, p.name having salary >= 2000;

select p.id, p.name, count(p.name) as salary
from positions p left join salaries s on s.id = p.salaries_id group by p.id, p.name having salary = 2000; 

select * from countries;
select last_name from employees;
select id, brand from devices;
select id, amount from salaries where amount >= 2000;
select id, first_name, last_name from employees where first_name like 'J%';
select id, first_name, last_name from employees where first_name ='John' or first_name = 'Jack';
select id, first_name, last_name from employees where first_name in ('Jack', 'Ella');
select id, first_name, last_name from employees where first_name ='John' and last_name = 'Smith';

alter table addresses add postal_code int not null default 0;
alter table addresses rename column postal_code to zip_code;
alter table addresses drop column zip_code;

alter table work_record_books add notes varchar(500) not null default 'no notes';
alter table work_record_books rename column notes to employer_notes;
alter table work_record_books drop column employer_notes;


insert into countries (name) values ('Belarus');
update countries set name = 'Argentina' where id = 4;
delete from countries where id = 4;

insert into addresses (street, building, appartment, country_id) values ('2d Street', 5, 25, 2);
update addresses set appartment = 7 where id = 4;
delete from addresses where id = 4;


insert into offices (area, address_id, companies_id) values (134.345, 4, 4);
update offices set area = 150.45 where id = 4;
delete from offices where id = 4;

insert into departments (name, offices_id) values ('Accounting', 4);
update departments set name = 'Security' where id = 4;
delete from departments where id = 4;

insert into work_record_books (start_date, end_date, companies_id) values ('2023-01-01 08:00:00', '2026-01-01 08:00:00', 2);
update work_record_books set start_date = '2019-04-20 08:00:00' where id = 4;
delete from work_record_books where id = 4;

insert into passes (number) values (9876);
update passes set number = 987 where id = 4;
delete from passes where id = 4;

insert into salaries (amount) values (30000);
update salaries set amount = 35000 where id = 4;
delete from salaries where id = 4;

insert into positions (name, salaries_id) values ('Accountant', 1);
update positions set salaries_id = 2 where id = 4;
delete from positions where id = 4;

insert into credentials (email, password, employees_id) values ('jj@gmail.com', '54321', 2);
update credentials set email = 'jj@yandex.ru' where id = 4;
delete from positions where id = 4;

insert into projects (name) values ('Post');
update projects set name = 'Post&Print' where id = 4;
delete from projects where id = 4;
