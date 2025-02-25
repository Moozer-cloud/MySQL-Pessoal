-- JOIN STATEMENT
-- Join vai sempre eliminar as tabelas que não possuem dados em ambas as tabelas

select * from departament;

-- exemplo de where
select * from employee, work_on where Ssn = Essn;

-- JOIN
select * from employee join work_on;


-- JOIN ON -> INNER JOIN ON
select * from employee join work_on on ssn = essn;

select Fname, Lname, Address
	from (employee join departament on Dno=Dnumber)
    where Dname = Programador;

select Dname as Department, Mgr_start_date, Dlocation as Location
	from departament inner join dept_locations using (Dnumber)
    order by Department;


-- CROSS JOIN - PRODUTO CARTESIANO
select * from employee cross join dependent;


-- JOIN COM MAIS DE 2 TABELAS
-- project, work_on e employee
select concat(Fname, ' ', Lname) as Nome, Ssn as Identificador, Sex, Salary, Pname as NameProjeto, Pno, Plocation from employee
	inner join work_on on Ssn = Essn
    inner join project on Pno = Pnumber
    where Pname like 'S%'
    order by Pnumber;

-- departament, dept_location e employee
select * from departament
	inner join dept_locations using (Dnumber)
    inner join employee on Dno = Dnumber;

-- OUTER JOIN

select * from employee inner join dependent on Ssn = Essn;
select * from employee left join dependent on Ssn = Essn;
select * from employee left outer join dependent on Ssn = Essn;
-- Se reparar no MySQL consegue entender left join como left outer join

