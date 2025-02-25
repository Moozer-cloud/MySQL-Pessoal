-- Projeto COMPANY

create schema if not exists company;
use company;

create table company.employee(
	Fname varchar(20) not null,
    Minit char,
    Lname varchar(20) not null,
    Ssn char(9) not null,
    Bdate date,
    Address varchar(40),
    Sex char,
    Salary decimal(10,2),
    Super_Ssn char(9),
    Dno int not null,
    constraint pk_employee primary key (Ssn)
);

alter table employee
	add constraint chk_Salary_employee check (Salary> 2000.0);


create table departament(
	Dname varchar(20) not null,
    Dnumber int not null,
    Mgr_Ssn char(9),
    mgr_start_date date,
    primary key (Dnumber),
    unique (Dname),
    foreign key (Mgr_Ssn) references employee(Ssn)
);

create table dept_locations(
	Dnumber int not null,
    Dlocation varchar(20) not null,
    primary key (Dnumber, Dlocation),
    foreign key (Dnumber) references departament(Dnumber)
);

-- Comandos para alterações depois das tabelas criadas
alter table dept_locations drop constraint dept_locations_ibfk_1;

alter table dept_locations
	add constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber)
    on delete cascade
    on update cascade;
    
create table project(
	Pname varchar(20) not null,
    Pnumber int not null,
    Plocation varchar(20),
    Dnum int not null,
    primary key (Pnumber),
    unique (Pname),
    foreign key (Dnum) references departament(Dnumber)
);

create table work_on(
	Essn char(9) not null,
    Pno int not null,
    Hours decimal(3,1) not null,
    primary key (Essn, Pno),
    foreign key (Essn) references employee(Ssn),
    foreign key (Pno) references project(Pnumber)
);

-- drop tables dependent; Removi a tabela interia devido inserção incorreta dos dados
create table dependent(
	Essn char(9) not null,
    Dependent_name varchar(20) not null,
    Sex enum('M', 'F'),
    Bdate date,
    Relationship varchar(10),
    primary key (Essn, Dependent_name),
    foreign key (Essn) references employee(Ssn)
);

select * from employee;

select * from information_schema.table_constraints
	where constraint_schema = 'company';

-- select (Fname, Lname, Salary) são as colunas/atributos que quero puxar
-- Salary*0.011 estou multiplicando meu atributo
-- Round (atributos, 2) para gerar soemnte duas casas decimais
-- as 'INSS' estou criando um novo atributo (INSS)
-- from employee em employee, na table selecionada
select Fname, Lname, Salary, round(Salary*0.011, 2) as 'INSS' from employee;

select concat(Fname, ' ', Minit, ' ', Lname) as Nome, ssn, salary
	from employee e, work_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno = p.Pnumber);
    
    select concat(Fname, ' ', Minit, ' ', Lname) as Nome, Ssn, Address, Salary, Dno
		from employee
        where (salary between 8000 and 20000);
-- Between busca intervalos entre números, exemplo acima de salários de 8000 a 20000

select concat(Fname, ' ', Lname) as Nome, Dname, Address as Department_Name from employee, departament
	where (Dno=Dnumber and Address like '%Br116%');

-- Exemplo acima é de Like utilizando % que significa qualquer quantidade, se fosse _ seria somente 1 caracter
    
