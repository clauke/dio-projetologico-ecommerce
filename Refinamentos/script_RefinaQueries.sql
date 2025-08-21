use ecommerce_refinado;

-- Listar todos os clientes pessoa física com seus nomes e telefones
select c.id_cliente, cpf_cliente, nome, telefone_cliente
from Clientes c
join Clientes_PF pf on c.id_cliente = pf.id_cliente;

-- Listar todos os pedidos pagos
select id_pedido, status_pedido, valor_total
from pedidos
where status_pedido = 'Pago';

-- Listar os produtos e aplique 10% de desconto em seu valor
select id_produto, descricao, valor, round((valor * 0.9), 2) as valor_com_desconto
from Produtos;

-- Mostrar a quantidade de pedidos por cliente (apenas com mais de 1 pedido)
select id_cliente, count(*) as total_pedidos
from Pedidos
group by id_cliente
having count(*) > 1;

-- Listar produtos e seus fornecedores
select p.descricao as Produto, f.rz_social_fornecedor as Fornecedor, pf.preco_custo
from Produtos p
join Produtos_Fornecedores pf on p.id_produto = pf.id_produto
join Fornecedores f on pf.id_fornecedor = f.id_fornecedor;

-- Listar produtos e estoques
select e.local_estoque, p.descricao, ep.quantidade
from Estoques e
join Estoques_Produtos ep on e.id_estoque = ep.id_estoque
join Produtos p on ep.id_produto = p.id_produto;

-- Listar parceiro que é fornecedor
select p.id_parceiro, pj.cnpj_parceiro, f.cnpj_fornecedor, f.rz_social_fornecedor
from Parceiros_PJ pj
join Fornecedores f on pj.cnpj_parceiro = f.cnpj_fornecedor
join Parceiros p on pj.id_parceiro = p.id_parceiro;
-- Retorna 0 registros pois, não existe parceiro que também é fornecedor



