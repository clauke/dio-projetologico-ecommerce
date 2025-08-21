-- Inserções no BD ecommerce_refinado

use ecommerce_refinado;

-- Clientes

insert into Clientes (endereco_cliente, telefone_cliente) values
('Rua das Flores, 123', '11988887777'),
('Av. Brasil, 500', '21999996666'),
('Rua Central, 45', '31988884444'),
('Rua A, 10', '41999995555'),
('Av. Paulista, 1000', '11977776666');

insert into Clientes_PF (id_cliente, cpf_cliente, nome, dt_nascimento) values
(1, '12345678901', 'João Silva', '1990-05-10'),
(2, '23456789012', 'Maria Souza', '1985-11-20');

insert into Clientes_PJ (id_cliente, cnpj_cliente, rz_social, nome_fantasia) values
(3, '12345678000190', 'Tech Solutions LTDA', 'TechSol'),
(4, '98765432000155', 'Alfa Comércio SA', 'AlfaCom'),
(5, '11122233000177', 'Beta Serviços ME', 'BetaServ');

-- Parceiros

insert into Parceiros (endereco_parceiro, telefone_parceiro) values
('Rua das Laranjeiras, 50', '21988887777'),
('Av. das Nações, 200', '11999995555'),
('Rua Verde, 300', '31988889999');

insert into Parceiros_PF (id_parceiro, cpf_parceiro, nome_parceiro, dt_nasc_parceiro) values
(1, '55566677788', 'Carlos Mendes', '1980-07-15');

insert into Parceiros_PJ (id_parceiro, cnpj_parceiro, rz_social_parceiro, nome_fantasia_parceiro) values
(2, '22233344000166', 'Entrega Express LTDA', 'EntregExpress'),
(3, '33344455000177', 'Translog SA', 'Translog');

-- Fornecedores e Produtos

insert into Fornecedores (rz_social_fornecedor, cnpj_fornecedor, telefone_fornecedor) values
('Global Tech Distribuidora', '12345000000111', '1133334444'),
('Alimentos Bom Sabor', '98765000000122', '2133335555');

insert into Produtos (descricao, categoria, valor) values
('Notebook Dell Inspiron', 'Informática', 3500.00),
('Mouse Gamer', 'Acessórios', 150.00),
('Cadeira Escritório', 'Móveis', 750.00),
('Camiseta Polo', 'Vestuário', 89.90),
('Smartphone Samsung A52', 'Celulares', 2100.00);

insert into Produtos_Fornecedores (id_produto, id_fornecedor, preco_custo, qtd_minima) values
(1, 1, 3000.00, 1),
(2, 1, 100.00, 5),
(3, 1, 600.00, 2),
(4, 2, 50.00, 10),
(5, 1, 1800.00, 1);

-- Parceiros x Produtos

insert into Parceiros_Produtos (id_parceiro, id_produto, preco, prazo_entrega) values
(1, 1, 3550.00, 7),
(1, 2, 160.00, 5),
(2, 3, 770.00, 10),
(2, 4, 95.00, 3),
(3, 5, 2200.00, 12);

-- Estoques x Produtos

insert into Estoques (local_estoque) values
('Centro-SP'),
('Rio de Janeiro-RJ');

insert into Estoques_Produtos (id_estoque, id_produto, quantidade) values
(1, 1, 10),
(1, 2, 50),
(1, 3, 15),
(2, 4, 100),
(2, 5, 20);

-- Pedidos e Formas de Pagamento

insert into Pedidos (id_cliente, status_pedido, frete, valor_total) values
(1, 'Pago', 20.00, 3670.00),
(2, 'Aberto', 0.00, 150.00),
(3, 'Enviado', 35.00, 2135.00),
(1, 'Enviado', 50.00, 4500.00);

insert into Formas_Pagto (tipo_pagto) values
('Cartão de Crédito'),
('Boleto Bancário'),
('PIX');

insert into Pedidos_FormasPagto (id_pedido, idforma_pagto, valor_pago) values
(1, 1, 3670.00),
(2, 3, 150.00),
(3, 2, 2135.00);

-- Pedidos x Produtos

insert into Pedidos_Produtos (id_pedido, id_produto, quantidade, preco_unitario, status_pp) values
(1, 1, 1, 3500.00, 'Faturado'),
(1, 2, 1, 150.00, 'Faturado'),
(2, 2, 1, 150.00, 'Reservado'),
(3, 5, 1, 2100.00, 'Faturado');

-- Entregas

insert into Entregas (id_pedido, id_parceiro, cod_rastreio, status_entrega, dt_envio, dt_entrega) values
(1, 2, 'BR123456789', 'Entregue', '2025-08-01', '2025-08-05'),
(2, 1, 'BR987654321', 'Pendente', NULL, NULL),
(3, 3, 'BR555888777', 'Enviado', '2025-08-10', NULL);
