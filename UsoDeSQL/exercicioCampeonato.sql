USE campeonato;

-- selecionar todos os campos da tabela time
SELECT *
FROM times;

-- selecionar apenas nome e uf da tabela times 
SELECT nome, uf
FROM times;

-- selecionar apenas times do RJ e >3.6 milhões
SELECT nome
FROM times
WHERE qtd_torcedores > 3600000 and uf='RJ';

-- times com mais de 10 mil torcedores
SELECT nome
FROM times
WHERE qtd_torcedores >10000000;

-- times fundados antes de 1912 e que seja de SP e MG
SELECT nome
FROM times
WHERE fundacao < '1912-01-01' -- precisa de aspas simples para indicar data
AND (uf = 'SP' or uf = 'MG'); -- usa or pois não tem como um time pertencer a dois estados

-- times que tem menos de 25 atletas e não seja de PE
SELECT nome
FROM times
WHERE qtd_atletas < 25 and not uf ='PE';

-- os times com maior e menor n° de torcedores 
SELECT nome, qtd_torcedores
FROM times -- isso é uma subquery 
WHERE qtd_torcedores= (select max(qtd_torcedores) from times)
	or qtd_torcedores = (select min(qtd_torcedores) from times);

-- media de torcedores de todos os times
SELECT avg(qtd_torcedores)
FROM times;

-- times que iniciam com S e menos de 3 milhões de torcedores
SELECT *
FROM times -- se atentar a posição do % se tiver depois da letra procura texto que começa com a letra desejada
WHERE nome like 'S%' and qtd_torcedores < 3000000;

-- selecionar a quantidade de times que tem mais de 25 jogadores
SELECT count(qtd_atletas)
FROM times
WHERE qtd_atletas > 25;

-- selecionar de forma única infos sobre as UFs dos times
SELECT uf
FROM times;

-- times com data de fundação entre 01/01/1904 e 31/12/1930
SELECT *
FROM times
WHERE fundacao between '1904-01-01' and '1930-12-31';

-- deletar times que tenham no nome alguma letra f
DELETE FROM times WHERE nome like '%f%'; -- chatgpt recomenda fazer assim no safemode:
-- DELETE FROM times 
-- WHERE id IN (SELECT id FROM (SELECT id FROM times WHERE nome LIKE '%f%') AS temp);

-- atualizar as informações de quantidade de atletas dos times que começam com C para 40 jogadores
UPDATE times set qtd_atletas=40 where nome like 'C%'; -- chatgpt recomenda fazer assim no safemode:
-- SET SQL_SAFE_UPDATES = 0;  -- Desativa o safe mode
-- UPDATE times 
-- SET qtd_atletas = 40 
-- WHERE nome LIKE 'C%';
-- SET SQL_SAFE_UPDATES = 1;  -- Reativa o safe mode
