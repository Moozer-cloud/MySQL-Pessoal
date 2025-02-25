-- Cláusulas de Ordenação e Agrupamento

use company;

-- Ordenação
-- order by está simplesmente ordenando o resultado da minha tabela, exemplo abaixo pelo atributo Salary, caso eu insira o DESC ele muda para decrescente, sem nada fica crescente
select * from employee order by Salary desc;
select * from employee order by Salary, Bdate;

select distinct concat(e.Fname, ' ', e.Minit, ' ', e.Lname) as Nome, e.Ssn as Identif_Empregado, e.Super_Ssn as Gerente, e.Dno as N_Departamento, d.Dname as Nome_Dep, w.Hours as Horas
	from departament as d, employee as e, work_on as w
    where (e.Dno = d.Dnumber) and (e.Ssn = w.Essn)
    order by Nome, Horas;

select * from departament;
select * from employee;
-- Caso eu queira alterar a ordenação, basta inserir DESC -> Descendente ou ASC -> Ascendente

-- Agrupamento
-- count -> contabiliza conforme parâmetros
-- count(distinct...) para puxar sem redundância
select count(address) from employee;
select count(distinct Mgr_Ssn)  as Quantidade_Gerentes from departament;
select Pnumber, Pname, count(*)
	from project, work_on
    group by Pnumber, Pname;

-- AVG -> Média
select Dno, count(*) as Número_de_Pessoas, round(avg(Salary),2) as Média_Salário from employee
	group by Dno;
    
    -- SUM -> Soma
    -- MAX -> Máximo
    -- MIN -> Mínimo
    -- AVG -> Média
    -- Round arredonda e casas decimais
    select sum(Salary) as Total_Salário, max(Salary) as Maior_Salário, min(Salary) as Menor_Salário, round(avg(Salary),2) as Média_Salário from employee;


select Pnumber as N_Projeto, Pname as Nome_Projeto, count(*) as Qtd, round(avg(salary),2) as Média_Salário
	from project, work_on, employee
    where Pnumber = Pno and Ssn = Essn
    group by Pnumber, Pname
    order by Média_Salário;
    
    
-- having está realizando um filtro dentro do grupo (group by) -> atributo da lista
select Pnumber, Pname, Count(*)
	from project, work_on
    where Pnumber=Pno
    group by Pnumber, Pname
    having count(*)>=1;
    
    -- select -> from -> where -> group by -> having -> order by ... Essa seria a sequência com todas as cláusulas
