use cinema;

-- liste todos os diretores e filmes que eles dirigiram 
SELECT d.name as nomeDiretor, m.name as filme, m.director_id
FROM directors as d
LEFT JOIN movies as m on d.id = m.director_id; -- usa left pra listar todos os diretores, até os sem filmes

-- liste todos os filmes e os seus tickets vendidos
SELECT m.name as filmes, count(t.id) as tickets_vendidos
FROM movies as m 
JOIN tickets as t on m.id = t.movie_id
GROUP BY m.id;

-- liste todos os filmes, os diretoes e os tickets vendidos
SELECT m.name as filmes, d.name as diretores, count(t.id) as tickets_vendidos
FROM movies as m 
LEFT JOIN tickets as t on m.id = t.movie_id
JOIN directors as d on m.director_id = d.id -- directors não tem id de movies, apenas movies tem a chave estrangeira que aponta para directors
GROUP BY m.id, m.name, d.name; -- a tabela que possui a foreing key é que faz o join

-- liste todos os diretores inclusive aqueles que não dirigiram nenhum filme
SELECT d.name as diretores, m.name as filmes
FROM directors as d 
LEFT JOIN movies as m on d.id = m.director_id;

-- liste todos os filmes incluindo aquele que não tem diretor associado
SELECT m.name as filmes, d.name as diretores
FROM movies as m 
LEFT JOIN directors as d on m.director_id = d.id;