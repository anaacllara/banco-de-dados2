--Aula 11/03/2025 
-- Professor Molina 

-- comando para selecionar todos os registros da tabela médicos
SELECT * 
FROM medicos;

-- comando de selecionar entre todos os medicos apenas o código 3 
SELECT *
FROM medicos
WHERE codm = 3;

-- comando selecionar nome e idade da tabela médicos 
SELECT nome, idade
FROM medicos;
