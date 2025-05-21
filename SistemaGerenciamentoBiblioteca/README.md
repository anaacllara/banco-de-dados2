# Documentação do Banco de Dados

## 1. Objetivo do Sistema de Gerenciamento de Biblioteca
É um sistema para universidades. Ele registra informações sobre livros, autores, usuários, empréstimos, reservas, histórico de empréstimos e devoluções. 
Além de possuir usuários criados em servidor Linux Ubuntu, por meio de scripts, para garantir segurança e permissões de acessos. 

---

## 2. Requisitos

### 2.1 Requisitos Funcionais
- [ ] Registrar informações sobre livros e autores
- [ ] Registrar informações sobre usuários (alunos, comunidade e professores)
- [ ] Registrar informações sobre empréstimos
- [ ] Registrar informações sobre reservas

### 2.2 Requisitos Não Funcionais
- [ ] Permissão de acesso para funcionários da universidade para realizar consultas e atualizar dados
- [ ] Permissão de acesso ao administrador do banco de dados como root
- [ ] Permissão de acesso aos desenvolvedores 
- [ ] Incluir o ISBN dos livros
- [ ] Incluir o CDD (Classificação Decimal de Dewey)

---

## 3. Modelagem de Dados

### 3.1 Diagrama Entidade-Relacionamento (ER)
> <img src="/SistemaGerenciamentoBiblioteca/Diagrama ER.png" alt="Diagrama Sistema de Gerenciamento Biblioteca">

### 3.2 Descrição das Tabelas

#### 🗂️ Tabela: `cdd`
**Descrição:** Armazena dados da Classificação Decimal de Dewey(CDD), que auxilia na organização dos livros por categorias e subcategorias.

| Coluna         | Tipo          | Descrição                  | Restrições                |
|----------------|---------------|----------------------------|----------------------------|
| cod            | VARCHAR(20)   | Identificador do livro por categoria        | PK, NOT NULL |
| descricao      | VARCHAR(250)  | Descreve em qual classe o livro pertence    | NOT NULL     |

---
#### 🗂️ Tabela: `livro`
**Descrição:** Armazena os dados dos livros.

| Coluna        | Tipo          | Descrição              | Restrições         |
|---------------|---------------|------------------------|---------------------|
| id            | INT           | Identificador do livro | PK, AUTO_INCREMENT, UNIQUE |
| cdd_cod       | VARCHAR(20)   | Chave estrangeira da tabela cdd         | FK, NOT NULL           |
| isbn          | VARCHAR(14)   | Padrão internacional de numeração de livros          | UNIQUE           |
| titulo        | VARCHAR(500)  | Título do Livro   | NOT NULL                 |
| ano_publicacao| DATE          | Ano da Publicaçao do Livro | NOT NULL|
| disponibilidade| TINYINT(1)   | Disponibilidade do Livro (TRUE/FALSE)| NOT NULL|
| edicao        | SMALLINT(2)    | Edição do Livro        | NOT NULL           |
| editora       | VARCHAR(200)  | Editora do Livro       | NOT NULL, DEFALUT/EXPRESSION ('autopublicacao')|

---
#### 🗂️ Tabela: `autor`
**Descrição:** Armazena os dados dos autores.

| Coluna        | Tipo          | Descrição              | Restrições         |
|---------------|---------------|------------------------|---------------------|
| id            | INT           | Identificador do autor | PK, AUTO_INCREMENT, UNIQUE |
| nome          | VARCHAR(250)  | Nome do Autor          | NOT NULL            |
| nascionalidade| VARCHAR(100)  | Nascionalidade do Autor| NOT NULL            |
| dt_nascimento | DATE          | Data de nascimento do Autor   | NOT NULL     |

---
#### 🗂️ Tabela de Relacionamento: `livro_autor`
**Descrição:** Tabela de Relacionamento entre as tabelas "livro" e "autor"

| Coluna        | Tipo          | Descrição              | Restrições         |
|---------------|---------------|------------------------|---------------------|
| id_livro      | INT           | Chave estrangeira da tabela Livro | FK |
| id_autor      | INT           | Chave estrangeira da tabela Autor | FK |

---
#### 🗂️ Tabela: `usuário`
**Descrição:** Armazena os dados dos usuários que utilizam o sistema da biblioteca.

| Coluna        | Tipo          | Descrição              | Restrições         |
|---------------|---------------|------------------------|---------------------|
| id            | INT           | Identificador do usuário| PK, NOT NULL, AUTO_INCREMENT, UNIQUE |
| nome          | VARCHAR(200)  | Nome do Usuário        | NOT NULL            |
| email         | VARCHAR(200)  | Email do Usuário       | NOT NULL, UNIQUE    |
| telefone      | VARCHAR(15)   | Número de telefone do Usuári | NOT NULL, UNIQUE |
| dt_cadastro   | DATE          | Data do Cadastro do Usuário | NOT NULL|
| cargo         | ENUM('estudante graduacao', 'estudante pos-graduacao', 'aluno pesquisa/extensao', 'publico externo', 'funcionario', 'professor')| Ocupação do usuário | NOT NULL|

---
#### 🗂️ Tabela: `emprestimo`
**Descrição:** Armazena os dados dos empréstimos dos livros.

| Coluna        | Tipo          | Descrição              | Restrições         |
|---------------|---------------|------------------------|---------------------|
| id            | INT           | Identificador do Empréstimo | PK, NOT NULL, AUTO_INCREMENT, UNIQUE |
| usuario_id    | INT           | Chave estrangeira da tabela Usuário | FK, NOT NULL |
| livro_id      | INT           | Chave estrangeira da tabela Livro   | FK, NOT NULL|
| dt_emprestimo | DATETIME      | Data do empréstimo do livro | NOT NULL       |
| dt_devolucao_prevista| DATETIME   | Data da devolução prevista | NOT NULL|
| dt_devolucao_real| DATETIME   | Data devolução real, se houver renovação do emprestimo   | NOT NULL|
| status        | ENUM('em andamento', 'devolvido', 'renovado', 'atrasado')| Situação que se encontra o empréstimo do livro | NOT NULL |
| observação    | VARCHAR(250)  | Observação sobre o estado do livro antes e depois do empréstimo | NOT NULL |
| multa         | DECIMAL(6,2)  | Multa a ser aplicada caso haja atraso | DEFAULT/EXPRESSION 0.00 |
| renovacao     | INT           | Número de vezes que o empréstimo foi renovado | NOT NULL, DEFAULT 0 | 

---
#### 🗂️ Tabela: `reserva`
**Descrição:** Armazena os dados sobre reservas de livros.

| Coluna        | Tipo          | Descrição              | Restrições         |
|---------------|---------------|------------------------|---------------------|
| id            | INT           | Identificador da reserva| PK, NOT NULL, AUTO_INCREMENT, UNIQUE |
| livro_id      | INT           | Chave estrangeira da tabela livro | FK, NOT NULL|
| usuario_id    | INT           | Chave estrangeira da tabela usuario | FK, NOT NULL |
| dt_reserva    | DATE          | Data em que a reserva foi efetuada   | NOT NULL  |
| status        | ENUM('ativa', 'efetivada', 'expirada', 'cancelada', 'sem reserva')| Status da reserva| NOT NULL|
| dt_expiracao  | DATETIME      | Data em que a reserva expira| NOT NULL|

---
#### 🗂️ Tabela: `regra_usuario`
**Descrição:** Armazena regras de negócios dos usuários e auxilia na criação de triggers.

| Coluna        | Tipo          | Descrição              | Restrições         |
|---------------|---------------|------------------------|---------------------|
| cargo         | ENUM('estudante graduacao', 'estudante pos-graduacao', 'aluno pesquisa/extensao', 'publico externo', 'funcionario', 'professor') | Identificador das regras| PK |
| max_livros    | INT           | Quantidade máxima de livros que podem ser emprestados | NOT NULL|
| max_renovacoes| INT           | Qauntidade máxima de renovações que um usuário pode efetuar | NOT NULL |

---
### ⚠️ Triggers 
### Tabela `emprestimo`
#### trg_bloquear_multa
> **Objetivo:** Impedir que um usuário com multa pendente realize empréstimo. 
>**Tipo:** BEFORE INSERT 

#### trg_limite_emprestimo
> **Objetivo:** Verifica se o usuário já atingiu o limite de empréstimos.  
>**Tipo:** BEFORE INSERT

---
## 💼 4. Regras de Negócio
- Um autor pode ter vários livros
- Um livro pode ter vários autores
- O sistema deve fornecer opções para autor que se autopublicou
- Usuários com multa ativa não devem realizar empréstimos
- Alunos de Graduação da Instituição podem pegar até 4 livros por 2 semanas, com direito a uma renovação
- Estudantes de fora da Instituição podem pegar até 2 livros por 2 semanas, com direito a uma renovação
- Professores, alunos de pós-graduação e funcionários podem pegar até 5 livros por 2 semanas, com direito a duas renovações. 

---