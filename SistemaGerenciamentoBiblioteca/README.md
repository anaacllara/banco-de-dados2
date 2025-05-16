# 📘 Documentação do Banco de Dados

## 1. Objetivo do Sistema de Gerenciamento de Biblioteca
É um sistema para universidades. Ele registra informações sobre livros, autores, usuários, empréstimos, reservas, histórico de empréstimos e devoluções. 
Além de possui usuários criados em servidor Linux Ubuntu, para garantir segurança e permissões de acessos

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
> <img src="SistemaGerenciamentoBiblioteca\Diagrama Entidade-Relacionamento.png" alt="Diagrama Sistema de Gerenciamento Biblioteca">

### 3.2 Descrição das Tabelas

#### 🗂️ Tabela: `cdd`
**Descrição:** Armazena dados da Classificação Decimal de Dewey(CDD), que auxilia na organização dos livros por categorias e subcategorias.

| Coluna         | Tipo          | Descrição                  | Restrições                |
|----------------|---------------|----------------------------|----------------------------|
| cod     | VARCHAR(20)           | Identificador do livro por categoria        | PK, NOT NULL         |
| descricao           | VARCHAR(250)  | Descreve em qual classe o livro pertence              | NOT NULL                   |


---

#### 🗂️ Tabela: `produtos`
**Descrição:** Armazena os produtos disponíveis.

| Coluna        | Tipo          | Descrição              | Restrições         |
|---------------|---------------|------------------------|---------------------|
| id_produto    | INT           | Identificador do produto | PK, AUTO_INCREMENT |
| nome          | VARCHAR(100)  | Nome do produto         | NOT NULL           |
| preco         | DECIMAL(10,2) | Preço unitário          | NOT NULL           |
| estoque       | INT           | Quantidade em estoque   | DEFAULT 0          |

*(Repita para outras tabelas como pedidos, itens_pedido, etc.)*

---

## 4. Regras de Negócio
- Um autor pode ter vários livros
- Um livro pode ter vários autores
- Alunos de Graduação da Instituição podem pegar até 4 livros por 2 semanas, com direito a uma renovação
- Estudantes de fora da Instituição podem pegar até 2 livros por 2 semanas, com direito a uma renovação
- Professores, alunos de pós-graduação e funcionários podem pegar até 5 livros por 2 semanas, com direito a duas renovações. 
- Ao reservar um livro, o prazo limite para realizar o empréstimo é de 3 dias úteis.

---

## 5. Script de Criação
```sql
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_cadastro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT DEFAULT 0
);
-- Demais scripts aqui

[def]: istemaGerenciamen