use loja;

-- contas total de clientes --
SELECT count(*)
FROM clientes;

-- contar toal de pedidos --
SELECT count(*)
FROM pedidos;

-- calcular valor total de todos os pedidos --
SELECT sum(quantidade * preco)
FROM pedidos 
	JOIN produtos ON produtos.id = pedidos.produto_id;

-- calcular media de preço dos produtos --
SELECT avg(preco)
FROM produtos;

-- listar clientes e seus pedidos -- 
SELECT DISTINCT *
FROM clientes, pedidos;

-- listar todos pedidos e produtos, incluindo pedidos sem produtos --
SELECT *
FROM pedidos as pe
LEFT JOIN produtos as pr ON pr.id= pe.produto_id; 

-- listar os produtos mais caros primeiro -- 
SELECT *
FROM produtos
ORDER BY preco desc;

-- listar os produtos com menor estoque --
SELECT *
FROM produtos 
ORDER BY estoque asc;

-- contar quantos pedidos foram feitos por cliente --
SELECT count(*)
FROM pedidos as pe
JOIN clientes as cl ON cl.id = pe.cliente_id;

-- contar quantos produtos diferentes foram vendidos -- 
SELECT DISTINCT count(pr.nome)
FROM pedidos as pe
JOIN produtos as pr on pr.id = pe.produto_id;

-- mostrar os clientes que não realizaram pedidos -- 
SELECT cliente_id
FROM pedidos
WHERE produto_id is null; 

-- mostrar os produtos que nunca foram vendidos -- 
SELECT * -- selecionar todos os produtos da tabela produtos que não tem correspondência com a tabela pedidos -- 
FROM produtos as p 
LEFT JOIN pedidos as pe ON p.id = pe.produto_id
WHERE pe.id is null;

-- contar o n° de pedidos feitos por dia -- 
SELECT data_pedido, count(*) as total_pedidos -- mostrar as datas e count conta os pedidos feitos no dia
FROM pedidos
GROUP BY data_pedido -- garante que cada linha represente uma data diferente
ORDER BY data_pedido; -- ordena pelo mais recente

-- listar os produtos mais vendidos -- 
SELECT pr.id, pr.nome, sum(p.quantidade) as total_vendidos
FROM pedidos as p 
JOIN produtos as pr on pr.id = p.produto_id
WHERE p.produto_id is not null -- existe produto sem pedido
GROUP BY pr.id, pr.nome -- colocar id ajuda a não ter inconsistencia, pois pode haver produtos com nome duplicados
ORDER BY total_vendidos desc;

-- encontrar o cliente que mais fez pedidos 
-- SELECT p.cliente, max(p.quantidade) -- p.cliente não existe, apenas o nome do cliente, logo p.nome
-- FROM pedidos as p 
-- JOIN clientes as cl on cl.id = p.cliente_id;
-- maneira correta 

SELECT cl.nome, count(p.quantidade) as total_pedidos
FROM pedidos as p 
JOIN clientes as cl on cl.id = p.cliente_id
WHERE p.cliente_id is not null 
GROUP BY cl.id, cl.nome
ORDER BY total_pedidos desc
LIMIT 1; 

-- listar pedidos e clientes, incluindo clientes sem pedidos
SELECT *
FROM pedidos as pe
RIGHT JOIN clientes as cl on cl.id = pe.cliente_id;

-- listar os produtos e o total de venda por produto
SELECT pr.nome, coalesce(sum(pe.quantidade)) as total  -- usar count é para contar o n° de linhas, coalesce é para exibir 0 em vez de null
FROM pedidos as pe
JOIN produtos as pr on pr.id = pe.produto_id
GROUP BY pr.nome, pr.id -- sempre que usa sum ou count precisa agrupar depois
ORDER BY total desc;

-- calcular a média de quantidade de produtos por pedido
SELECT pr.nome, avg(pe.quantidade) as media
FROM pedidos as pe
JOIN produtos as pr on pr.id = pe.produto_id
GROUP BY pe.id, pr.nome;  -- abaixo tem o que o chatgtp recomendou 

SELECT avg(quantidade) as media_qtd_por_pedido
FROM pedidos;

-- listar pedidos ordenados por data, os mais recentes primeiro 
SELECT *
FROM pedidos
ORDER BY data_pedido desc;

-- contar quantos clientes possuem telefones cadastrado 
SELECT count(telefone)
FROM clientes
WHERE telefone is not null;

-- selecionar o cliente que mais gastou 
SELECT cl.nome, sum(pr.preco*pe.quantidade) as total -- O pr.preco representa o valor unitário, logo precisa somar a quantidade de vezes que comprou
FROM pedidos as pe
JOIN clientes as cl on cl.id = pe.cliente_id
JOIN produtos as pr on pr.id = pe.produto_id
WHERE pe.cliente_id is not null
GROUP BY cl.id, cl.nome
ORDER BY total desc
LIMIT 1;

-- listar os 5 produtos mais vendidos
SELECT pr.nome, sum(pe.quantidade) as mais_vendidos -- tava colocando pe.produto_id, logo só iria aparecer o id. 
FROM pedidos as pe
JOIN produtos as pr on pr.id = pe.produto_id
WHERE pe.produto_id is not null
GROUP BY pr.id, pr.nome
ORDER BY mais_vendidos desc;

-- listar os clientes que já fizeram pedidos e o n° de pedidos de cada um 
SELECT cl.nome, pe.quantidade as numeroDePedidos
FROM pedidos as pe 
JOIN clientes as cl on cl.id = pe.cliente_id;

-- encontrar a data com mais pedidos realizados !!!!
SELECT data_pedido, count(*) as total_pedido
FROM pedidos
GROUP BY data_pedido
ORDER BY total_pedido desc
LIMIT 1;

-- calcular a media de valor gasto por pedido
SELECT pr.nome, avg(pr.preco) as media -- se selecionar apenas o avg(pr.preco) saí a media de todos os produtos juntos
FROM pedidos as pe
JOIN produtos as pr on pr.id = pe.produto_id
GROUP BY pr.id, pr.nome;