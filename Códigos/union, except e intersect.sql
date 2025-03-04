-- union, except e intersect

create database teste;
use teste;

create table R(
A char(2)	
);

create table S(
A char(2)
);

insert into R(A) values ('a1'), ('a2'), ('a2'), ('a3');
insert into S(A) values ('a1'), ('a1'), ('a2'), ('a3'), ('a4'), ('a5');

select * from R;
select * from S;

-- Eu quero recuperar as informações de S onde meu atributo A não está presente em R
-- except -> not in
select * from S where A not in (select A from R);

-- union
(select distinct R.A from R)
	UNION
		(select distinct S.A from S);

(select R.A from R) UNION (select S.A from S);
-- Os dois exemplos acima são iguais, somente estruturado de forma diferente

-- interserct -> 
-- Estou selecionando o atributo A de R onde A está presente/pertence a (select S.A from S)
select distinct R.A from R where R.A in (select S.A from S);
