-- criação do banco de dados para o cenário de E-Commerce
drop database ecommerce2;

create database ecommerce2;
use ecommerce2;

/*
show databases;
use information_schema;
show tables;
desc referential_constraints;
select* from referential_constraints where constraint_schema= 'ecommerce';
*/

-- ciar as tabelas cliente
create table clients(
	cIdCliente char(15) primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    Address varchar(30),
    birthdate date, 
    idType enum("PF", "PJ") default "PF", 
    constraint unique_id_cliente unique(cIdCliente)
);

-- para ser continuado no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessárias
-- Além disso, reflita essa modificação no diagrama de esquema relacional
-- criar constraints relacionadas aos pagamentos
create table payments(
	pIdClient char(15),
    idPayment int,
    typePayment enum("Boleto", "cartão", "dois cartão"),
    numero_cartao int,
    numero_boleto int,
    constraint pk_payments_IdClient primary key(pIdClient, idPayment),
    constraint cpf_cliente_payments foreign key (pIdClient) references clients(cIdCliente)
);

create table product(
	idProduct int auto_increment primary key,
    Pname varchar(20) not null,
    classification_kids bool default false, 
    category enum("Eletrônica", "Vestimenta", "Brinquedos", "Alimentos", "Móveis") not null, 
    descricao varchar(100),
	valor float,
    avaliação float default 0,
    size varchar(10)
);

-- ciar as tabelas pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient char(15),
    orderStatus enum("Cancelado", "Confirmado", "Em processamento") default "Em processamento",
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    oIdProduct int,
    constraint fk_order_CPF_client foreign key (idOrderClient) references clients(cIdCliente) on update cascade,
    constraint fk_oIdProduct_orders foreign key(oIdProduct) references product(idProduct)
);

create table dadosFrete(
	idOrder_frete int,
    nome_Transportadora varchar(45),
    origem varchar(45),
    destino varchar(45),
    data_coleta DATE,
    constraint fk_idOrder_frete foreign key(idOrder_frete) references orders(idOrder) on update cascade
);

-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique(CNPJ)
    );
    
-- criar tabela vendendor
create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(15),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique(CNPJ),
    constraint unique_cpf_seller unique(CPF)
    );
    
create table productSeller(
	idPseller int,
    idProduct int,
    prodQuantity int default 1,
    primary key (idPseller, idProduct),
    constraint fk_product_seller foreign key(idPseller) references seller(idSeller),
    constraint fk_product_product foreign key(idProduct) references product(idProduct)
);

create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum("Disponível", "Sem Estoque") default "Disponível",
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key(idPOproduct) references product(idProduct),
    constraint fk_productorder_product foreign key(idPOorder) references orders(idOrder)
);

create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key(idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key(idLstorage) references productStorage(idProdStorage)
);

create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key(idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key(idPsSupplier) references supplier(idSupplier) ,
    constraint fk_product_supplier_product foreign key(idPsProduct) references product(idProduct)
);