show databases;
use first_example;
create table person(
	person_id smallint unsigned,
	fname varchar(20),
	lname varchar(20),
	gender enum('M','F'),
	birth_date DATE,
	street varchar(30),
	city varchar(20),
	state varchar(20),
	country varchar(20),
	postal_code varchar(20),
	constraint pk_person primary key (person_id)
);
desc person;

create table favorite_food(
	person_id smallint unsigned,
    food varchar(20),
    constraint pk_favorite_food primary key (person_id, food),
    constraint fk_favorite_food_person_id foreign key (person_id) references person(person_id)
);
desc favorite_food;
show databases;
select * from information_schema.table_constraints
where constraint_schema = 'first_example';

desc person;

insert into person values 	('2', 'Hadassa', 'Fernandes', 'F', '2003-11-25', 'Vila Nova', 'Sapucaia', 'Rio de Janeiro', 'Brasil', '25884-000'),
							('3', 'Madalena', 'Charles', 'F', '1965-01-03', 'Br116 Km39', 'São José', 'Rio de Janeiro', 'Brasil', '25780-000');

select * from person;

insert into favorite_food values('1', 'Pizza'),
								('2', 'Churrasco'),
                                ('3', 'Lasanha');
                                
select * from favorite_food;