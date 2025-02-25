select now() as Timestamp;

create database manipulation;
use manipulation;

create table bankAccounts (
	Id_account int auto_increment primary key,
    Ag_num int not null,
    Ac_num int not null,
    Saldo float,
    constraint identification_account_constraint unique (Ag_num, Ac_num)
);

-- desc mostra como está estruturada a tabela
desc bankClient;

create table bankClient(
	Id_client int auto_increment,
    ClientAccount int,
    CPF char(11) not null,
    RG char(9) not null,
    Nome varchar(50) not null,
    Endereço varchar(100) not null,
    Renda_mensal float,
    primary key (Id_client, ClientAccount),
    constraint fk_account_client foreign key (ClientAccount) references bankAccounts (Id_account)
    on update cascade
);

alter table bankClient add UFF char(2) not null;

create table bankTransactions(
	Id_transaction int auto_increment primary key,
    Ocorrencia datetime,
    Status_transaction varchar(20),
    Valor_transferido float,
    Source_account int,
    Destination_account int,
    constraint fk_source_transaction foreign key (Source_account) references bankAccounts (id_Account),
    constraint fk_destination_transaction foreign key (Destination_account) references bankAccounts (id_Account)
);

-- drop remove entidades estruturais (tabela, banco de dados)
-- drop table bankClient -> nesse caso iria remover a tabela inteira do bankClient
-- alter modifica a tabela, exemplo abaixo irei adicionar/inserir um novo atributo na tabela banckAccounts
alter table bankAccounts add LimiteCredito float not null default 500.00;
-- alter table bankAccounts drop LimiteCredito -> Nesse exemplo eu estaria excluindo o atributo
-- alter table (nome tabela) modify column (nome atributo/coluna) tipo_dados (Rg, CPF...) condição (varchar, float...);
-- alter table (nome tabela) add constraint nome_constraint condicoes;
-- Update (nmoe tabela) set (nome atributo/coluna)=(novo valor do atributo) where (nome do atributo/coluna)=(valor do atributo)
