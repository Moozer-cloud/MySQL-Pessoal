use company;
show tables;

-- Dnumber: Departament e dept_locations
desc departament;
desc dept_locations;

select * from departament;
select * from dept_locations;

-- Retirar a ambiguidade através do Alias ou AS Statement
select Dname, l.Dlocation as departament_name
	from departament as d, dept_locations as l
    where d.Dnumber = l.Dnumber;
    
select * from employee;
-- Concatenar informações
select concat(Fname, ' ', Minit, ' ', Lname) as Employee from employee;