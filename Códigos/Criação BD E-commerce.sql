-- criação do banco de dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table Clients(
	idClient int auto_increment primary key,
    Fname varchar(15),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(30) not null,
    Bdate date not null,
    constraint unique_CPF_CLIENT unique (CPF)
);

desc Clients;

-- criar tabela produto
create table Product(
	idProduct int auto_increment primary key,
    Pname varchar(15) not null,
    Classification_Kids bool default false,
    Category enum('Moda', 'Eletrônico', 'Móveis', 'Hobbies', 'Alimentos', 'Tecnologia') not null,
    Assessment float default 0,
    Size varchar(10),
    Price float
);

desc Product;

-- criar tabela cartão
create table Card(
	idCard int auto_increment primary key,
	NumCard char(16) not null,
    TypeCard enum('Crédito','Débito') not null default 'Débito',
    NameCard varchar(45) not null,
    DateCard date not null,
    SecurityCode int not null,
    constraint unique_CARD unique (NumCard)
);

desc Card;

-- criar tabela pagamento
create table Payments(
	idPayment int auto_increment,
	idClient int,
    idCard int,
    TypePayment enum('PIX', 'Boleto'),
    primary key (idPayment, idClient),
    constraint FK_PAYMENTS_CARD foreign key (idCard) references Card(idCard)
);

desc Payment;

-- criar tabela entrega
create table Delivery(
	idDelivery int auto_increment primary key,
    DeliveryStatus enum('Em Processamento', 'Cancelado','Confirmado', 'Enviado', 'Entregue') default 'Em processamento',
    TrackingCode int not null
);

desc Delivery;

-- criar tabela pedido
create table Orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    idDelivery int not null,
    OrderDescription varchar(255),
    SendValue float default 5,
    PaymentCash bool default false,
    constraint FK_ORDERS_CLIENT foreign key (idOrderClient) references Clients(idClient),
    constraint FK_ORDERS_DELIVERY foreign key (idDelivery) references Delivery(idDelivery)
);

desc Orders;

-- criar tabela Estoque
create table ProductStorage(
	idProdStorage int auto_increment primary key,
    StorageLocation varchar(200),
    Quantify int default 0
);

desc ProductStorage;

-- criar tabela Fornecedor
create table Supllier(
	idSupplier int auto_increment primary key,
    SocialName varchar(200) not null,
    CNPJ char(15) not null,
    Contact char(11) not null,
    constraint unique_CNPJ_SUPLLIER unique (CNPJ)
);

desc Supllier;

-- criar tabela Vendedor PJ
create table SellerPJ(
	idSellerPJ int auto_increment primary key,
    CNPJ char(15) not null,
    SocialName varchar(200) not null,
    TradeName varchar(45) not null,
    Address varchar(45) not null,
    Contact char(11) not null,
    StartDate date not null,
    constraint unique_CNPJ_SELLERPJ unique (CNPJ)
);

desc SellerPJ;

-- criar tabela Vendedor PF
create table SellerPF(
	idSellerPF int auto_increment primary key,
    CPF char(11) not null,
    TradeName varchar(45) not null,
    Address varchar(45) not null,
    Contact char(11) not null,
    StartDate date not null,
    constraint unique_CPF_SELLERPF unique (CPF)
);

desc SellerPF;

-- criar tabela Vendedor Terceiro
-- Realizei uma modificação na estrutura, por isso dropei. Voltei ao normal a tabela
drop table Seller;
create table Seller(
	idSeller int auto_increment not null primary key,
	idSellerPJ int,
    idSellerPF int,
    constraint FK_SELLER_SELLERPJ foreign key (idSellerPJ) references SellerPJ(idSellerPJ),
    constraint FK_SELLER_SELLERPF foreign key (idSellerPF) references SellerPF(idSellerPF)
);   

desc Seller;

-- criar tabela Produtos por Terceiros
create table ProductSeller(
	idProductSeller int,
    idProduto int,
    QuantifyProduct int not null default 1,
	primary key (idProductSeller, idProduto),
    constraint FK_PRODUCTSELLER_SELLER foreign key (idProductSeller) references Seller(idSeller),
    constraint FK_PRODUCTSELLER_PRODUCT foreign key (idProduto) references Product(idProduct)
);

desc ProductSeller;

-- criar tabela Produto em Estoque (Loc.)
create table ProductStock(
	idStock int not null,
    idProductST int not null,
    Address varchar(255) not null,
    primary key (idStock, idProductST),
    constraint FK_PRODUCTSTOCK_PRODUCTSTORAGE foreign key (idStock) references ProductStorage(idProdStorage),
    constraint FK_PRODUCTSTOCK_PRODUCT foreign key(idProductST) references Product(idProduct)
);

desc ProductStock;

-- criar tabela Produto Fornecedor
create table ProductSupplier(
	idProductSU int not null,
    idPSupplier int not null,
    ProdQuantity int not null default 1,
    primary key (idProductSU, idPSupplier),
    constraint FK_PRODUCTSUPPLIER_PRODUCT foreign key (idProductSU) references Product(idProduct),
    constraint FK_PRODUCTSUPPLIER_SUPPLIER foreign key(idPSupplier) references Supllier(idSupplier)
);

desc ProductSupplier;

-- criar tabela Relação Produto/Pedido
create table ProductOrder(
	idProductO int not null,
    idOrderP int not null,
    PoQuantity int not null default 1,
    Status enum('Disponível','Fora de Estoque') not null default 'Disponível',
    primary key (idProductO, idOrderP),
    constraint FK_PRODUCTORDER_PRODUCT foreign key (idProductO) references Product(idProduct),
    constraint FK_PRODUCTORDER_ORDER foreign key (idOrderP) references Orders(idOrder)    
);

desc ProductOrder;

show tables;