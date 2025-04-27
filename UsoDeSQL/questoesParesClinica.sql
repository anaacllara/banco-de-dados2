use clinica;

SELECT *
FROM medicos;

SELECT especialidade -- pode apresentar dados duplicados -- 
FROM medicos;

SELECT DISTINCT especialidade -- distinct remove duplicidades -- 
FROM medicos; 

SELECT count(*) -- quantidade total de registros da tabela --
FROM medicos;

SELECT count(*)
FROM medicos
WHERE especialidade = 'ortopedia'; -- contar quantos medico são ortopedistas -- 

SELECT max(idade) -- maximo de idade--
FROM medicos;

SELECT min(idade) -- minimo idade --
FROM medicos;

SELECT avg(idade) -- média de idade-- 
FROM medicos;

SELECT nome, idade
FROM medicos;

SELECT nome, idade -- ordernar pela idade do menor para maior, tbm pode colocar asc
FROM medicos
ORDER BY idade;

SELECT nome, idade -- orderna de forma descendente, pode ser n° ou texto
FROM medicos
ORDER BY idade desc;

SELECT *  -- o like  é para fazer filtragens, M%, é M no inicio e qualquer letra depois, %m, é M no final, %m%, M em qualquer lugar
FROM medicos
WHERE nome like 'M%';

SELECT * -- uso do between 
FROM medicos
WHERE idade between 30 and 40;

SELECT * -- faz a mesma coisa que o comando BETWEEN
FROM medicos
WHERE idade >= 30 and idade <=40; 

SELECT * -- uso do IN 
FROM medicos
WHERE especialidade in ('ortopedia', 'neurologia');

SELECT *  -- faz a mesma coisa que o IN 
FROM medicos
WHERE especialidade = 'ortopedia' or
	  especialidade = 'neurologia';

--Exercício Pares do Slide 16 --
use clinica;

-- questão 2 
SELECT *
FROM consultas
WHERE data >= '2006-06-19' and hora >= '12:00:00';

-- questão 4 
SELECT hora 
FROM consultas 
WHERE data <= '2006-06-14' and data >= '2006-06-20';

-- questão 6 
SELECT DISTINCT cidade 
FROM funcionarios;

-- questão 10
SELECT max(hora) 
FROM consulta 
WHERE data = '2006-06-13';

-- questão 12
SELECT codf, nome, salario - (salario * 0.20)
FROM funcionarios;

-- questão 14 
SELECT nome, CPF
FROM funcionarios
WHERE CPF not like '%00000%';

-- questão 16 
SELECT codp, nome 
FROM pacientes
WHERE idade >= 25 and doenca in ('tendinite', 'fratura', 'gripe', 'sarampo');
