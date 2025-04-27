use clinica; 

-- nomes e cpf dos medicos que também são pacientes do hospital
SELECT me.nome, me.cpf
FROM medicos as me 
JOIN pacientes as pa on me.cpf = pa.cpf;

-- codigo e nome de funcionários e médicos que residem na mesma cidade
SELECT codf, fu.nome
FROM funcionarios as fu 
JOIN medicos as me on fu.cidade=me.cidade
UNION -- as tabelas não se relacionam 
SELECT codm, me.nome
FROM medicos as me 
JOIN funcionarios as fu on me.cidade = fu.cidade;

-- codigo e nome de pacientes com consulta marcada para horários após as 14h
SELECT pa.codp, pa.nome
FROM consultas as co -- pega da tabela consultas por que em pacientes não tem o código da consulta
JOIN pacientes as pa on pa.codp = co.codp -- usa codp em vez de id
WHERE co.hora > '14:00:00';

-- n° e andar do ambulatório usado por medicos ortopedistas
SELECT DISTINCT  am.nroa, am.andar 
FROM ambulatorios as am
JOIN medicos as me on me.nroa = am.nroa
WHERE especialidade = 'ortopedia'
GROUP BY am.nroa, am.andar;

-- nome e cpf dos pacientes com consultas marcadas entre os dias 14 e 16 de junho de 2006
SELECT DISTINCT pa.nome, pa.cpf 
FROM pacientes as pa
JOIN consultas as co on co.codp = pa.codp
WHERE co.data between '2006-06-14' and '2006-06-16';

-- codigo e nome dos medicos que tem consulta com a paciente ana 
SELECT me.nome, me.codm
FROM medicos AS me 
JOIN consultas as co on me.codm = co.codm
JOIN pacientes as pa on co.codp = pa.codp
WHERE pa.nome = 'Ana Rodrigues';

-- codigo e nome dos médicos que atendem no mesmo ambulatório que o medico Pedro que possuem consultas marcada pro dia 14/06/2024
SELECT me.codm, me.nome
FROM medicos as me -- não precisa juntar com a tabela ambulatorio pois o nroa tem na tabela médicos
JOIN consultas as co on me.codm = co.codm
WHERE co.data = '2024-06-14' 
and me.nroa=(select me.nroa from medicos where nome = 'Pedro');

-- nome, cpf e idade dos pacientes que tem consultas marcadas com ortopedista anteriores ao dia 16
SELECT pa.nome, pa.cpf, pa.idade  
FROM pacientes as pa
JOIN consultas as co on pa.codp = co.codp
JOIN medicos as me on co.codm = me.codm
WHERE me.especialidade = 'ortopedia' and co.data < '2024-06-16';

-- nome e salario de funcionarios que moram na mesma cidade que o funcionario Carlos e ganham mais do que ele
SELECT nome, salario 
FROM funcionarios 
WHERE cidade = (select cidade from funcionarios where nome = 'Carlos')
and salario > (select salario from funcionarios where salario ='Carlos');

-- selecionar tudo de ambulatório e para aqueles que medicos atendem, mostrar o nome e codigo
SELECT am.*, me.codm as codigo_medico, me.nome as nomeMedico 
FROM ambulatorios as am
LEFT JOIN medicos as me on am.nroa = me.nroa; 

-- cpf e nome de todos os medicos, e para aqueles com consultas marcadas, mostrar cpf e nome dos pacientes e data das consultas
SELECT me.nome as nome_medico, me.cpf as cpf_medico, pa.cpf AS cpf_paciente, pa.nome as nome_paciente, co.data as data_da_consulta
FROM medicos as me 
LEFT JOIN consultas as co on me.codm=co.codm
LEFT JOIN pacientes as pa on co.codp = pa.codp
ORDER BY me.nome;