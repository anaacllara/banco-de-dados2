USE sgBiblioteca;
-- insert na tabela cdd
INSERT INTO cdd(cod, descricao)VALUES
('823', 'Literatura - Romance'),
('100', 'Filosofia'),
('320', 'Ciência Política'),
('300', 'Ciências Sociais'),
('808', 'Retórica e Coleções de Literatura'),
('004', 'Processamento de dados. Ciência da Computação'),
('342', 'Direito Constitucional'),
('347', 'Processo Civil'),
('340', 'Direito'),
('570', 'Biologia'),
('345', 'Direito Penal'),
('341', 'Direito Internacional'),
('005', 'Engenharia de Software'),
('629.8', 'Controle Automático, Automação, Robótica'),
('530', 'Física'),
('520', 'Astronomia'),
('500', 'Ciências Naturais'),
('509', 'História das Ciências'),
('590', 'Zoologia'),
('577', 'Ecologia'),
('579', 'Microbiologia'),
('660', 'Engenharia Química'),
('690', 'Edificações'),
('550', 'Ciências da Terra'),
('560', 'Paleontologia'),
('681.3', 'Computadores Digitais e Periféricos'),
('343', 'Direito Militar, Fiscal, Comercial, Industrial, do Trabalho, Social'),
('344', 'Direito Social, Trabalho, Bem-Estar, Saúde, Educação, Cultura'), 
('160', 'Lógica'),
('170','Ética (Filosofia Moral)'),
('200','Religião'),
('460','Língua Espanhola e Portuguesa'),
('470','Língua Itálica, Latinas'),
('620', 'Engenharia e Operações Afins'),
('710','Urbanismo e Paisagismo'),
('770','Fotografia e Fotografias'),
('980','História Geral da América do Sul'),
('960','História Geral da África'),
('380','Comercio, Comunicações, Transporte'),
('110','Metafísica');

-- insert na tabela autor 
INSERT INTO autor (nome, nascionalidade, dt_nascimento) VALUES
('George Orwell', 'Britânica', '1903-06-25'),
('Yuval Noah Harari', 'Israelense', '1976-02-24'),
('Platão', 'Grega', '0427-01-01'),
('John Locke', 'Britânica', '1632-08-29'),
('Karl Marx', 'Alemã', '1818-05-05'),
('Norberto Bobbio', 'Italiana', '1909-10-18'),
('Stephen King', 'Americana', '1947-09-21'),
('Jane Austen', 'Britânica', '1775-12-16'),
('Gabriel García Márquez', 'Colombiana', '1927-03-06'),
('Clarice Lispector', 'Brasileira', '1920-12-10'),
('Antoine de Saint-Exupéry', 'Francesa', '1900-06-29'),
('Dennis Ritchie', 'Americana', '1941-09-09'),
('Andrew S. Tanenbaum', 'Holandesa', '1944-03-16'),
('Hans Kelsen', 'Austríaca', '1881-10-11'),
('Humberto Theodoro Júnior', 'Brasileira', '1933-01-01'),
('Bruce Eckel', 'Americana', '1957-03-01'),
('Richard Feynman', 'Americana', '1918-05-11'),
('Carl Sagan', 'Americana', '1934-11-09'),
('Stephen Hawking', 'Britânica', '1942-01-08'),
('Bill Bryson', 'Americana', '1951-12-08'),
('Charles Darwin', 'Britânica', '1809-02-12'),
('Peter Wohlleben', 'Alemã', '1964-06-10'),
('Edward O. Wilson', 'Americana', '1929-06-10'),
('Bruce Lipton', 'Americana', '1944-10-21'),
('Lavoisier', 'Francesa', '1743-08-26'),
('Sérgio Ferro', 'Brasileira', '1938-01-01'),
('Hutton James', 'Escocesa', '1726-06-03'),
('Mary Anning', 'Britânica', '1799-05-21'),
('James Gosling', 'Canadense', '1955-05-19'),
('Hans Kelsen', 'Austríaca', '1881-10-11'),
('John Rawls', 'Americana', '1921-02-21'),
('Immanuel Kant', 'Alemã', '1724-04-22'),
('Durkheim Émile', 'Francesa', '1858-04-15'),
('Noam Chomsky', 'Americana', '1928-12-07'),
('Vitruvio', 'Romana', '0070-01-01'),
('Sebastião Salgado', 'Brasileira', '1944-02-08'),
('Laurentino Gomes', 'Brasileira', '1956-02-01'),
('Chinua Achebe', 'Nigeriana', '1930-11-16'),
('Achille Mbembe', 'Camaronesa', '1957-07-27');

-- insert na tabela livro 
INSERT INTO livro (cdd_cod, isbn, titulo, ano_publicacao, disponibilidade, edicao, editora) VALUES
('823', '978-0451524935', '1984', '1949-06-08', 1, 1, 'Companhia das Letras'),
('823', '978-0141439518', 'Orgulho e Preconceito', '1813-01-28', 1, 2, 'Penguin'),
('100', '978-0140449273', 'A República', '380-01-01', 1, 5, 'Penguin Classics'),
('100', '978-0486424645', 'Segundo Tratado sobre o Governo', '1689-01-01', 1, 3, 'Dover Publications'),
('320', '978-0192805570', 'O Príncipe', '1532-01-01', 1, 4, 'Oxford Press'),
('320', '978-0140449105', 'O Contrato Social', '1762-01-01', 1, 2, 'Penguin'),
('300', '978-0143036814', 'O Capital', '1867-01-01', 1, 1, 'Penguin Classics'),
('300', '978-0199535071', 'Direito e Democracia', '1980-01-01', 1, 2, 'Oxford'),
('808', '978-8535919641', 'O Pequeno Príncipe', '1943-04-06', 1, 3, 'Agir'),
('004', '978-0131103627', 'The C Programming Language', '1978-01-01', 1, 2, 'Prentice Hall'),
('004', '978-0133594140', 'Sistemas Operacionais Modernos', '2014-03-06', 1, 4, 'Pearson'),
('342', '978-8520345293', 'Teoria Pura do Direito', '1934-01-01', 1, 7, 'Editora Atlas'),
('347', '978-8502055935', 'Curso de Direito Processual Civil', '2001-01-01', 1, 10, 'Forense'),
('340', '978-8530965413', 'Introdução ao Estudo do Direito', '1950-01-01', 1, 5, 'Saraiva'),
('570', '978-8535919707', 'O Gene Egoísta', '1976-01-01', 1, 3, 'Companhia das Letras'),
('570', '978-8535919714', 'A Origem das Espécies', '1859-11-24', 1, 4, 'Martin Claret'),
('345', '978-8502055966', 'Direito Penal Brasileiro', '2005-01-01', 1, 5, 'Saraiva'),
('341', '978-8530965423', 'Manual de Direito Internacional Público', '2010-01-01', 1, 1, 'Lumen Juris'),
('005', '978-0132350884', 'Código Limpo', '2008-08-01', 1, 3, 'Alta Books'),
('629.8', '978-0072977189', 'Introduction to Autonomous Robots', '2011-01-01', 1, 2, 'MIT Press'),
('530', '978-8535919646', 'Uma Breve História do Tempo', '1988-04-01', 1, 3, 'Rocco'),
('520', '978-0345539434', 'Cosmos', '1980-01-01', 1, 5, 'Companhia das Letras'),
('500', '978-8535919677', 'A Incrível História do Universo', '2003-01-01', 1, 1, 'Rocco'),
('509', '978-8535919691', 'Uma Breve História de Quase Tudo', '2003-01-01', 1, 3, 'Companhia das Letras'),
('590', '978-8575422392', 'A Vida Secreta das Árvores', '2015-05-01', 1, 1, 'Sextante'),
('577', '978-8571645566', 'Sociobiologia: A Nova Síntese', '1975-01-01', 1, 2, 'Cia. das Letras'),
('579', '978-8535919745', 'A Biologia da Crença', '2006-01-01', 1, 1, 'Cultrix'),
('660', '978-0133095410', 'Chemical Engineering Design', '2012-01-01', 1, 1, 'Elsevier'),
('690', '978-8571947936', 'Patologia das Construções', '2008-01-01', 1, 1, 'Oficina de Textos'),
('550', '978-8573938673', 'Geologia Ambiental', '2009-01-01', 1, 1, 'Bookman'),
('560', '978-8535919701', 'O Mundo Perdido dos Dinossauros', '2010-01-01', 1, 1, 'Companhia das Letras'),
('681.3', '978-8575224019', 'Estruturas de Computadores', '2015-01-01', 1, 2, 'Pearson'),
('343', '978-8597017732', 'Direito Administrativo Brasileiro', '2023-08-01', 1, 1, 'Malheiros Editores'),
('344', '978-8597017749', 'Direito do Trabalho Brasileiro', '2022-05-01', 1, 1, 'Saraiva'),
('160', '978-8535919501', 'Lógica Formal', '1998-01-01', 1, 1, 'Editora Atlas'),
('170', '978-8535919502', 'Fundamentação da Metafísica dos Costumes', '1785-01-01', 1, 2, 'Companhia das Letras'),
('200', '978-8535919503', 'Deus, um Delírio', '2006-01-01', 1, 3, 'Companhia das Letras'),
('460', '978-8535919504', 'Gramática da Língua Portuguesa', '1990-01-01', 1, 2, 'Saraiva'),
('470', '978-8535919505', 'Gramática Latina', '1975-01-01', 1, 1, 'Editora Vozes'),
('620', '978-0132712875', 'Engineering Mechanics: Dynamics', '2013-01-01', 1, 4, 'Pearson'),
('710', '978-8535919506', 'Urbanismo Contemporâneo', '2010-01-01', 1, 1, 'Bookman'),
('770', '978-8535919507', 'Fotografia: Uma História Visual', '2005-01-01', 1, 1, 'Sextante'),
('980', '978-8535919508', '1808', '2007-01-01', 1, 2, 'Globo Livros'),
('960', '978-8535919509', 'Coisas Desmoronam', '1958-01-01', 1, 1, 'Companhia das Letras'),
('380', '978-8535919510', 'A História das Coisas', '2007-01-01', 1, 1, 'Editora Record'),
('110', '978-8535919511', 'Crítica da Razão Pura', '1781-01-01', 1, 2, 'Companhia das Letras'),
('320', '9788566943504', 'Necropolítica: Biopoder, Soberania, Estado de Exceção, Política da Morte', '2018-01-01','1','1', 'N-1 Edições');

-- insert na tabela livro_autor
INSERT INTO livro_autor (livro_id, autor_id) VALUES
(87, 79),
(88, 86),
(89, 81),
(90, 82),
(91, 84),
(92, 109),
(93, 83),
(94, 84),
(95, 89),
(96, 90),
(97, 91),
(98, 92),
(99, 93),
(100, 92),
(101, 101),
(102, 99),
(103, 92),
(104, 92),
(105, 94),
(106, 107),
(107, 97),
(108, 96),
(109, 98),
(110, 98),
(111, 100),
(112, 101),
(113, 102),
(114, 103),
(115, 104),
(116, 105),
(117, 106),
(118, 107),
(119, 92),
(120, 92),
(121, 110),
(122, 110),
(123, 96),
(124, 112),
(125, 113),
(126, 104),
(127, 113),
(128, 114),
(129, 115),
(130, 116),
(131, 98),
(132, 110),
(133, 117);

-- insert na tabela usuario
INSERT INTO usuario(nome, email, telefone, dt_cadastro, cargo) VALUES
('Ana Clara Carvalho', 'anaclara.carvalho@gmail.com', '61981001001', '2024-01-15', 'estudante graduacao'),
('Julia Mesquita', 'julia.mesquita@hotmail.com', '61981001002', '2024-02-20', 'estudante graduacao'),
('Pedro Henrique Vasconcelos', 'pedro.vasconcelos@yahoo.com.br', '61981001003', '2024-03-10', 'estudante graduacao'),
('Ruama Haabia', 'ruama.haabia@yahoo.com.br', '61981001004', '2024-04-05', 'estudante graduacao'),
('Sabrina Cardoso', 'sabrina.cardoso@gmail.com', '61981001005', '2024-05-12', 'estudante graduacao'),
('Caizo Demétrio', 'caizo.demetrio@hotmail.com', '61981001006', '2024-06-18', 'estudante graduacao'),
('Jhenifer Santos', 'jhennifer.santos@gmail.com', '61981001007', '2024-07-22', 'estudante pos-graduacao'),
('Lucas Nagamine', 'lucas.nagamine@yahoo.com.br', '61981001008', '2024-08-01', 'estudante pos-graduacao'),
('Mariana Vieira', 'mariana.vieira@hotmail.com', '61981001009', '2024-09-09', 'estudante pos-graduacao'),
('Andreia Freitas', 'andreia.freitas@gmail.com', '61981001010', '2024-10-14', 'estudante pos-graduacao'),
('Rafaela Guerra', 'rafaela.guerra@gmail.com', '61981001011', '2024-11-03', 'aluno pesquisa/extensao'),
('Maria Eduarda Barbosa', 'maria.barbosa@yahoo.com.br', '61981001012', '2024-12-07', 'aluno pesquisa/extensao'),
('Yan Miranda', 'yan.miranda@gmail.com', '61981001013', '2025-01-25', 'aluno pesquisa/extensao'),
('Thalisson Sousa', 'thalisson.sousa@hotmail.com', '61981001014', '2025-02-28', 'aluno pesquisa/extensao'),
('Tiago Maciel', 'tiago.maciel@hotmail.com', '61981001015', '2025-03-17', 'aluno pesquisa/extensao'),
('Lindomar Carvalho', 'lindomar.carvalho@hotmail.com', '61981001016', '2025-04-01', 'publico externo'),
('Yasmin Correia', 'yasmin.correia@uni.com.br', '61981001017', '2025-05-08', 'funcionario'),
('Arthur Esaki', 'arthur.esaki@yahoo.com.br', '61981001018', '2024-08-15', 'estudante pos-graduacao'),
('Rillary Gabriela', 'rillary.gabriela@gmail.com', '61981001019', '2025-04-10', 'publico externo'),
('Yan Oliveira', 'yan.oliveira@hotmail.com', '61981001020', '2025-04-12', 'publico externo'),
('Isabela Paes', 'isabela.paes@yahoo.com.br', '61981001021', '2024-09-01', 'estudante pos-graduacao'),
('Marcio Louzeiro', 'marcio.louzeiro@gmail.com', '61981001022', '2024-11-20', 'aluno pesquisa/extensao'),
('Ricardo Alves', 'ricardo.alves@uni.com.br', '61981001023', '2025-05-10', 'funcionario'),
('Ana Júlia Moura', 'anajulia.moura@gmail.com', '61981001024', '2024-01-20', 'estudante graduacao'),
('Rafael Lopes', 'rafael.lopes@hotmail.com', '61981001025', '2024-03-01', 'estudante graduacao'),
('João Otto', 'joao.otto@gmail.com', '61981001026', '2024-04-15', 'estudante graduacao'),
('Davi Vidal', 'davi.vidal@gmail.com', '61981001027', '2024-05-20', 'estudante graduacao'),
('Carolyne Souza', 'carolyne.souza@hotmail.com', '61981001028', '2024-06-25', 'estudante graduacao'),
('Charles Alves', 'charles.alves@uni.com.br', '61981001029', '2023-01-05', 'professor'),
('Francisco Molina', 'francisco.molina@uni.com.br', '61981001030', '2023-02-10', 'professor'),
('Daniela Barros', 'daniela.barros@uni.com.br', '61981001031', '2023-03-15', 'professor'),
('Rogério Alves', 'rogerio.alves@uni.com.br', '61981001032', '2023-04-20', 'professor'),
('Denys Silva', 'denys.silva@uni.com.br', '61981001033', '2023-05-25', 'professor'),
('José Wellington Silva', 'josewellington.silva@uni.com.br', '61981001034', '2023-06-30', 'professor'),
('Leonardo Ferreira', 'leonardo.ferreira@uni.com.br', '61981001035', '2023-07-01', 'professor'),
('Keila Moraes', 'keila.moraes@uni.com.br', '61981001036', '2023-08-05', 'professor'),
('Laís Castro', 'lais.castro@uni.com.br', '61981001037', '2023-09-10', 'professor'),
('Juliana Nogueira', 'juliana.nogueira@uni.com.br', '61981001038', '2023-10-15', 'professor'),
('Flávio Marques', 'flavio.marques@uni.com.br', '61981001039', '2023-11-20', 'professor'),
('Dalci Freitas Louzeiro', 'dalci.louzeiro@yahoo.com.br', '61981001040', '2025-04-05', 'publico externo');

-- insert tabela emprestimo 
INSERT INTO emprestimo(usuario_id, livro_id, dt_emprestimo, dt_devolucao_prevista, dt_devolucao_real, status, observacao, multa, renovacao) VALUES
(1, 87, '2025-05-01', '2025-05-15 17:00:00', '2025-05-14 10:00:00', 'devolvido', 'Livro em perfeito estado', 0.00, 0),
(2, 88, '2025-05-02', '2025-05-16 17:00:00', '2025-05-17 10:00:00', 'atrasado', 'Devolução com 1 dia de atraso', 0.00, 0),
(3, 89, '2025-05-03', '2025-05-17 17:00:00', '2025-05-16 15:00:00', 'devolvido', 'Ok', 0.00, 0),
(4, 90, '2025-05-04', '2025-05-18 17:00:00', '2025-05-04 10:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(5, 91, '2025-05-05', '2025-05-19 17:00:00', '2025-05-20 12:00:00', 'atrasado', 'Devolução com 1 dia de atraso', 0.00, 0),
(6, 92, '2025-05-06', '2025-05-20 17:00:00', '2025-05-20 10:00:00', 'devolvido', 'Sem observações', 0.00, 0),
(7, 93, '2025-05-07', '2025-05-21 17:00:00', '2025-05-07 11:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(8, 94, '2025-05-08', '2025-05-22 17:00:00', '2025-05-22 18:00:00', 'atrasado', 'Devolução com algumas horas de atraso', 0.00, 0),
(9, 95, '2025-05-09', '2025-05-23 17:00:00', '2025-05-23 15:00:00', 'devolvido', 'Tudo certo', 0.00, 0),
(10, 96, '2025-05-10', '2025-05-24 17:00:00', '2025-05-10 09:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(11, 97, '2025-05-11', '2025-05-25 17:00:00', '2025-05-11 14:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(12, 98, '2025-05-12', '2025-05-26 17:00:00', '2025-05-12 16:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(13, 99, '2025-05-13', '2025-05-27 17:00:00', '2025-05-13 09:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(14, 100, '2025-05-14', '2025-05-28 17:00:00', '2025-05-14 13:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(15, 101, '2025-05-15', '2025-05-29 17:00:00', '2025-05-15 10:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(16, 102, '2025-05-16', '2025-05-30 17:00:00', '2025-05-16 11:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(17, 103, '2025-05-17', '2025-05-31 17:00:00', '2025-05-17 12:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(18, 104, '2025-05-18', '2025-06-01 17:00:00', '2025-05-18 15:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(19, 105, '2025-05-19', '2025-06-02 17:00:00', '2025-05-19 16:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(20, 106, '2025-05-20', '2025-06-03 17:00:00', '2025-05-20 10:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(1, 107, '2025-04-25', '2025-05-09 17:00:00', '2025-05-10 09:00:00', 'atrasado', 'Devolvido com atraso', 0.00, 0),
(2, 108, '2025-04-26', '2025-05-10 17:00:00', '2025-05-09 14:00:00', 'devolvido', 'Ok', 0.00, 0),
(3, 109, '2025-04-27', '2025-05-11 17:00:00', '2025-04-27 10:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(4, 110, '2025-04-28', '2025-05-12 17:00:00', '2025-05-20 11:00:00', 'atrasado', 'Atraso considerável', 0.00, 0),
(5, 111, '2025-04-29', '2025-05-13 17:00:00', '2025-05-12 15:00:00', 'devolvido', 'Livro em bom estado', 0.00, 0),
(6, 112, '2025-04-30', '2025-05-14 17:00:00', '2025-04-30 09:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(7, 113, '2025-05-01', '2025-05-15 17:00:00', '2025-05-01 10:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(8, 114, '2025-05-02', '2025-05-16 17:00:00', '2025-05-02 11:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(9, 115, '2025-05-03', '2025-05-17 17:00:00', '2025-05-03 12:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(10, 116, '2025-05-04', '2025-05-18 17:00:00', '2025-05-04 13:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(11, 117, '2025-05-05', '2025-05-19 17:00:00', '2025-05-05 14:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(12, 118, '2025-05-06', '2025-05-20 17:00:00', '2025-05-06 15:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(13, 119, '2025-05-07', '2025-05-21 17:00:00', '2025-05-07 16:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(14, 120, '2025-05-08', '2025-05-22 17:00:00', '2025-05-08 10:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(15, 121, '2025-05-09', '2025-05-23 17:00:00', '2025-05-09 11:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(16, 122, '2025-05-10', '2025-05-24 17:00:00', '2025-05-25 10:00:00', 'atrasado', 'Devolução atrasada, livro molhado', 0.00, 0),
(17, 123, '2025-05-11', '2025-05-25 17:00:00', '2025-05-11 12:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(18, 124, '2025-05-12', '2025-05-26 17:00:00', '2025-05-12 13:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(19, 125, '2025-05-13', '2025-05-27 17:00:00', '2025-05-13 14:00:00', 'em andamento', 'Em andamento', 0.00, 0),
(20, 126, '2025-05-14', '2025-05-28 17:00:00', '2025-05-14 15:00:00', 'em andamento', 'Em andamento', 0.00, 0);

-- insert na tabela reserva
INSERT INTO reserva(livro_id, usuario_id, dt_reserva, status, dt_expiracao) VALUES 
(127, 1, '2025-04-28', 'efetivada', '2025-05-01 17:00:00'),
(128, 2, '2025-04-29', 'cancelada', '2025-05-02 17:00:00'),
(129, 3, '2025-04-30', 'efetivada', '2025-05-03 17:00:00'),
(130, 4, '2025-05-01', 'ativa', '2025-05-04 17:00:00'),
(131, 5, '2025-05-02', 'efetivada', '2025-05-05 17:00:00'),
(132, 6, '2025-05-03', 'ativa', '2025-05-06 17:00:00'),
(133, 7, '2025-05-04', 'ativa', '2025-05-07 17:00:00'),
(128, 8, '2025-05-05', 'efetivada', '2025-05-08 17:00:00'),
(95, 9, '2025-05-06', 'ativa', '2025-05-09 17:00:00'),
(96, 10, '2025-05-07', 'ativa', '2025-05-10 17:00:00'),
(97, 11, '2025-05-08', 'ativa', '2025-05-11 17:00:00'),
(98, 12, '2025-05-09', 'ativa', '2025-05-12 17:00:00'),
(99, 13, '2025-05-10', 'ativa', '2025-05-13 17:00:00'),
(100, 14, '2025-05-11', 'ativa', '2025-05-14 17:00:00'),
(101, 15, '2025-05-12', 'ativa', '2025-05-15 17:00:00'),
(102, 16, '2025-05-13', 'ativa', '2025-05-16 17:00:00'),
(88, 17, '2025-05-14', 'ativa', '2025-05-17 17:00:00'),
(89, 18, '2025-05-15', 'ativa', '2025-05-18 17:00:00'),
(90, 19, '2025-05-16', 'ativa', '2025-05-19 17:00:00'),
(91, 20, '2025-05-17', 'ativa', '2025-05-20 17:00:00'),
(92, 1, '2025-04-25', 'expirada', '2025-04-28 17:00:00'),
(93, 2, '2025-04-26', 'ativa', '2025-04-29 17:00:00'),
(94, 3, '2025-04-27', 'ativa', '2025-04-30 17:00:00'),
(95, 4, '2025-04-28', 'cancelada', '2025-05-01 17:00:00'),
(96, 5, '2025-04-29', 'ativa', '2025-05-02 17:00:00'),
(99, 6, '2025-04-30', 'ativa', '2025-05-03 17:00:00'),
(97, 7, '2025-05-01', 'ativa', '2025-05-04 17:00:00'),
(98, 8, '2025-05-02', 'ativa', '2025-05-05 17:00:00'),
(99, 9, '2025-05-03', 'ativa', '2025-05-06 17:00:00'),
(103, 10, '2025-05-04', 'ativa', '2025-05-07 17:00:00'),
(104, 11, '2025-05-05', 'ativa', '2025-05-08 17:00:00'),
(105, 12, '2025-05-06', 'ativa', '2025-05-09 17:00:00'),
(106, 13, '2025-05-07', 'ativa', '2025-05-10 17:00:00'),
(107, 14, '2025-05-08', 'ativa', '2025-05-11 17:00:00'),
(108, 15, '2025-05-09', 'ativa', '2025-05-12 17:00:00'),
(109, 16, '2025-05-10', 'ativa', '2025-05-13 17:00:00'),
(110, 17, '2025-05-11', 'ativa', '2025-05-14 17:00:00'),
(111, 18, '2025-05-12', 'ativa', '2025-05-15 17:00:00'),
(112, 19, '2025-05-13', 'ativa', '2025-05-16 17:00:00'),
(113, 20, '2025-05-14', 'ativa', '2025-05-17 17:00:00');
