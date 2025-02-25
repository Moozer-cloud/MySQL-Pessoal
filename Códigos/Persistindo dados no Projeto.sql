-- inserção de dados no bd company

use company;
show tables;

insert into employee values ('Moozer', 'C', 'Veiga', 123456789, '1991-12-25', 'Br116 Km39', 'M', 5000, null, 5);
insert into employee values ('Madalena', 'C', 'Veiga', 213456789, '1965-01-03', 'Br116 Km39', 'M', 8000, 123456789, 5),
							('Jose', 'O', 'Veiga', 312456789, '1965-07-16', 'Br116 Km39', 'F', 10000, 123456789, 5),
                            ('Junior', 'M', 'Charles', 412356789, '1998-10-21', 'Br116 Km39', 'M', 15000, 312456789, 5);
insert into employee values ('Alberto', 'D', 'Rodrigues', 112233445, '1990-01-15', 'Teresópolis', 'M', 15000, null, 5);
select * from employee;

-- update employee set Address='Br116 Km39,5 Posto V.P.' where Fname ='Junior';

insert into departament values ('Programador', 1, 123456789, '2025-02-01');
insert into departament values ('Empresária', 2, 123456789, '2025-02-01'),
							   ('Agricultor', 3, 123456789, '2025-02-01'),
                               ('Eletricista', 4, 312456789, '2025-02-01');
insert into departament values ('Programador.2', 5, 123456789, '2025-02-01');

select * from departament;

insert into dept_locations values (1, 'Br116 Km39');
insert into dept_locations values (2, 'Br116 Km39'),
								  (3, 'Br116 Km39'),
                                  (4, 'Br116 Km39');
insert into dept_locations values (5, 'Delfim Morreira');
select * from dept_locations;

insert into project values ('SQL', 1, 'BR116 km39', 1);
insert into project values ('Casa', 2, 'BR116 km39', 2),
						   ('Dinheiro', 3, 'BR116 km39', 3),
                           ('Carro', 4, 'BR116 km39', 4);
insert into project values ('SQL.2', 5, 'Delfim Morreira', 5);
select * from project;

insert into work_on values (123456789, 1, 8);
insert into work_on values (123456789, 2, 8),
						   (123456789, 3, 8),
                           (312456789, 4, 8);
insert into work_on values (312456789, 5, 5);
select * from work_on;

insert into dependent values (123456789, 'Hadassa F Almada', 'F', '2003-11-25', 'Namorada');
insert into dependent values (412356789, 'Clarisse', 'F', '2018-01-15', 'Filha'),
							 (412356789, 'Lorrane', 'F', '1995-03-01', 'Esposa');
select * from dependent;

-- gerente e seu departamento
select Ssn, Fname, Dname from employee e, departament d where (e.Ssn = d.Mgr_ssn);

-- Dependente e seu Responsável
select Fname, Dependent_name, Relationship from  employee, dependent where Essn = Ssn;