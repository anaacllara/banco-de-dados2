#! /bin/bash 

echo "Criando diretório..."
mkdir /publica

echo "Diretório criado!"

echo "Criando grupo Biblioteca e usuários..."
groupadd biblioteca
useradd desenvolvedor -m -c "João Doe" -s /bin/bash -p "$(openssl passwd -6 senha123)" -G biblioteca
passwd --expire desenvolvedor
useradd adm_bd -m -c "Jane Doe" -s /bin/bash -p "$(openssl passwd -6 senha123)" -G biblioteca
passwd --expire adm_bd
echo "Grupo e usuários criados!"

echo "Instalando o MySQL, se for necessário..."
apt update
apt install mysql-server -y 

echo "Entrando no MySQL e criando usuários e o banco de dados"
mysql -u root -p <<EOF
CREATE DATABASE IF NOT EXIST sgBiblioteca;

-- criar usuarios no MySQL
CREATE USER 'desenvolvedor'@'localhost' IDENTIFIED BY 'senha123';
CREATE USER 'adm_bd'@'localhost' IDENTIFIED BY 'senha456';

-- conceder permissoes
GRANT SELECT, INSERT, UPDATE ON sgBiblioteca.* TO 'desenvolvedor'@'localhost'; 
GRANT ALL PRIVILEGES ON sgBiblioteca.* TO 'adm_bd'@'localhost';
FLUSH PRIVILEGES;

-- criar tabelas 
CREATE TABLE cdd(
    cod VARCHAR(20) PRIMARY KEY NOT NULL,
    descricao VARCHAR(250) NOT NULL
);

CREATE TABLE livro(
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    cdd_cod VARCHAR(20) NOT NULL, 
    isbn VARCHAR(14) UNIQUE,
    titulo VARCHAR(500) NOT NULL, 
    ano_publicacao DATE NOT NULL, 
    disponibilidade TINYINT(1) NOT NULL,
    edicao SMALLINT(2) NOT NULL,
    editora VARCHAR(200) DEFAULT('autopublicacao') NOT NULL,
    FOREIGN KEY(cdd_cod) REFERENCES cdd(cod)
);

CREATE TABLE autor(
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(250) NOT NULL,
    nascionalidade VARCHAR(100) NOT NULL,
    dt_nascimento DATE NOT NULL
);

CREATE TABLE livro_autor(
    livro_id INT NOT NULL,
    autor_id INT NOT NULL, 
    FOREIGN KEY (livro_id) REFERENCES livro(id),
    FOREIGN KEY (autor_id) REFERENCES autor(id)
);

CREATE TABLE usuario(
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(200) NOT NULL, 
    email VARCHAR(200) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL UNIQUE,
    dt_cadastro DATE NOT NULL, 
    cargo ENUM('estudante graduacao', 'estudante pos-graduacao', 'aluno pesquisa/extensao', 'publico externo', 'funcionario', 'professor') NOT NULL
);

CREATE TABLE emprestimo(
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    usuario_id INT NOT NULL, 
    livro_id INT NOT NULL,
    dt_emprestimo DATE NOT NULL, 
    dt_devolucao_prevista DATETIME NOT NULL, 
    dt_devolucao_real DATETIME NOT NULL, 
    status ENUM('em andamento', 'devolvido', 'renovado', 'atrasado') NOT NULL, 
    observacao VARCHAR(250) NOT NULL, 
    multa DECIMAL(6,2) DEFAULT 0.00, 
    renovacao INT NOT NULL DEFAULT 0, 
    FOREIGN KEY (livro_id) REFERENCES livro(id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);
CREATE TABLE reserva(
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE, 
    livro_id INT NOT NULL, 
    usuario_id INT NOT NULL, 
    dt_reserva DATE NOT NULL, 
    status ENUM('ativa', 'efetivada', 'expirada', 'cancelada', 'sem reserva') NOT NULL, 
    dt_expiracao DATETIME NOT NULL, 
    FOREIGN KEY (livro_id) REFERENCES livro(id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

-- criar trigger para impedir empréstimo se tiver multa
DELIMITER // 
CREATE TRIGGER trg_bloquear_multa
BEFORE INSERT ON emprestimo
FOR EACH ROW 
BEGIN 
    DECLARE multa_usuario DECIMAL(6,2) DEFAULT 0;
    SELECT SUM(multa) INTO multa_usuario
    FROM emprestimo 
    WHERE usuario_id = NEW.usuario_id AND multa> 0;

    IF multa_usuario IS NOT NULL AND multa_usuario > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário com multa pendente não realiza empréstimo!'; 
    END IF;
END;
//
DELIMITER ; 

-- regras de empréstimo para cada tipo de usuário 
DELIMITER //
CREATE TRIGGER trg_limite_emprestimo
BEFORE INSERT ON emprestimo 
FOR EACH ROW 
BEGIN 
    DECLARE qtd INT DEFAULT 0;
    DECLARE limite INT DEFAULT 0;
    DECLARE tipo_usuario ENUM('estudante graduacao', 'estudante pos-graduacao', 'aluno pesquisa/extensao', 'publico externo', 'funcionario', 'professor');

    SELECT COUNT(*) INTO qtd FROM emprestimo
    WHERE usuario_id = NEW.usuario_id AND status IN ('em andamento', 'renovado');

    SELECT cargo INTO tipo_usuario FROM usuario WHERE id = NEW. usuario_id;

    SET limite = CASE
        WHEN tipo_usuario = 'estudante graduacao' THEN 4
        WHEN tipo_usuario = 'publico externo' THEN 2
        WHEN tipo_usuario IN ('professor', 'funcionario', 'estudante pos-graduacao', 'aluno pesquisa/extensao') THEN 5
        ELSE 0
    END; 

    IF qtd >= limite THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário atingiu o limite de empréstimos.';
    END IF;
END;
//
DELIMITER ;
EOF
echo "Usuários, Tabelas e Triggers criados!"
