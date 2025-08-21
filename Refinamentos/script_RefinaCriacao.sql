-- Criação do BD E-Commerce Refinado
-- drop database ecommerce_refinado;

create database if not exists ecommerce_refinado;
use ecommerce_refinado;

-- Clientes
create table Clientes(
	id_cliente int auto_increment primary key,
    endereco_cliente varchar(255) not null,
    telefone_cliente varchar(20) not null
);

create table Clientes_PF(
	id_cliente int primary key,
    cpf_cliente char(11) unique not null,
    nome varchar(255) not null,
    dt_nascimento date not null,
    foreign key (id_cliente) references Clientes(id_cliente)
);

create table Clientes_PJ(
	id_cliente int primary key,
    cnpj_cliente char(14) unique not null,
    rz_social varchar(255) not null,
    nome_fantasia varchar(255),
    foreign key (id_cliente) references Clientes(id_cliente)
);

-- Parceiros
create table Parceiros(
	id_parceiro int auto_increment primary key,
    endereco_parceiro varchar(255) not null,
    telefone_parceiro varchar(20) not null
);

create table Parceiros_PF(
	id_parceiro int primary key,
    cpf_parceiro char(11) unique not null,
    nome_parceiro varchar(255) not null,
    dt_nasc_parceiro date not null,
    foreign key (id_parceiro) references Parceiros(id_parceiro)
);

create table Parceiros_PJ(
	id_parceiro int primary key,
    cnpj_parceiro char(14) unique not null,
    rz_social_parceiro varchar(255) not null,
    nome_fantasia_parceiro varchar(255),
    foreign key (id_parceiro) references Parceiros(id_parceiro)
);

-- Produtos e Fornecedores
create table Fornecedores (
	id_fornecedor int auto_increment primary key,
    rz_social_fornecedor varchar(255) not null,
    cnpj_fornecedor varchar(15) unique not null,
    telefone_fornecedor varchar(20) not null
);

create table Produtos (
	id_produto int auto_increment primary key,
    descricao varchar(255) not null,
    categoria varchar(45) not null,
    valor decimal(10,2) not null check (valor >= 0)
);

create table Produtos_Fornecedores (
	id_produto int,
    id_fornecedor int,
    preco_custo decimal(10,2) not null check (preco_custo >= 0),
    qtd_minima int default 1 check (qtd_minima >= 0),
    primary key (id_produto, id_fornecedor),
    foreign key (id_produto) references Produtos(id_produto),
    foreign key (id_fornecedor) references Fornecedores(id_fornecedor)
);

-- Parceiros x Produtos
create table Parceiros_Produtos (
	id_parceiro int,
    id_produto int,
    preco decimal(10,2) not null check (preco >= 0),
    prazo_entrega int default 0,
    primary key (id_parceiro, id_produto),
    foreign key (id_parceiro) references Parceiros(id_parceiro),
    foreign key (id_produto) references Produtos(id_produto)
);

-- Estoques
create table Estoques(
	id_estoque int auto_increment primary key,
    local_estoque varchar(255) not null
);

create table Estoques_Produtos(
	id_estoque int,
    id_produto int,
    quantidade int default 0 check (quantidade >= 0),
    primary key (id_estoque, id_produto),
    foreign key (id_estoque) references Estoques(id_estoque),
    foreign key (id_produto) references Produtos(id_produto)
);

-- Pedidos e Pagamentos
create table Pedidos (
	id_pedido int auto_increment primary key,
    id_cliente int not null,
    status_pedido enum('Aberto', 'Pago', 'Enviado', 'Entregue', 'Cancelado') default 'Aberto',
    frete decimal(10,2) default 0,
    valor_total decimal(10,2) default 0,
    foreign key (id_cliente) references Clientes(id_cliente)
);

create table Formas_Pagto (
	idforma_pagto int auto_increment primary key,
    tipo_pagto varchar(45) not null
);

create table Pedidos_FormasPagto (
	id_pedido int,
    idforma_pagto int,
    valor_pago decimal(10,2) not null check (valor_pago >= 0),
    primary key (id_pedido, idforma_pagto),
    foreign key (id_pedido) references Pedidos(id_pedido),
    foreign key (idforma_pagto) references Formas_Pagto(idforma_pagto)
);

-- Pedidos x Produtos
create table Pedidos_Produtos (
	id_pedido int,
    id_produto int,
    quantidade int not null check (quantidade > 0),
    preco_unitario decimal(10,2) not null check (preco_unitario >= 0),
    valor_total_item decimal(10,2) generated always as (quantidade * preco_unitario) stored,
    status_pp enum('Reservado','Faturado','Cancelado') default 'Reservado',
    primary key (id_pedido, id_produto),
    foreign key (id_pedido) references Pedidos(id_pedido),
    foreign key (id_produto) references Produtos(id_produto)
);

-- Entregas
create table Entregas (
	id_entrega int auto_increment primary key,
    id_pedido int,
    id_parceiro int not null,
    cod_rastreio varchar(45) unique,
    status_entrega enum('Pendente', 'Enviado', 'Entregue', 'Devolvido') default 'Pendente',
    dt_envio date,
    dt_entrega date,
    foreign key (id_pedido) references Pedidos(id_pedido),
    foreign key (id_parceiro) references Parceiros(id_parceiro)
);